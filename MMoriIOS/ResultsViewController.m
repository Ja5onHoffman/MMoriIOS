//
//  ResultsViewController.m
//  MMoriIOS
//
//  Created by Jason Hoffman on 3/14/15.
//  Copyright (c) 2015 JHM. All rights reserved.
//

#import "ResultsViewController.h"
#import "GridVisualViewController.h"

#define WORLD_POP_URL @"http://api.population.io:80/1.0/life-expectancy/remaining"

@interface ResultsViewController () <NSURLSessionDelegate>

@property (strong, nonatomic) NSURLSession *urlSession;
@property (strong, nonatomic) NSString *age;
@property (nonatomic) int ageInt;
@property (nonatomic) int weeks;
@property (weak, nonatomic) IBOutlet UILabel *resultsLabel;

@end

@implementation ResultsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = NO;
    
    //Calculate age based on current date
    NSDate *today = [NSDate date];
    
    NSDateComponents* ageComponents = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitWeekOfYear | NSCalendarUnitDay) fromDate:self.birthday toDate:today options:0];
    NSInteger age = [ageComponents year];
    self.weeks = (int)[ageComponents weekOfYear];
    self.age = [NSString stringWithFormat:@"%ld", age];
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    self.urlSession = [NSURLSession sessionWithConfiguration:config delegate:self delegateQueue:nil];
    
    [self callWorldPopApi];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)callWorldPopApi
{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *dateString = [formatter stringFromDate:self.birthday];

    NSString *url = [NSString stringWithFormat:@"%@/%@/%@/%@/%@y/", WORLD_POP_URL, self.sex, self.country, dateString, self.age];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
    NSLog(@"url %@", url);
    NSLog(@"request %@", request);
    
    NSURLSessionDataTask *dataTask = [self.urlSession dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            NSLog(@"There was an error");
        } else {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            
            [self printResultsWithDict:dict];
            }
        
    }];
    
    [dataTask resume];
}

- (void)printResultsWithDict:(NSDictionary *)dict
{
    NSString *age = [dict objectForKey:@"age"];
    NSString *ageFormatted = [age substringToIndex:age.length -1];
    self.ageInt = [ageFormatted intValue];
    NSString *country = [dict objectForKey:@"country"];
    NSString *sex = [dict objectForKey:@"sex"];
    NSString *remainingLife = [dict objectForKey:@"remaining_life_expectancy"];
    
    NSString *labelText = [NSString stringWithFormat:@"According to The World Population Project, as a %@ year old %@ living in %@, your are expected to live for an additional %@ years.\n\nSpend them wisely!\n\nThe visualization is based on your expected lifespan input.", ageFormatted, sex, country, remainingLife];
    
    [self.resultsLabel sizeToFit];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        self.resultsLabel.text = labelText;
    });
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    GridVisualViewController *gvc = segue.destinationViewController;
    gvc.age = self.ageInt;
    gvc.weeks = self.weeks;
    gvc.lifespan = self.lifespan;
}


@end
