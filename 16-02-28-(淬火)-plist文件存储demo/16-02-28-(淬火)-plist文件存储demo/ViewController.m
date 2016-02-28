//
//  ViewController.m
//  16-02-28-(淬火)-plist文件存储demo
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
    //获取应用沙盒目录
    //TheNSSearchPathDirectoryse constants specify the location of a variety of directories by the
    
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSLog(@"documentPath : %@",doc);

    //document 目录中添加文件
    NSString *listPath = [doc stringByAppendingPathComponent:@"data.plist"];
    NSLog(@"listPath : %@",listPath);

    
    //读取数据
    NSArray *array = [NSArray arrayWithContentsOfFile:listPath];    NSLog(@"%@",array);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
