//
//  SubView.m
//  BezierPath
//
//  Created by gaowei on 2017/3/15.
//  Copyright © 2017年 none. All rights reserved.
//

#import "SubView.h"

@implementation SubView

- (void)drawRect:(CGRect)rect {
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(100 , 10)];
    [path addLineToPoint:CGPointMake(200, 10)];
    path.lineWidth = 15;
    path.lineCapStyle = kCGLineCapSquare;
    [[UIColor yellowColor] setStroke];
    [path stroke];
    
}


@end
