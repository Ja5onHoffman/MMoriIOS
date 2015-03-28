//
//  GridView.m
//  MMoriIOS
//
//  Created by Jason Hoffman on 3/17/15.
//  Copyright (c) 2015 JHM. All rights reserved.
//

#import "GridView.h"

@implementation GridView

- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
    
    float age = roundf(self.age);
    NSLog(@"age %f", age);
    
    int j;
    int i;
    for (j = 0; j < self.age * 5; j+=5) {
        for (i = 0; i < 260; i+=5) {
            CGContextFillRect(context, CGRectMake(i, j, 4, 4));
        }
    }
    
    int w = 0;
    for (int x = 0; x < 260; x+=5) {
        if (w < self.weeks) {
            CGContextFillRect(context, CGRectMake(x, j, 4, 4));
            w++;
        } else {
            CGContextSetFillColorWithColor(context, [UIColor blueColor].CGColor);
            CGContextFillRect(context, CGRectMake(x, j, 4, 4));
        }
    }
    
    int rem = self.lifespan + (self.age + 1);
    NSLog(@"rem %d", rem);
    
    for (j+=5; j < self.lifespan * 5; j+=5) {
        for (i = 0; i < 260; i+=5) {
            CGContextFillRect(context, CGRectMake(i, j, 4, 4));
        }
    }
    
    self.size = CGSizeMake(260, j);
}

@end
