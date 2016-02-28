//
//  ViewController.m
//  16-02-28-(淬火)-plist文件存储demo
//
//  Created by 陈栋 on 16/2/28.
//  Copyright © 2016年 man. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,copy) NSString *plistPath;

@end

@implementation ViewController
//初始化plist沙盒目录
- (NSString *)plistPath
{
    if (_plistPath==nil) {
        NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
//        NSLog(@"documentPath : %@",doc);
        
        //document 目录中添加文件
         _plistPath = [doc stringByAppendingPathComponent:@"data.plist"];
    }
    return _plistPath;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //获取应用沙盒目录
    //TheNSSearchPathDirectoryse constants specify the location of a variety of directories by the
    
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self testString2Plist];
}


/**
 *  测试Dictionary存储在plist文件中
 *
 *
 */

- (void) testString2Plist
{
    NSString *orginString = @"orginString";
    [orginString writeToFile:self.plistPath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    
    NSString *getString = [NSString stringWithContentsOfFile:self.plistPath encoding:NSUTF8StringEncoding error:nil];
    
    NSLog(@"%@",getString);
}


/**
 *  测试Dictionary存储在plist文件中
 */
- (void) testDictionary
{
    NSDictionary *dict = @{@"name":@"xiaoming",@"age":@15};
    [dict writeToFile:self.plistPath atomically:YES];
    
    NSDictionary *readPlistDict = [NSDictionary dictionaryWithContentsOfFile:self.plistPath];
    
    NSLog(@"%@",readPlistDict);
}

/**
 *  测试NSarray存储在plist文件中
 */
- (void) testArray
{
    NSArray *array = @[@"array1",@"array2"];
    //写入一个文件
    [array writeToFile:self.plistPath atomically:YES];
    
    //读取数据
    NSArray *destArray =  [NSArray arrayWithContentsOfFile:self.plistPath];
    NSLog(@"%@",destArray);
}


@end
