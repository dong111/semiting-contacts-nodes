//
//  Person.m
//  16-02-28-(淬火)-NSCoding
//
//  Created by 陈栋 on 16/2/29.
//  Copyright © 2016年 man. All rights reserved.
//

#import "Person.h"

@implementation Person


- (void)encodeWithCoder:(NSCoder *)aCoder
{
    //指定每个属性怎么存储
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeInt:self.age forKey:@"age"];
}
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder
{
    //读取属性
    if (self=[super init]) {
        self.age = [aDecoder decodeIntForKey:@"age"];
        self.name = [aDecoder decodeObjectForKey:@"name"];
        
    }

    return self;
}

@end
