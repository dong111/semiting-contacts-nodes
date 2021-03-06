//
//  ViewController.m
//  16-03-08-(熔炼)-矩阵操作
//
//  Created by 陈栋 on 16/3/8.
//  Copyright © 2016年 man. All rights reserved.
//

#import "ViewController.h"
#import "CZCustomView.h"
#import "CircleImageView.h"
#import "CGMutablePathRefUsageView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CGMutablePathRefUsageView *pathView = [[CGMutablePathRefUsageView alloc] initWithFrame:CGRectMake(50, 50, 300, 300)];
    
    pathView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:pathView];
    
    
}
//CGMutablePathRef 的用法
- (void) CGMutablePathRefUsage
{

}


//实现圆角图片
- (void) drawCircleImageView
{

    //1.自定义一个CircleImageView控件，在drawRect中，获取上下文，往上下文中添加一个圆的路径
    
    
    // 2.自定义的控制中，添加一个imageName属性，
    
    // 3.把自定的view添加到控制器View
    CircleImageView *cirView = [[CircleImageView alloc] initWithFrame:CGRectMake(10, 40, 100, 100)];
    cirView.backgroundColor = [UIColor lightGrayColor];
    cirView.imageName = @"papa";
    cirView.borderWidth  = 3;
    cirView.borderColor = [UIColor redColor];
    
    [self.view addSubview:cirView];
    
    
    
    // 4.然后回到drawrect方法画图 调用CGContextClip的方法，裁剪路径之外多余的部分
    
    // 5.画圆的边框，使用CGContextAddEllipseInRect添加圆的路径，并使用CGContextStrokePath画空心圆;

}

//自定义的一些操作  平移 旋转
- (void) doSomethings
{
    CZCustomView *view = [[CZCustomView alloc] init];
    view.frame = CGRectMake(50, 50, 300, 300);
    view.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:view];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
