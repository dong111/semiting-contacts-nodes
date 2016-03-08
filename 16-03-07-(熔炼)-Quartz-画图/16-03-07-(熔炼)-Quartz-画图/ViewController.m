//
//  ViewController.m
//  16-03-07-(熔炼)-Quartz-画图
//
//  Created by 陈栋 on 16/3/7.
//  Copyright © 2016年 man. All rights reserved.
//

#import "ViewController.h"
#import "ProgressCircle.h"

@interface ViewController ()
/**
 * 自定义进度圆控件
 */
@property (weak, nonatomic) IBOutlet ProgressCircle *progressCircle;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)silderChange:(id)sender {
    UISlider *slider = sender;
    
//    NSLog(@"%f",slider.value);
    self.progressCircle.progress = slider.value;
    
}

@end
