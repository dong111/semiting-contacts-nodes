//
//  LineView.m
//  16-03-07-(熔炼)-Quartz-画图
//
//  Created by 陈栋 on 16/3/7.
//  Copyright © 2016年 man. All rights reserved.
//

#import "LineView.h"

@implementation LineView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)drawRect:(CGRect)rect {
    [self drawLine2];
}

//画一有颜色很粗的条线
- (void) drawLine2
{
    //获取画图上下文
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    
    //设置线的颜色
    CGContextSetRGBStrokeColor(contextRef, 1.0, 0.0, 0.0, 1);
    
    //设置线的宽度
    CGContextSetLineWidth(contextRef, 10);
    
    //设置线的头尾样式
//    kCGLineCapButt,
//    kCGLineCapRound,
//    kCGLineCapSquare
    CGContextSetLineCap(contextRef, kCGLineCapRound);
    
    //设置连接点样式
//    kCGLineJoinMiter,
//    kCGLineJoinRound,
//    kCGLineJoinBevel
    CGContextSetLineJoin(contextRef, kCGLineJoinBevel);
    
    
    //确定线的起点
    CGContextMoveToPoint(contextRef, 10, 10);
    
    //确定线的终点
    CGContextAddLineToPoint(contextRef, 300, 50);
    CGContextAddLineToPoint(contextRef, 200, 100);
    
    //画出view(渲染)
    CGContextStrokePath(contextRef);
    
}


//画一条线
- (void) drawLine
{
    //获取画图上下文
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    
    //确定线的起点
    CGContextMoveToPoint(contextRef, 10, 10);
    
    //确定线的终点
    CGContextAddLineToPoint(contextRef, 300, 50);
    
    //画出view(渲染)
    CGContextStrokePath(contextRef);
    
}



@end
