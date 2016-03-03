//
//  ContactsController.m
//  16-02-21-淬火-私人通讯录
//
//  Created by 陈栋 on 16/2/22.
//  Copyright © 2016年 man. All rights reserved.
//

#import "ContactsController.h"

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
    //注销  NSLocalizedString 国际化使用
    NSString *cancelButtonTitle = NSLocalizedString(@"取消", nil);
    NSString *destructiveButtonTitle = NSLocalizedString(@"确定", nil);
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
   //create the actions
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
//        NSLog(@"取消");
    }];
    
    
    UIAlertAction *desttructiveAction = [UIAlertAction actionWithTitle:destructiveButtonTitle style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        [self.navigationController popViewControllerAnimated:YES];
    }];
    
    [alertController addAction:cancelAction];
    [alertController addAction:desttructiveAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
    

}



//- (IBAction)loginOutClick:(id)sender {
//    //注销
//    UIActionSheet *sheet = [[UIActionSheet alloc]initWithTitle:@"提醒" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"确认" otherButtonTitles:nil, nil];
//    
//    [sheet showInView:self.view];
//    
////    [self.navigationController popViewControllerAnimated:YES];
//}
//
//
//- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
//{
////    NSLog(@"%ld",buttonIndex);
//    if (buttonIndex==0) {
//        //点击确认按钮
//        [self.navigationController popViewControllerAnimated:YES];
//    }else if (buttonIndex==1){
//        //点击取消按钮
//    }
//}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //获取模板控制器
    id destVc = segue.destinationViewController;
    if ([destVc isKindOfClass:[AddContactController class]]) {
        AddContactController *addController = destVc;
        addController.delege = self;
      
    }else if([destVc isKindOfClass:[EditContactController class]]){
       //goto编辑控制器,获取controller
        EditContactController *editController = destVc;
        //获取对应索引联系人
        editController.contact = self.contacts[self.tableView.indexPathForSelectedRow.row];
        editController.delegate = self;
        
    }
    
//    NSLog(@"%s",__func__);
}


//存储联系人
#pragma -mark 实现子控制器的代理方法 添加联系人
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
#pragma --mark 编辑联系人控制代理
- (void)editContactViewController:(id)editController saveEditContact:(Contact *)contact
{
    //隐藏编辑联系人控制器
    [self.navigationController popViewControllerAnimated:YES];
    
    //更改数据
    NSInteger row = [self.contacts indexOfObject:contact];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:0];
    //局部刷新数据
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    
    

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
    //测试tableviewCell是否不需要初始化，在storybord中赋值Idendtify就可以了
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:requiredId];
//    }
    Contact *contact = self.contacts[indexPath.row];
    [cell.textLabel setText:contact.name];
    [cell.detailTextLabel setText:contact.tel];

    return cell;

}




@end
