//
//  ViewController.m
//  16-02-28-(淬火)-用户偏好设置
//
//  Created by 陈栋 on 16/2/28.
//  Copyright © 2016年 man. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self modiferPerference];
    [self readFromPerferences];
    
}
/**
 *  修改用户偏好设置
 */
- (void) modiferPerference
{
 NSUserDefaults *defaults =  [NSUserDefaults standardUserDefaults];
    [defaults setObject:@"321" forKey:@"password"];
    [defaults synchronize];
}


/**
 *  删除用户编号设置
 */
- (void) deleteFromPerferences
{
   NSUserDefaults *defaults =  [NSUserDefaults standardUserDefaults];
    
    [defaults removeObjectForKey:@"account"];
    [defaults synchronize];
    
}


/**
 *  读取用户偏好设置
 */
- (void) readFromPerferences
{
    //使用偏好设置读取数据
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *account =  [defaults objectForKey:@"account"];
    NSString *password = [defaults objectForKey:@"password"];
    BOOL autoLogin = [defaults boolForKey:@"autoLogin"];
    BOOL remenberPwd = [defaults boolForKey:@"remenberPwd"];
    NSLog(@"%@,%@,%d,%d",account,password,autoLogin,remenberPwd);
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //使用偏好设置保存数据
    NSUserDefaults *defaults =  [NSUserDefaults standardUserDefaults];
    
    //保存数据
    [defaults setObject:@"dongdong" forKey:@"account"];
    [defaults setObject:@"123" forKey:@"password"];
    [defaults setBool:YES forKey:@"autoLogin"];
    [defaults setBool:YES forKey:@"remenberPwd"];
    
    //使用同步方法，把数据同步到沙盒文件中
    [defaults synchronize];
    
}


@end
