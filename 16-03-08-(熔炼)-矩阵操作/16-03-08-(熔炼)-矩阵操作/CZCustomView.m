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
    
    
#pragma -mark 平移 旋转 缩放要在绘制之前
    //平移
//    CGContextTranslateCTM(ctx, 100,50);
    
    //缩放
    //CGContextScaleCTM(ctx, 1.5, 1.5);
    
    //旋转
    // 负数 逆时针/ 正数 顺时针
    // 围绕左上角(0,0) 旋转
    CGContextRotateCTM(ctx, - M_PI * 0.25);
    
    
    //通过3个点画三角形
    CGPoint points[3] = {{50,20},{100,80},{10,80}};
    CGContextAddLines(ctx, points, 3);
    CGContextClosePath(ctx);//合并路径
    
    //点划线
    CGPoint points2[2] = {{50,20},{60,80}};
    CGContextAddLines(ctx, points2, 2);
    
    
    CGContextStrokePath(ctx);
}

@end
