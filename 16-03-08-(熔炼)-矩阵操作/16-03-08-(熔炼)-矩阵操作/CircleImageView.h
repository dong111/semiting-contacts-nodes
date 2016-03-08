//
//  CircleImageView.h
//  16-03-08-(熔炼)-矩阵操作
//
//  Created by 陈栋 on 16/3/8.
//  Copyright © 2016年 man. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircleImageView : UIView

/**
 *  图片名称
 */
@property (nonatomic,copy) NSString *imageName;

/**
 *  边框的颜色
 */
@property (nonatomic,strong) UIColor *borderColor;

/**
 *  边框的宽度
 */
@property (nonatomic,assign) CGFloat borderWidth;

@end
