//
//  ViewController.m
//  16-03-08-(熔炼)-模态框Model
//
//  Created by 陈栋 on 16/3/8.
//  Copyright © 2016年 man. All rights reserved.
//

#import "ViewController.h"
#import "RegisterViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//代码实现模态框显示
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    RegisterViewController *rgVc = [[RegisterViewController alloc] init];
    
    //弹窗模态框方法
    [self presentViewController:rgVc animated:YES completion:^{
        NSLog(@"弹出注册模态框了！");
    }];

}

@end
