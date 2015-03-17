//
//  ResultsViewController.h
//  MMoriIOS
//
//  Created by Jason Hoffman on 3/14/15.
//  Copyright (c) 2015 JHM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultsViewController : UIViewController

@property (strong, nonatomic) NSDate *birthday;
@property (strong, nonatomic) NSString *country;
@property (nonatomic) NSInteger yearsAlive;
@property (strong, nonatomic) NSString *sex;

@end
