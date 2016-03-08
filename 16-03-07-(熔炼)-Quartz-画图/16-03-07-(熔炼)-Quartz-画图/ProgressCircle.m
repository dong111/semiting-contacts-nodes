//
//  ProgressCircle.m
//  16-03-07-(熔炼)-Quartz-画图
//
//    实现进度圈
//  Created by 陈栋 on 16/3/8.
//  Copyright © 2016年 man. All rights reserved.
//

#import "ProgressCircle.h"

@implementation ProgressCircle

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)drawRect:(CGRect)rect {
   
    [self drawText:rect];
    
    [self drawCircle:rect];
}

//绘制弧
- (void) drawCircle:(CGRect)rect
{
    //获取view 宽度高度
    CGFloat viewW = rect.size.width;
    CGFloat viewH = rect.size.height;
    
    //画圆参数
    CGFloat radius = (viewH -10)*0.5;
    CGFloat cirX = viewW *0.5;
    CGFloat cirY = viewH *0.5;
    //开始角度
    CGFloat startAngle = - M_PI_2;
    CGFloat endAngle = self.progress*2*M_PI -M_PI_4;
    //结束角度
    
    //    clockwise Specify 1 to create a clockwise arc or 0 to create a counterclockwise arc.
    //clockwise 顺时针方向 counterclockwise 你是猪方向
    int clockwise = 0;

    //画图上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //开始画圆
    CGContextAddArc(context, cirX, cirY, radius, startAngle, endAngle, clockwise);
    
    CGContextStrokePath(context);
    
}


//实现绘制文字功能
- (void) drawText:(CGRect)rect
{
    //获取view 宽度高度
    CGFloat viewW = rect.size.width;
    CGFloat viewH = rect.size.height;

    //定义文字大小
    CGFloat textW = 20.0;
    CGFloat textH = 20.0;
    //计算x,y
    CGFloat textX = (viewW-textW)*0.5;
    CGFloat textY = (viewH-textH)*0.5;
    
    
   NSString *pgressText =  [NSString stringWithFormat:@"%.2f",self.progress];
 
    
    [pgressText drawInRect:CGRectMake(textX, textY, textW, textH) withAttributes:nil];
    
    
}

- (void)setProgress:(CGFloat)progress
{
    _progress = progress;
    //重绘view
    [self setNeedsDisplay];
}


@end
