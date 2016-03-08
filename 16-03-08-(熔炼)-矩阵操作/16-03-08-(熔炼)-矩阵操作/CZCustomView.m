//
//  CZCustomView.m
//  16-03-08-(熔炼)-矩阵操作
//
//  Created by 陈栋 on 16/3/8.
//  Copyright © 2016年 man. All rights reserved.
//

#import "CZCustomView.h"

@implementation CZCustomView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)drawRect:(CGRect)rect {
    //获取CGContextRef 上下文
     CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //通过3个点画三角形
    CGPoint points[3] = {{50,20},{100,80},{10,80}};
    CGContextAddLines(ctx, points, 3);
    CGContextClosePath(ctx);//合并路径
    
    
    CGContextStrokePath(ctx);
}

@end
