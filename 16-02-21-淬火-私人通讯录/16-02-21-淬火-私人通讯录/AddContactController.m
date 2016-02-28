//
//  AddContactController.m
//  16-02-21-淬火-私人通讯录
//
//  Created by 陈栋 on 16/2/27.
//  Copyright © 2016年 man. All rights reserved.
//

#import "AddContactController.h"

@interface AddContactController ()
@property (weak, nonatomic) IBOutlet UITextField *contactName;
@property (weak, nonatomic) IBOutlet UITextField *contactPhone;

@end

@implementation AddContactController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveContact:(id)sender {
    //获取当前用户名和密码
     NSString *contactName = self.contactName.text;
     NSString *contactPhone = self.contactPhone.text;
    
    NSLog(@"%@,%@",contactName,contactPhone);
    
    //通知上一个控制器完成联系人添加
    
    if ([self.delege respondsToSelector:@selector(saveContactWithName:tel:)]) {
        [self.delege saveContactWithName:contactName tel:contactPhone];
    }
    
}

@end
