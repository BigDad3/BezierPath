//
//  SecondViewController.h
//  BezierPath
//
//  Created by gaowei on 2017/3/15.
//  Copyright © 2017年 none. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum BezierPathType{
    BezierPathTypeLine = 0,
    BezierPathArc,
    BezierPathCircle,
    BezierPathEllipse,
    BezierPathOtherGraph,
    BezierPathColor,
    BezierPathImage,
    BezierPathBezierCurve
}BezierPathType;



@interface SecondViewController : UIViewController

@property(nonatomic, assign)BezierPathType type;

@end
