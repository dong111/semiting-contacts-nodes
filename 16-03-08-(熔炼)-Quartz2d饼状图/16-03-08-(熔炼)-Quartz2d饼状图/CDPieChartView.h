//
//  CDPieChartView.h
//  16-03-08-(熔炼)-Quartz2d饼状图
//
//  Created by 陈栋 on 16/3/8.
//  Copyright © 2016年 man. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CDPieChartView : UIView


/**
 * 数据里只能放int @[@20,@30,@20,@30]
 */
@property (nonatomic,strong)NSArray   *sections;


/**
 *  指定不同section的饼状颜色
 */
@property (nonatomic,strong)NSArray   *sectionColors;


@end
