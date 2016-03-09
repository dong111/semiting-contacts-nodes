//
//  UIImage+CD.m
//  16-03-09-(熔炼)-水印图片
//
//  Created by 陈栋 on 16/3/9.
//  Copyright © 2016年 man. All rights reserved.
//

#import "UIImage+CD.h"

@implementation UIImage (CD)

+ (UIImage *)waterImageWithBgImage:(NSString *)bgName waterName:(NSString *)waterName
{
    //获取背景图片 水印图片
    UIImage *bgImage = [UIImage imageNamed:bgName];
    UIImage *waterImage = [UIImage imageNamed:waterName];

    //创建一个位图上下文(bitmap)
    /**参数说明
     *      //size 图片尺寸
     //opaque 与alpha通道相关 YES:代表不透明度 NO:透明度
     // 0.0 代表图片的实现大小的比例与设备的缩放比例一样
     */
    UIGraphicsBeginImageContextWithOptions(bgImage.size, NO, 0.0);
    
    
    //画布上面画图片
    [bgImage drawInRect:CGRectMake(0, 0, bgImage.size.width,  bgImage.size.height)];
    
    //计算水印图片位置,在画布上画水印图片
#warning 开发过程中，水印图片大小要根据需要计算 这个可以用参数传入
    CGFloat waterScale = 0.2;//图片缩小比例
    CGFloat waterW = waterImage.size.width * waterScale;
    CGFloat waterH = waterImage.size.height * waterScale;
    CGFloat waterX = bgImage.size.width - waterW;
    CGFloat waterY = bgImage.size.height - waterH;
    [waterImage drawInRect:CGRectMake(waterX, waterY, waterW, waterH)];

    //从位图当前上下文获取新图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //**结束编辑位置上下文
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end
