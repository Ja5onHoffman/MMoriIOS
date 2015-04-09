//
//  AboutViewController.m
//  MMoriIOS
//
//  Created by Jason Hoffman on 3/29/15.
//  Copyright (c) 2015 JHM. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@property (weak, nonatomic) IBOutlet UILabel *aboutLabel;

@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.aboutLabel.text = @"\"Memento Mori\", Latin for \"remember your mortality\" or \"remember you will die\", is the practice of reflecting on one's inevitable death as a reminder to live life to the fulluest or, in staying with the Latin theme, \"carpe diem\".\nThis site is inspired by a blog post I once read describing a U.S. Navy solider who carried around a Memento Mori sheet full of small squares, each representing one week of his life. At the end of the week he'd fill in a square, creating a graphic representation of his lifetime. I tried this myself. The picture is a powerful reminder of how little time we have, and how important it is to sieze the day.";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

- (IBAction)done:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
