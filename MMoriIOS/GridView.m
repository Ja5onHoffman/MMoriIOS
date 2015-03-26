//
//  GridView.m
//  MMoriIOS
//
//  Created by Jason Hoffman on 3/17/15.
//  Copyright (c) 2015 JHM. All rights reserved.
//

#import "GridView.h"

@implementation GridView

UIImage *GridRect(UIColor *color, CGFloat side)
{
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(side, side), YES, 0.0);
    
    [color setFill];
    UIRectFill(CGRectMake(0, 0, side, side));
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}


- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
    
    float age = roundf(self.age);
    NSLog(@"age %f", age);
    
    int j;
    int i;
    for (j = 0; j < self.age * 6; j+=6) {
        for (i = 0; i < 312; i+=6) {
            CGContextFillRect(context, CGRectMake(i, j, 5, 5));
        }
    }
    
    int w = 0;
    for (int x = 0; x < 312; x+=6) {
        if (w < self.weeks) {
            CGContextFillRect(context, CGRectMake(x, j, 5, 5));
            w++;
        } else {
            CGContextSetFillColorWithColor(context, [UIColor blueColor].CGColor);
            CGContextFillRect(context, CGRectMake(x, j, 5, 5));
        }
    }
    
    int rem = self.lifespan + (self.age + 1);
    NSLog(@"rem %d", rem);
    
    for (j+=6; j < self.lifespan * 6; j+=6) {
        for (i = 0; i < 312; i+=6) {
            CGContextFillRect(context, CGRectMake(i, j, 5, 5));
        }
    }
}

@end
