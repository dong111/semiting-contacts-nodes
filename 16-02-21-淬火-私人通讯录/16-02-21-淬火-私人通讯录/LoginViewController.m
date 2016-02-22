//
//  LoginViewController.m
//  16-02-21-淬火-私人通讯录
//
//  Created by 陈栋 on 16/2/22.
//  Copyright © 2016年 man. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userNameView;
@property (weak, nonatomic) IBOutlet UITextField *passWordView;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)login:(id)sender {
    if (!self.userNameView.hasText) {
        NSLog(@"请输入用户名！");
        return;
    }
    
    if (!self.passWordView.hasText) {
        NSLog(@"请输入密码！");
        return;
    }
    NSString *userName = [self.userNameView text];
    NSString *passWd = [self.passWordView text];
    
    if ([userName isEqualToString:@"zz"]
        &&[passWd isEqualToString:@"xx"]) {
        
        
        NSLog(@"登陆成功！");
        
        [self performSegueWithIdentifier:@"toContactSeg" sender:nil];
        
    }else{
        NSLog(@"用户名或密码不正确！");
    }
}

/**
 *   使用segue跳转下一个界面之前会调用
 *
 *  @param segue  <#segue description#>
 *  @param sender <#sender description#>
 */
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSLog(@"%s",__func__);
    NSLog(@"源控制器:%@",segue.sourceViewController);
    NSLog(@"目标控制器:%@",segue.destinationViewController);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
