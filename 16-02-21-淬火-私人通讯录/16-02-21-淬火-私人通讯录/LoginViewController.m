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

//定义用户偏好设置的key 防止写错
#define remenberPwdKey @"remenberPwd" //记住密码
#define autoLoginKey @"autoLogin" //自动登录
#define userNameKey @"userName"
#define passWordKey @"passWord"

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
    
    //设置开往的默认值
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    、
    self.remeberPwdSWitch.on = [defaults boolForKey:remenberPwdKey];
    self.autoLoginSwitch.on = [defaults boolForKey:autoLoginKey];
    
    //设置账号密码默认值
    self.userNameView.text = [defaults stringForKey:userNameKey];
    if (self.remeberPwdSWitch.isOn) {
        self.passWordView.text = [defaults stringForKey:passWordKey];
    }
    
    //调用文本变化的方法
    [self textChange];
    
    //如果自动登录  延迟自动登录
    if (self.autoLoginSwitch.isOn) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self login:nil];
        });
    }

    
    
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
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            [defaults setObject:userName forKey:userNameKey];
            if (self.remeberPwdSWitch.isOn) {
                [defaults setObject:passWd forKey:passWordKey];
            }
            //同步数据
            [defaults synchronize];
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
    
    [self saveSwitchValuseToPerference];
    
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
    [self saveSwitchValuseToPerference];
}


//保存开关数据到用户偏好设置
- (void) saveSwitchValuseToPerference
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setBool:self.remeberPwdSWitch.isOn forKey:remenberPwdKey];
    [defaults setBool:self.autoLoginSwitch.isOn forKey:autoLoginKey];
    
    
    [defaults synchronize];
    
}



@end
