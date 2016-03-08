//
//  CircleImageView.m
//  16-03-08-(熔炼)-矩阵操作
//  剪切圆角图片
//  Created by 陈栋 on 16/3/8.
//  Copyright © 2016年 man. All rights reserved.
//

#import "CircleImageView.h"

@implementation CircleImageView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)drawRect:(CGRect)rect {
    CGContextRef context =  UIGraphicsGetCurrentContext();
    // 1.2.指定圆的路径，并圆外面多余的剪切掉[CGContextClip]
    //定义图片Rect
    CGRect imageRect = CGRectMake(0, 0, 100, 100);
    CGContextAddEllipseInRect(context, imageRect);
    CGContextClip(context);
    
    //画图片
    UIImage *image = [UIImage imageNamed:self.imageName];
    [image drawInRect:imageRect];
    
    
    // 2.添加一个圆的边框
    //线宽
    CGContextSetLineWidth(context, self.borderWidth);
    
    //设置边框的颜色
    [self.borderColor set];
    
    CGContextAddEllipseInRect(context, imageRect);
    //边框线
    CGContextStrokePath(context);
    
}

@end
