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
