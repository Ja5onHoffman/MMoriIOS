//
//  GridVisualViewController.m
//  MMoriIOS
//
//  Created by Jason Hoffman on 3/24/15.
//  Copyright (c) 2015 JHM. All rights reserved.
//

#import "GridVisualViewController.h"
#import "GridView.h"

@interface GridVisualViewController () <UIScrollViewDelegate>

@property (strong, nonatomic) GridView *gridView;
@end

@implementation GridVisualViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gridView = [[GridView alloc] init];
    
    self.gridView.age = self.age;
    self.gridView.weeks = self.weeks;
    self.gridView.lifespan = self.lifespan;
    self.gridView.backgroundColor = [UIColor whiteColor];
    [self.gridView setFrame:CGRectMake(30, 100, 260, self.gridView.lifespan*5)];
    [self.view addSubview:self.gridView];
    
    [self.gridView setNeedsDisplay];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [(UIScrollView *)self.view setContentSize:CGSizeMake(self.view.bounds.size.width, self.gridView.size.height * 1.5)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touched:(UIGestureRecognizer *)recognizer
{
    NSLog(@"touched %@", self.view);
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"scroll");
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
