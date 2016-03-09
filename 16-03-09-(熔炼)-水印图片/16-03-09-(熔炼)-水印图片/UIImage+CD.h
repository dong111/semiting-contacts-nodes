//
//  UIImage+CD.h
//  16-03-09-(熔炼)-水印图片
//
//  Created by 陈栋 on 16/3/9.
//  Copyright © 2016年 man. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (CD)


/**
 *  返回一张带水印的图片
 */
+ (UIImage *) waterImageWithBgImage:(NSString *)bgName waterName:(NSString *)waterName;

/**
 *  图片剪切功能
 *
 *  @param imageName   截图名称
 *  @param borderWith  图片边框宽度
 *  @param borderColor 图片边框颜色
 *
 *  @return 截图图片
 */
+(UIImage *)circleImageViewWithImageName:(NSString *)imageName borderWith:(CGFloat)borderWith borderColor:(UIColor *)borderColor;
@end
