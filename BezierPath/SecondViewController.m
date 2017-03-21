//
//  SecondViewController.m
//  BezierPath
//
//  Created by gaowei on 2017/3/15.
//  Copyright © 2017年 none. All rights reserved.
//

#import "SecondViewController.h"
#import "SubView.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self drawBazierPath:self.type];
}

-(void)drawBazierPath:(BezierPathType)type
{
    switch (type) {
        case BezierPathTypeLine:
            [self drawLine];
            break;
        case BezierPathArc:
            [self drawArc];
            break;
        case BezierPathCircle:
            [self drawCircle];
            break;
        case BezierPathEllipse:
            [self drawEllipse];
            break;
        case BezierPathOtherGraph:
            [self otherGraph];
            break;
        case BezierPathColor:
            [self drawColor];
            break;
        case BezierPathImage:
            [self drawImage];
            break;
        case BezierPathBezierCurve:
            [self drawBezierCurve];
            break;
            
        default:
            break;
    }
}

-(void)drawLine
{
    UIBezierPath * path = [[UIBezierPath alloc]init];
    [path moveToPoint:CGPointMake(100, 100)];
    [path addLineToPoint:CGPointMake(200, 100)];
    CAShapeLayer * testLayer = [CAShapeLayer layer];
    testLayer.path = path.CGPath;
    testLayer.lineWidth = 10;
    testLayer.fillColor = [UIColor redColor].CGColor;
    testLayer.strokeColor = [UIColor blackColor].CGColor;
    testLayer.lineCap = kCALineCapRound;
    [self.view.layer addSublayer:testLayer];
    
    SubView * testView = [[SubView alloc] initWithFrame:CGRectMake(0, 150, self.view.frame.size.width, 200)];
    testView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:testView];
}

-(void)drawArc
{
    CGFloat radius = 50.0;
    CGFloat centerx = self.view.frame.size.width/2-25;

    //code 1
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path addArcWithCenter:CGPointMake(centerx, 50+64) radius:radius startAngle:0.0 endAngle:M_PI_2 clockwise:YES];
    [path stroke];
    CAShapeLayer * testLayer = [CAShapeLayer layer];
    testLayer.path = path.CGPath;
    testLayer.lineWidth = 5;
    testLayer.fillColor = [UIColor clearColor].CGColor;
    testLayer.strokeColor = [UIColor blackColor].CGColor;
    testLayer.lineCap = kCALineCapRound;
    [self.view.layer addSublayer:testLayer];
    
    //code 2
    UIBezierPath *path1 = [UIBezierPath bezierPath];
    [path1 moveToPoint:CGPointMake(centerx, 50+64+70)];
    [path1 addArcWithCenter:CGPointMake(centerx, 50+64+70) radius:radius startAngle:0 endAngle:M_PI_2 clockwise:YES];
    CAShapeLayer * testLayer1 = [CAShapeLayer layer];
    [testLayer1 setPath:path1.CGPath];
    [testLayer1 setFillColor:[UIColor yellowColor].CGColor];
    [testLayer1 setStrokeColor:[UIColor purpleColor].CGColor];
    [self.view.layer addSublayer:testLayer1];
    
    //code 3
    UIBezierPath *path2 = [UIBezierPath bezierPath];
    [path2 addArcWithCenter:CGPointMake(centerx, 50+64+140) radius:radius startAngle:0 endAngle:M_PI_2 clockwise:YES];
    [path2 closePath];
    CAShapeLayer * testLayer2 = [CAShapeLayer layer];
    [testLayer2 setPath:path2.CGPath];
    [testLayer2 setFillColor:[UIColor whiteColor].CGColor];
    [testLayer2 setStrokeColor:[UIColor blueColor].CGColor];
    [self.view.layer addSublayer:testLayer2];
}

-(void)drawCircle
{
    CGFloat radius = 50.0;
    CGFloat centerx = self.view.frame.size.width/2-25;
    
    //code 1
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path addArcWithCenter:CGPointMake(centerx, 50+64+5) radius:radius startAngle:0.0 endAngle:2*M_PI clockwise:YES];
    [path stroke];
    CAShapeLayer * testLayer = [CAShapeLayer layer];
    testLayer.path = path.CGPath;
    testLayer.lineWidth = 5;
    testLayer.fillColor = [UIColor clearColor].CGColor;
    testLayer.strokeColor = [UIColor blackColor].CGColor;
    testLayer.lineCap = kCALineCapRound;
    [self.view.layer addSublayer:testLayer];
    
    //code 2
    UIBezierPath *path1 = [UIBezierPath bezierPath];
    [path1 addArcWithCenter:CGPointMake(centerx, 50+64+5+110) radius:radius startAngle:0.0 endAngle:2*M_PI clockwise:YES];
    [path1 stroke];
    CAShapeLayer * testLayer1 = [CAShapeLayer layer];
    testLayer1.path = path1.CGPath;
    testLayer1.lineWidth = 2;
    testLayer1.fillColor = [UIColor redColor].CGColor;
    testLayer1.strokeColor = [UIColor yellowColor].CGColor;
    testLayer1.lineCap = kCALineCapRound;
    [self.view.layer addSublayer:testLayer1];
    
    //code 3
    UIBezierPath*  path2 = [[UIBezierPath alloc] init];
    [path2 moveToPoint:CGPointMake(centerx, 50+64+5+220)];
    [path2 addArcWithCenter:CGPointMake(centerx, 50+64+5+220) radius:radius startAngle:0 endAngle:M_PI_2 clockwise:YES];
    [path2 addLineToPoint:CGPointMake(centerx, 50+64+5+220)];
    [path2 closePath];
    CAShapeLayer * testLayer2 = [CAShapeLayer layer];
    testLayer2.path = path2.CGPath;
    testLayer2.lineWidth = 2;
    testLayer2.fillColor = [UIColor redColor].CGColor;
    testLayer2.strokeColor = [UIColor whiteColor].CGColor;
    testLayer2.lineCap = kCALineCapRound;
    [self.view.layer addSublayer:testLayer2];
    
    UIBezierPath*  path3 = [[UIBezierPath alloc] init];
    [path3 moveToPoint:CGPointMake(centerx, 50+64+5+220)];
    [path3 addArcWithCenter:CGPointMake(centerx, 50+64+5+220) radius:radius startAngle:M_PI_2 endAngle:M_PI clockwise:YES];
    [path3 addLineToPoint:CGPointMake(centerx, 50+64+5+220)];
    [path3 closePath];
    CAShapeLayer * testLayer3 = [CAShapeLayer layer];
    testLayer3.path = path3.CGPath;
    testLayer3.lineWidth = 2;
    testLayer3.fillColor = [UIColor yellowColor].CGColor;
    testLayer3.strokeColor = [UIColor whiteColor].CGColor;
    testLayer3.lineCap = kCALineCapRound;
    [self.view.layer addSublayer:testLayer3];
    
    UIBezierPath*  path4 = [[UIBezierPath alloc] init];
    [path4 moveToPoint:CGPointMake(centerx, 50+64+5+220)];
    [path4 addArcWithCenter:CGPointMake(centerx, 50+64+5+220) radius:radius startAngle:M_PI endAngle:2*M_PI clockwise:YES];
    [path4 addLineToPoint:CGPointMake(centerx, 50+64+5+220)];
    [path4 closePath];
    CAShapeLayer * testLayer4 = [CAShapeLayer layer];
    testLayer4.path = path4.CGPath;
    testLayer4.lineWidth = 2;
    testLayer4.fillColor = [UIColor blueColor].CGColor;
    testLayer4.strokeColor = [UIColor whiteColor].CGColor;
    testLayer4.lineCap = kCALineCapRound;
    [self.view.layer addSublayer:testLayer4];
}

-(void)drawEllipse
{
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:(CGRect){80,50+64,150,100}];
    CAShapeLayer * testLayer = [CAShapeLayer layer];
    testLayer.path = path.CGPath;
    testLayer.lineWidth = 2;
    testLayer.fillColor = [UIColor redColor].CGColor;
    testLayer.strokeColor = [UIColor blackColor].CGColor;
    [self.view.layer addSublayer:testLayer];
}

-(void)otherGraph
{
    UIBezierPath * path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(100, 80)];
    [path addLineToPoint:CGPointMake(200, 120)];
    [path addLineToPoint:CGPointMake(160, 140)];
    [path addLineToPoint:CGPointMake(40.0, 140)];
    [path addLineToPoint:CGPointMake(10.0, 120)];
    [path closePath];
    
    CAShapeLayer * testLayer = [CAShapeLayer layer];
    testLayer.path = path.CGPath;
    testLayer.lineWidth = 2;
    testLayer.fillColor = [UIColor redColor].CGColor;
    testLayer.strokeColor = [UIColor blackColor].CGColor;
    [self.view.layer addSublayer:testLayer];
    
    //code 2
    UIBezierPath *path1 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(20, 200, 150, 100) byRoundingCorners:UIRectCornerTopLeft|UIRectCornerBottomRight cornerRadii:CGSizeMake(10, 10)];
    CAShapeLayer * testLayer1 = [CAShapeLayer layer];
    testLayer1.path = path1.CGPath;
    testLayer1.lineWidth = 2;
    testLayer1.fillColor = [UIColor clearColor].CGColor;
    testLayer1.strokeColor = [UIColor blackColor].CGColor;
    testLayer1.lineCap = kCALineCapRound;
    [self.view.layer addSublayer:testLayer1];
    
}

-(void)drawColor
{

    UIBezierPath * path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(150, 150) radius:50 startAngle:0.0 endAngle:M_PI_2 clockwise:NO];
    CAShapeLayer * testLayer = [CAShapeLayer layer];
//    testLayer.position = CGPointMake(CGRectGetMidX(self.view.frame)-100,
//                               CGRectGetMidY(self.view.frame)-100);
    testLayer.path = path.CGPath;
    testLayer.fillColor = [UIColor clearColor].CGColor;
    testLayer.strokeColor = [UIColor blackColor].CGColor;
    testLayer.lineWidth = 15;
//    CABasicAnimation *drawAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
//    drawAnimation.duration            = 5.0; // "animate over 10 seconds or so.."
//    drawAnimation.repeatCount         = 1.0;  // Animate only once..
//    drawAnimation.removedOnCompletion = NO;   // Remain stroked after the animation..
//    drawAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
//    drawAnimation.toValue   = [NSNumber numberWithFloat:10.0f];
//    drawAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
//    [arc addAnimation:drawAnimation forKey:@"drawCircleAnimation"];
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.view.frame;
    gradientLayer.colors = @[(__bridge id)[UIColor greenColor].CGColor,(__bridge id)[UIColor blueColor].CGColor ];
    gradientLayer.startPoint = CGPointMake(0,0.5);
    gradientLayer.endPoint = CGPointMake(1,0.5);
    
    [self.view.layer addSublayer:gradientLayer];
    gradientLayer.mask = testLayer;
    
    UIBezierPath * path1 = [UIBezierPath bezierPath];
    [path1 moveToPoint:CGPointMake(100, 280)];
    [path1 addLineToPoint:CGPointMake(200, 300)];
    [path1 addLineToPoint:CGPointMake(250, 350)];
    [path1 addLineToPoint:CGPointMake(150, 400)];
    [path1 addLineToPoint:CGPointMake(50, 300)];
    [path1 closePath];
    
    CAShapeLayer * testLayer1 = [CAShapeLayer layer];
    testLayer1.path = path1.CGPath;
    testLayer1.lineWidth = 2;
    testLayer1.fillColor = [UIColor redColor].CGColor;
    testLayer1.strokeColor = [UIColor blackColor].CGColor;
//    [self.view.layer addSublayer:testLayer1];
    
    CAGradientLayer *gradientLayer1 = [CAGradientLayer layer];
    gradientLayer1.frame = self.view.frame;
    gradientLayer1.colors = @[(__bridge id)[UIColor yellowColor].CGColor, (__bridge id)[UIColor purpleColor].CGColor ];
    gradientLayer1.startPoint = CGPointMake(0,0.5);
    gradientLayer1.endPoint = CGPointMake(1,0.5);
    
    [self.view.layer addSublayer:gradientLayer1];
    gradientLayer1.mask = testLayer1;
}

-(void)drawImage
{
    UIImage * image = [UIImage imageNamed:@"gggggg"];
    UIBezierPath *path = [[UIBezierPath alloc] init];
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineJoinRound;
    [path moveToPoint:CGPointMake(self.view.frame.size.width/2, 100)];
    [path addArcWithCenter:CGPointMake(self.view.frame.size.width/2, 200) radius:150 startAngle:0 endAngle:M_PI clockwise:YES];
    [path closePath];
    
    CAShapeLayer * testLayer = [[CAShapeLayer alloc] init];
    testLayer.frame = self.view.bounds;
    testLayer.fillColor = [UIColor blackColor].CGColor;
    testLayer.strokeColor = [UIColor redColor].CGColor;
    testLayer.contentsScale = [UIScreen mainScreen].scale;
    testLayer.path = path.CGPath;
    
    CALayer * contentLayer = [CALayer layer];
    contentLayer.frame = self.view.bounds;
    contentLayer.contentsGravity = kCAGravityResizeAspectFill;
    contentLayer.mask = testLayer;
    contentLayer.contents = (__bridge id _Nullable)(image.CGImage);
    [self.view.layer addSublayer:contentLayer];
}

-(void)drawBezierCurve
{
    //code 1
    UIBezierPath* path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(20, 150)];
    [path addQuadCurveToPoint:CGPointMake(150, 160) controlPoint:CGPointMake(270, 100)];
    CAShapeLayer * testLayer = [CAShapeLayer layer];
    testLayer.path = path.CGPath;
    testLayer.lineWidth = 2;
    testLayer.fillColor = [UIColor redColor].CGColor;
    testLayer.strokeColor = [UIColor blackColor].CGColor;
    [self.view.layer addSublayer:testLayer];
    
    //code 2
    UIBezierPath* path1 = [UIBezierPath bezierPath];
    [path1 moveToPoint:CGPointMake(20, 260)];
    [path1 addCurveToPoint:CGPointMake(290, 280) controlPoint1:CGPointMake(50, 20) controlPoint2:CGPointMake(120, 380)];
    [path1 stroke];
    CAShapeLayer * testLayer1 = [CAShapeLayer layer];
    testLayer1.path = path1.CGPath;
    testLayer1.lineWidth = 2;
    testLayer1.fillColor = [UIColor redColor].CGColor;
    testLayer1.strokeColor = [UIColor blackColor].CGColor;
    testLayer1.lineCap = kCALineCapRound;
    [self.view.layer addSublayer:testLayer1];
}

- (IBAction)backAction:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated:YES];
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
