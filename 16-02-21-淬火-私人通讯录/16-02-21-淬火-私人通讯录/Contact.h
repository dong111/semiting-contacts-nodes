//
//  Contact.h
//  16-02-21-淬火-私人通讯录
//
//  Created by 陈栋 on 16/2/28.
//  Copyright © 2016年 man. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contact : NSObject

@property (nonatomic,copy) NSString *name;

@property (nonatomic,copy) NSString *tel;


//定义构造方法
- (instancetype) initContactWithName:(NSString *)name AndTel:(NSString *)tel;

@end
