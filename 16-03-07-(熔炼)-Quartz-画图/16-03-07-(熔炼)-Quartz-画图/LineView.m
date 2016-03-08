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
    [self drawTextImage:rect];
}





#pragma -mark 画文字和图片
- (void) drawTextImage:(CGRect)rect
{
    CGFloat width = rect.size.width;
    CGFloat height = rect.size.height;
    
    //画图片
    UIImage *image = [UIImage imageNamed:@"tabbar_bg"];
//    [image drawAtPoint:CGPointZero];
//    [image drawInRect:CGRectMake(0, 0, 100, 100)];
    
    //平铺
    [image drawAsPatternInRect:CGRectMake(0, 0, width, height)];
    
    
    //画文字
    NSString *text = @"弹幕文字，小广告，水印文字弹幕文字，小广告，水印文字弹幕文字，小广告，水印文字弹幕文字，小广告，水印文字弹幕文字，小广告，水印文字弹幕文字，小广告，水印文字弹幕文字，小广告，水印文字弹幕文字，小广告，水印文字弹幕文字，小广告，水印文字";
    
    //设置字体样式
    NSDictionary *attrs = @{NSFontAttributeName:[UIFont systemFontOfSize:13],NSForegroundColorAttributeName:[UIColor redColor]};
    
    [text drawInRect:CGRectMake(0, 0, width, height/2) withAttributes:attrs];
    
}


#pragma -mark 画圆
- (void) drawCircle
{
    //获取画图上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 设置线颜色
    CGContextSetRGBStrokeColor(context, 1.0, 0.0, 0.0, 1);
    
    //画圆
    CGContextAddEllipseInRect(context, CGRectMake(100, 100, 10, 10));
    
    CGContextStrokePath(context);

}


#pragma -mark 画扇形
- (void)drawSector
{
    //获取画图上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 设置线颜色
    CGContextSetRGBStrokeColor(context, 1.0, 0.0, 0.0, 1);
    //设置一个起点  这个起点还是需要的 否则不是弧，不会连接中心店
    CGContextMoveToPoint(context, 100, 100);
    
    

//    x The x-value, in user space coordinates, for the center of the arc.
    //弧 中心点x coordinates 中心点
//    y The y-value, in user space coordinates, for the center of the arc.
    //弧 中心点y
//    radius The radius of the arc, in user space coordinates.
    // 半径
//    startAngle The angle to the starting point of the arc, measured in radians from the positive x-axis.
    //开始角度
//    endAngle The angle to the end point of the arc, measured in radians from the positive x-axis.
    //结束角度
//    clockwise Specify 1 to create a clockwise arc or 0 to create a counterclockwise arc.
    //clockwise 顺时针方向 counterclockwise 你是猪方向
    CGContextAddArc(context, 100, 100, 50, -M_PI_4, 3*-M_PI_4, 1);
    
    CGContextClosePath(context);
    
    CGContextStrokePath(context);
}


#pragma -mark画矩形
- (void) drawRectangle
{
    //获取画图上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // 设置线颜色
    CGContextSetRGBStrokeColor(context, 1.0, 0.0, 0.0, 1);
    
    CGContextSetRGBFillColor(context, 1.0, 0.0, 0.0, 1);
    
    //画矩形
    CGContextAddRect(context, CGRectMake(10, 10, 100, 100));
    //画一条线
//    CGContextStrokePath(context);
    //填充（实心）
    CGContextFillPath(context);
}

#pragma -mark 画三角形
- (void) drawTriangle
{
    //获取画图上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //设置线的颜色
    CGContextSetRGBStrokeColor(context, 1.0, 0.0, 0.0, 1);
    //确定线的起点
    CGContextMoveToPoint(context, 10, 10);
    
    //确定线的终点
    CGContextAddLineToPoint(context, 300, 50);
    CGContextAddLineToPoint(context, 200, 100);
    
    //***关闭路径
    CGContextClosePath(context);
    //渲染
    CGContextStrokePath(context);
    
}


#pragma --mark 画线
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
