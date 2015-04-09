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
@property (weak, nonatomic) IBOutlet UILabel *gridLabel;

@end

@implementation GridVisualViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gridView = [[GridView alloc] init];
    
    self.gridView.age = self.age;
    self.gridView.weeks = self.weeks;
    self.gridView.lifespan = self.lifespan;
    self.gridView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.gridView];
    
    float yPos = (self.view.frame.size.height / 3) + 40;
    float xPos = (self.view.frame.size.width / 2) - 130;
    [self.gridView setFrame:CGRectMake(xPos, yPos, 260, self.gridView.lifespan*5)];

    [self.gridView setNeedsDisplay];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [(UIScrollView *)self.view setContentSize:CGSizeMake(self.view.bounds.size.width, self.gridView.size.height * 1.5)];
    [(UIScrollView *)self.view setContentOffset:CGPointMake(0, 0) animated:YES];
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
