//
//  ResultsViewController.m
//  MMoriIOS
//
//  Created by Jason Hoffman on 3/14/15.
//  Copyright (c) 2015 JHM. All rights reserved.
//

#import "ResultsViewController.h"
#import "GridView.h"

#define WORLD_POP_URL @"http://api.population.io:80/1.0/life-expectancy/remaining"

@interface ResultsViewController () <NSURLSessionDelegate>

@property (strong, nonatomic) NSURLSession *urlSession;
@property (strong, nonatomic) NSString *age;

@end

@implementation ResultsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIScrollView *scrollView = (UIScrollView *)self.view;
    [scrollView setContentSize:CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height * 1.5)];
    
    //Calculate age based on current date
    NSDate *today = [NSDate date];
    
    NSDateComponents* ageComponents = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:self.birthday toDate:today options:0];
    NSInteger age = [ageComponents year];
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
            NSLog(@"dict %@", dict);
            }
        
    }];
    
    [dataTask resume];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
