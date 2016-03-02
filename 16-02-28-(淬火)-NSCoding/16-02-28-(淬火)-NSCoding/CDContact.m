//
//  CDContact.m
//  16-02-28-(淬火)-NSCoding
//
//  Created by 陈栋 on 16/3/2.
//  Copyright © 2016年 man. All rights reserved.
//

#import "CDContact.h"

@implementation CDContact


- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [super encodeWithCoder:aCoder];
    
    //添加自己属性的存储
    [aCoder encodeObject:self.tel forKey:@"tel"];
}


- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
   //子类实现initWithCoder方法 self 不要写成 self = [super init]

    if (self =[super initWithCoder:aDecoder]) {
        self.tel = [aDecoder decodeObjectForKey:@"tel"];
    }
    return self;
}

@end
