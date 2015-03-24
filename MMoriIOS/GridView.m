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
    
    for (int j = 0; j < 312; j+=6) {
        for (int i = 0; i < 312; i+=6) {
            CGContextFillRect(context, CGRectMake(i, j, 5, 5));
        }
    }
    
    
    
    
}

@end
