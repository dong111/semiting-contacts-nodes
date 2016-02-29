//
//  Person.h
//  16-02-28-(淬火)-NSCoding
//
//  Created by 陈栋 on 16/2/29.
//  Copyright © 2016年 man. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject<NSCoding>

@property (nonatomic,copy) NSString *name;
@property (nonatomic,assign) int age;

@end
