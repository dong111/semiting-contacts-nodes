//
//  ThreeViewController.m
//  04.导航控制器(Storyboard)
//
//  Created by Apple on 14/12/27.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "ThreeViewController.h"

@interface ThreeViewController ()
- (IBAction)backOneVc;

@end

@implementation ThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"three view加载完成");
    
    //UITabbarButton 系统不给用，不能自己创建
    
    //遍历UITabbar的子控件
    UITabBar *tabbar = self.tabBarController.tabBar;
    for (UIView *subView in tabbar.subviews) {
        NSLog(@"%@",subView);
        //如果不是图片控件，就从父控件移除
        if (![subView isKindOfClass:[UIImageView class]]) {
            [subView removeFromSuperview];
        }
    }
}


-(void)viewWillAppear:(BOOL)animated{
    NSLog(@"three  view将显示");
}

-(void)viewDidAppear:(BOOL)animated{
    NSLog(@"three  view完成显示");
}

-(void)viewWillDisappear:(BOOL)animated{
    NSLog(@"three  view将消失");
}

-(void)viewDidDisappear:(BOOL)animated{
    NSLog(@"three  view已经消失");
}


-(void)dealloc{
    NSLog(@"three 销毁");
}



@end
