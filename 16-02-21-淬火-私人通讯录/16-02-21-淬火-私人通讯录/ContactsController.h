//
//  ContactsController.h
//  16-02-21-淬火-私人通讯录
//
//  Created by 陈栋 on 16/2/22.
//  Copyright © 2016年 man. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddContactController.h"
#import "Contact.h"
#import "EditContactController.h"

@interface ContactsController : UITableViewController <AddContactControllerDelegate,EditContactControllerDelegate>

@property (nonatomic,strong) NSString *userName;



@end
