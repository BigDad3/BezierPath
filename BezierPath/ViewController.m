//
//  ViewController.m
//  BezierPath
//
//  Created by gaowei on 2017/3/15.
//  Copyright © 2017年 none. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    __weak IBOutlet UITableView *subTableView;
    
    NSArray * typeArray;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    typeArray = [NSArray arrayWithObjects:@"直线(line)", @"弧形(arc)", @"圆形(circle)", @"椭圆(ellipse)", @"其他形状(other)", @"渐变色(gradient color)", @"图片(image)", @"贝塞尔曲线(bezier curve)", nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - <UITableViewDelegate,UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return typeArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@",[typeArray objectAtIndex:indexPath.row]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SecondViewController *second = (SecondViewController *)[mainStoryboard instantiateViewControllerWithIdentifier:@"SecondViewController"];
    second.type = indexPath.row;
    [self.navigationController pushViewController:second animated:YES];
}

@end
