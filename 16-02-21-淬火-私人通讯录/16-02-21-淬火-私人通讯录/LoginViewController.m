//
//  LoginViewController.m
//  16-02-21-淬火-私人通讯录
//
//  Created by 陈栋 on 16/2/22.
//  Copyright © 2016年 man. All rights reserved.
//

#import "LoginViewController.h"
#import "ContactsController.h"
#import "MBProgressHUD+CZ.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userNameView;
@property (weak, nonatomic) IBOutlet UITextField *passWordView;
@property (weak, nonatomic) IBOutlet UIButton *loginView;
@property (weak, nonatomic) IBOutlet UISwitch *remeberPwdSWitch;
@property (weak, nonatomic) IBOutlet UISwitch *autoLoginSwitch;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //通过消息中心获取文本框改变事件来控制登陆按钮显示隐藏
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.userNameView];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.passWordView];
    //控件添加事件来控制登陆按钮显示隐藏
//    [self.userNameView addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
//    [self.passWordView addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    
    // Do any additional setup after loading the view.
}

- (void)dealloc
{
    //退订通知
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (IBAction)loginInputChange:(id)sender {
    
    [self textChange];
}

- (void)textChange
{
    if (self.userNameView.text.length>0
        &&self.passWordView.text.length>0) {
        self.loginView.enabled = YES;
    }else{
        self.loginView.enabled = NO;
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)login:(id)sender {
    if (!self.userNameView.hasText) {
//        NSLog(@"请输入用户名！");
        [MBProgressHUD showMessage:@"请输入用户名！"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUD];
        });
        
        return;
    }
    
    if (!self.passWordView.hasText) {
//        NSLog(@"请输入密码！");
        [MBProgressHUD showMessage:@"请输入密码！"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUD];
        });
        return;
    }
    NSString *userName = [self.userNameView text];
    NSString *passWd = [self.passWordView text];
    
    [MBProgressHUD showMessage:@"登陆中……"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //隐藏登陆消息框
        [MBProgressHUD hideHUD];
        if ([userName isEqualToString:@"zz"]
            &&[passWd isEqualToString:@"xx"]) {
//            NSLog(@"登陆成功！");
            [self performSegueWithIdentifier:@"toContactSeg" sender:nil];
            //判断是否要记住用户密码
            
        }else{
//            NSLog(@"用户名或密码不正确！");
            //给一个错误的提示
            [MBProgressHUD showError:@"帐号或者密码不正确"];
        }
    });
    

}

/**
 *   使用segue跳转下一个界面之前会调用
 *
 *  @param segue  连线
 *  @param sender
 */
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSLog(@"%s",__func__);
    NSLog(@"源控制器:%@",segue.sourceViewController);
    NSLog(@"目标控制器:%@",segue.destinationViewController);
    //给下一个controller传递数据
    id destVc = segue.destinationViewController;
    if ([destVc isKindOfClass:[ContactsController class]]) {
        ContactsController *contactVc = destVc;
        contactVc.userName = self.userNameView.text;
//        contactVc.userName = [self.userNameView text];
    }
}
/**
 *  监听记住密码的事件
 *
 *  @param sender <#sender description#>
 */
- (IBAction)remeberUsernameSwitch:(id)sender {
    
    //如果记住密码为关闭状态，自动登录为开启状态，怎自动登录应该改变成关闭状态
    if (self.remeberPwdSWitch.isOn==NO
        &&self.autoLoginSwitch.isOn==YES) {
//        self.autoLoginSwitch.on = NO;
        [self.autoLoginSwitch setOn:NO animated:YES];
    }
    
}
/**
 *  监听自动登录按钮switch事件
 *
 *  @param sender <#sender description#>
 */
- (IBAction)autoLoginSwitch:(id)sender {
    if (self.autoLoginSwitch.isOn==NO
        &&self.remeberPwdSWitch.isOn==YES) {
//        self.remeberPwdSWitch.on = NO;
        
       [self.remeberPwdSWitch setOn:NO animated:YES];
    }
    
}


@end
