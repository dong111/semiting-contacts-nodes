//
//  Contact.m
//  16-02-21-淬火-私人通讯录
//
//  Created by 陈栋 on 16/2/28.
//  Copyright © 2016年 man. All rights reserved.
//

#import "Contact.h"

@implementation Contact

- (instancetype) initContactWithName:(NSString *)name AndTel:(NSString *)tel
{
    if (self=[super init]) {
        _name = name;
        _tel = tel;
    }
    return self;
}

@end
