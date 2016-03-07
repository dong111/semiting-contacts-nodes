//
//  OneViewController.m
//  04.导航控制器(Storyboard)
//
//  Created by Apple on 14/12/27.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "OneViewController.h"

@interface OneViewController ()

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"one view加载完成");
}


-(void)viewWillAppear:(BOOL)animated{
    NSLog(@"one  view将显示");
}

-(void)viewDidAppear:(BOOL)animated{
    NSLog(@"one  view完成显示");
}

-(void)viewWillDisappear:(BOOL)animated{
    NSLog(@"one  view将消失");
}

-(void)viewDidDisappear:(BOOL)animated{
    NSLog(@"one  view已经消失");
}

-(void)viewWillUnload{
    NSLog(@"one view将卸载");
    //self.view = nil;
//    [self.image release];
    //消除资源 数组(图片)
}

-(void)viewDidUnload{
    NSLog(@"one view已经卸载");
}

//内存警告
-(void)didReceiveMemoryWarning{
    //自觉清除一些不必要的内存
    
   // self.images = nil;
    NSLog(@"%s",__func__);
}


@end
