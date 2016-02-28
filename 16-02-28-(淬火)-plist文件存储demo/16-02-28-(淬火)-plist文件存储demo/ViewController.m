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
    //1.控制台打印沙盒路径，使用finder-前往查看
    //2.控制台密令命令打印沙盒路径,打开终端 使用cd open 进入
    //3.使用simpholer工具
    //4.可以使用断点 输入po NSHomeDirectory()
    
    //获取缓存逻辑
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    NSLog(@"%@",cachePath);
    
    //存放临时文件的路径
    NSString *tempPath =  NSTemporaryDirectory();
     NSLog(@"%@",tempPath);
    
    //主目录
    NSString *homePath = NSHomeDirectory();
    NSLog(@"%@",homePath);
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
