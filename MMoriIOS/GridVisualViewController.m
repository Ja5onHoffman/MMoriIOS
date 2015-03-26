//
//  GridVisualViewController.m
//  MMoriIOS
//
//  Created by Jason Hoffman on 3/24/15.
//  Copyright (c) 2015 JHM. All rights reserved.
//

#import "GridVisualViewController.h"
#import "GridView.h"

@interface GridVisualViewController ()

@property (strong, nonatomic) IBOutlet GridView *gridView;

@end

@implementation GridVisualViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gridView.age = self.age;
    self.gridView.weeks = self.weeks;
    self.gridView.lifespan = self.lifespan;
    self.gridView.backgroundColor = [UIColor whiteColor];
    
    [self.gridView setNeedsDisplay];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
