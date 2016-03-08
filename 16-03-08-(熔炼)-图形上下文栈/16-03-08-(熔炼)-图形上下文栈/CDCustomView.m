//
//  CDCustomView.m
//  16-03-08-(熔炼)-图形上下文栈
//
//  Created by 陈栋 on 16/3/8.
//  Copyright © 2016年 man. All rights reserved.
//

#import "CDCustomView.h"

@implementation CDCustomView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)drawRect:(CGRect)rect {
    //获取当前上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //保存当前上下文的绘图状态到上下文栈中去  ****可以保存多次
    CGContextSaveGState(context);
    
    //使用上下文画一个矩形
    CGContextAddRect(context, CGRectMake(10, 10, 100, 100));
    CGContextSetRGBStrokeColor(context, 1.0, 0.0, 0.0, 1);
    CGContextSetLineWidth(context, 13);
    CGContextStrokePath(context);
    
    
    //恢复到上一次绘图状态
    //*****恢复状态不能随便调用，保存了多少次绘图状态，就可以调用多少
    CGContextRestoreGState(context);
    CGContextAddRect(context, CGRectMake(120, 120, 100, 100));
    CGContextStrokePath(context);
    
    
}


@end
