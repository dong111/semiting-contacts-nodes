//
//  ViewController.m
//  16-03-09-(熔炼)-水印图片
//
//  Created by 陈栋 on 16/3/9.
//  Copyright © 2016年 man. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+CD.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self testCircleImageMeth];

}
//截屏方法实现
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //1.创建位图【也就意味着，将来绘制的东西最近显示在一张图片上】，并设置大小
    //    UIGraphicsBeginImageContext(self.view.bounds.size);
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, NO, 0.0);
    //将当前控制器的view图层渲染到当前上下文
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    //从当前上下文获取图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();

    
    //结束位图编辑
    UIGraphicsEndImageContext();
    
    //数据保存到沙盒中去
    NSData *imgData = UIImagePNGRepresentation(newImage);
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSLog(@"%@",doc);
    
    NSString *imgPath = [doc stringByAppendingString:@"capture.png"];
    [imgData writeToFile:imgPath atomically:YES];
    
}


//测试剪切图片方法
- (void) testCircleImageMeth
{
    self.imageView.image = [UIImage circleImageViewWithImageName:@"papa" borderWith:2 borderColor:[UIColor redColor]];
}
/**
 *  测试水印方法
 */
- (void) testWaterImageMeth
{
    //将水印图片显示到ImageView
    self.imageView.image = [UIImage waterImageWithBgImage:@"scene" waterName:@"logo"];
    
    //将水印图片保存到本地路径
    [self saveImage:self.imageView.image ToPath:@"/Users/chendong/Desktop/new.png"];
}


/**
 *  图片保存到指定路径
 *
 *  @param image 要保存图片
 *  @param path  保存路径
 */
- (void) saveImage:(UIImage *) image ToPath:(NSString *) path
{
    //将图片装换成二进制文件才能保存
    NSData *imageData = UIImagePNGRepresentation(image);
    
    //二进制文件保存da
    //    If YES, the data is written to a backup file, and then—assuming no errors occur—the backup file is renamed to the name specified by path; otherwise, the data is written directly to path.
    [imageData writeToFile:path atomically:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
