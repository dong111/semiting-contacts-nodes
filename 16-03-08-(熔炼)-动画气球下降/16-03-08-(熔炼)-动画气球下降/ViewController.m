//
//  ViewController.m
//  16-03-08-(熔炼)-动画气球下降
//
//  Created by 陈栋 on 16/3/8.
//  Copyright © 2016年 man. All rights reserved.
//

#import "ViewController.h"
#import "BallonView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CGRect rect = self.view.bounds;
    
    BallonView *blView = [[BallonView alloc] initWithFrame:CGRectMake(0, 0, rect.size.width, rect.size.height)];
    blView.backgroundColor = [UIColor lightGrayColor];
    
    [self.view addSubview:blView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
