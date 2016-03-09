//
//  BallonView.m
//  16-03-08-(熔炼)-动画气球下降
//
//  Created by 陈栋 on 16/3/8.
//  Copyright © 2016年 man. All rights reserved.
//

#import "BallonView.h"

@interface BallonView ()

@property (nonatomic,assign) CGFloat imageY;

@property (nonatomic,strong) NSTimer *timer;//定时器1

@property (nonatomic,strong)CADisplayLink  *link;//定时器2

@end

@implementation BallonView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (void)drawRect:(CGRect)rect {
    
    
    UIImage *image = [UIImage imageNamed:@"sandyBalloon"];
    self.imageY += 50;
    CGRect imageRect = CGRectMake(50, self.imageY, 50, 50);

    
    [image drawInRect:imageRect];
    
    
}


//在对象初始化的时候就启动个定时器
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        //添加动画定时器
        [self addAnimation];
    }
    return self;
}


- (void) addAnimation
{
    //写一个定时器，重绘当前的view
    //调用setNeedDispaly方法  内部会使用drawRect方法
//    self.timer =[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(setNeedsDisplay) userInfo:nil repeats:YES];

    // CADisplayLink 定时器 一秒执行60次   ****太快了都不能设置时间 搞不懂为什么要学习
    self.link = [CADisplayLink displayLinkWithTarget:self selector:@selector(setNeedsDisplay)];
    
    
    // 要执行定时器，添加到主运行循环
    [self.link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    
    
}


- (void) removeAnimation
{
    //写一个定时器，重绘当前的view
    //调用setNeedDispaly方法  内部会使用drawRect方法
//    [self.timer invalidate];
//    self.timer = nil;
    [self.link invalidate];
    self.link = nil;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self removeAnimation];\
}



@end
