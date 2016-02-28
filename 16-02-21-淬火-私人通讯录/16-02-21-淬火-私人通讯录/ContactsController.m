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
    
    [self.navigationController popViewControllerAnimated:YES];
}






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
