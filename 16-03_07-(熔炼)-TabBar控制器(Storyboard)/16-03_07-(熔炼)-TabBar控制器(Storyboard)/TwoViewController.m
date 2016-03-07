//
//  TwoViewController.m
//  04.导航控制器(Storyboard)
//
//  Created by Apple on 14/12/27.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "TwoViewController.h"

@interface TwoViewController ()

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"two view加载完成");
}


-(void)viewWillAppear:(BOOL)animated{
    NSLog(@"two view将显示");
}

-(void)viewDidAppear:(BOOL)animated{
    NSLog(@"two view完成显示");
}

-(void)viewWillDisappear:(BOOL)animated{
    NSLog(@" twoview将消失");
}

-(void)viewDidDisappear:(BOOL)animated{
    NSLog(@"two view已经消失");
}


-(void)dealloc{
    NSLog(@"two 销毁");
}



@end
