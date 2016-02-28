//
//  ContactsController.m
//  16-02-21-淬火-私人通讯录
//
//  Created by 陈栋 on 16/2/22.
//  Copyright © 2016年 man. All rights reserved.
//

#import "ContactsController.h"
#import "Contact.h"

@interface ContactsController ()

@property (nonatomic,strong) NSMutableArray *contacts;

@property (nonatomic,copy) NSString *contactPath;

@end

@implementation ContactsController

- (NSMutableArray *)contacts
{
    if (_contacts==nil) {
        _contacts = [[NSMutableArray alloc]init];
    }
    return _contacts;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = [NSString stringWithFormat:@"%@通讯录",self.userName];

}

- (IBAction)loginOutClick:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}






- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //获取模板控制器
    id destVc = segue.destinationViewController;
    if ([destVc isKindOfClass:[AddContactController class]]) {
        AddContactController *addController = destVc;
        addController.delege = self;
      
    }else{
       
    }
    
//    NSLog(@"%s",__func__);
}

//存储联系人
- (void)saveContactWithName:(NSString *)name tel:(NSString *)te
{
    Contact *contact = [[Contact alloc] initContactWithName:name AndTel:te];
    [self.contacts addObject:contact];
    
    //局部刷新
    NSIndexPath *lastPath = [NSIndexPath indexPathForRow:self.contacts.count-1 inSection:0];
    
    [self.tableView insertRowsAtIndexPaths:@[lastPath] withRowAnimation:UITableViewRowAnimationRight];
    
    [self.navigationController popViewControllerAnimated:YES];
    
//    [self.tableView reloadData];
    
    
    
}






#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    
//    return 0;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.contacts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *requiredId = @"contact";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:requiredId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:requiredId];
    }
    Contact *contact = self.contacts[indexPath.row];
    [cell.textLabel setText:contact.name];
    [cell.detailTextLabel setText:contact.tel];

    return cell;

}




@end
