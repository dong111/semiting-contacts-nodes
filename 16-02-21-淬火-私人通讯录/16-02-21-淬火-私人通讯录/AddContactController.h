//
//  AddContactController.h
//  16-02-21-淬火-私人通讯录
//
//  Created by 陈栋 on 16/2/27.
//  Copyright © 2016年 man. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AddContactControllerDelegate <NSObject>

@required
- (void)saveContactWithName:(NSString *)name tel:(NSString *)tel
;
@end

@interface AddContactController : UIViewController

@property (nonatomic,weak) id<AddContactControllerDelegate> delege;

@end
