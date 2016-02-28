//
//  EditContactController.h
//  16-02-21-淬火-私人通讯录
//
//  Created by 陈栋 on 16/2/28.
//  Copyright © 2016年 man. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contact.h"
@class EditContactController;

@protocol EditContactControllerDelegate <NSObject>

@required
- (void) editContactViewController:(EditContactController *)editController saveEditContact:(Contact *)contact;
@end

@interface EditContactController : UIViewController

@property (nonatomic,strong) Contact *contact;

@property (nonatomic,weak) id<EditContactControllerDelegate> delegate;

@end
