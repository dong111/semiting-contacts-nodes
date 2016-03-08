//
//  ViewController.m
//  16-03-08-(熔炼)-图形上下文栈
//
//  Created by 陈栋 on 16/3/8.
//  Copyright © 2016年 man. All rights reserved.
//

#import "ViewController.h"
#import "CDCustomView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //添加自定义view 到RootView
    CDCustomView *customView = [[CDCustomView alloc] init];
    customView.frame = CGRectMake(50, 50, 300, 300);
    customView.backgroundColor = [UIColor lightGrayColor];
    
    [self.view addSubview:customView];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
