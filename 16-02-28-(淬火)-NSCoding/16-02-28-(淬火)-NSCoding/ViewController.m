//
//  ViewController.m
//  16-02-28-(淬火)-NSCoding
//
//  Created by 陈栋 on 16/2/28.
//  Copyright © 2016年 man. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@property (copy,nonatomic) NSString *archivePath;

@end

@implementation ViewController
//初始化archive文件位置
- (NSString *)archivePath
{
    if (_archivePath==nil) {
        //获取document沙盒位置
        NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
        //错误的文件写入方法
        //该方法的作用:Returns a new string made by appending a given string to the receiver.
//        _archivePath = [doc stringByAppendingString:@"data.archiver"];
        
        _archivePath = [doc stringByAppendingPathComponent:@"data.archiver"];
        
    }
    return _archivePath;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"%@",self.archivePath);
    [self savePersonExtensionNScoding];
    [self readPerson];
}


/**
 *
 *读取数据
 *
 */

- (void) readPerson
{
    Person *person = [NSKeyedUnarchiver unarchiveObjectWithFile:self.self.archivePath];
    NSLog(@"%@",person.name);
}


/**
 *  存储实现了NScoding方法的对象
 */
- (void) savePersonExtensionNScoding
{
    Person *person = [[Person alloc] init];
    person.name = @"personName";
    person.age = 55;
    
    [NSKeyedArchiver archiveRootObject:person toFile:self.archivePath];
    
    
}





//从archiver中读取数据
- (void)readArchiverDate
{
#warning 这个也是读取数据方法，但是还没有搞懂什么作用
//    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:@"name"];
//    NSLog(@"%@",data);
    
    //读取数据
    NSDictionary *dict =  [NSKeyedUnarchiver unarchiveObjectWithFile:self.archivePath];
    NSLog(@"%@",dict);
}




//使用归档爆粗数据
- (void) saveDate
{
    NSDictionary *dict = @{@"name":@"zhangsang",@"age":@10};
    
    //直接使用archive将对象保存到沙盒
    [NSKeyedArchiver archiveRootObject:dict toFile:self.archivePath];
    
    
    
}
@end
