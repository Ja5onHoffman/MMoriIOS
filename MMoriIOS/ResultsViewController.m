//
//  ResultsViewController.m
//  MMoriIOS
//
//  Created by Jason Hoffman on 3/14/15.
//  Copyright (c) 2015 JHM. All rights reserved.
//

#import "ResultsViewController.h"

@interface ResultsViewController () <NSURLSessionDelegate>

@property (strong, nonatomic) NSURLSession *urlSession;

@end

@implementation ResultsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Calculate age based on current date
    NSDate *today = [NSDate date];
    
    NSDateComponents* ageComponents = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:self.birthday toDate:today options:0];
    NSInteger age = [ageComponents year];
    
    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    self.urlSession = [NSURLSession sessionWithConfiguration:config delegate:self delegateQueue:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)callWorldPopApi
{
    
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
