//
//  EditContactController.m
//  16-02-21-淬火-私人通讯录
//
//  Created by 陈栋 on 16/2/28.
//  Copyright © 2016年 man. All rights reserved.
//

#import "EditContactController.h"

@interface EditContactController ()
@property (weak, nonatomic) IBOutlet UITextField *contactName;
@property (weak, nonatomic) IBOutlet UITextField *contactTel;
@property (weak, nonatomic) IBOutlet UIButton *saveContactBtn;

@end

@implementation EditContactController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.contact!=nil) {
        [self.contactName setText:self.contact.name];
        [self.contactTel setText:self.contact.tel];
    }
    self.contactName.enabled = NO;
    self.contactTel.enabled = NO;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)editContact:(id)sender {
    self.saveContactBtn.enabled = YES;
    self.contactName.enabled = YES;
    self.contactTel.enabled = YES;
}

- (IBAction)saveContact:(id)sender {
    
    self.contact.name = self.contactName.text;
    self.contact.tel = self.contactTel.text;
    
    if ([self.delegate respondsToSelector:@selector(editContactViewController:saveEditContact:)]) {
        [self.delegate editContactViewController:self  saveEditContact:self.contact];
    }
    
}

- (void)dealloc
{
    NSLog(@"编辑器控件销毁%s",__FUNCTION__);
}


@end
