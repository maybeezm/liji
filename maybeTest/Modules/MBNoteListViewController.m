//
//  MBNoteListViewController.m
//  maybeTest
//
//  Created by maybee on 2018/10/9.
//  Copyright © 2018 maybee. All rights reserved.
//

#import "MBNoteListViewController.h"
#import "SliderCell.h"
#import "SliderMenu.h"
@interface MBNoteListViewController ()<UITableViewDelegate, UITableViewDataSource,SliderMenuDelegate>

@property (nonatomic, strong) UITableView *tv;
@property (nonatomic, strong) NSMutableArray *datas;

@end

@implementation MBNoteListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"SliderMenu";
    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc]initWithTitle:@"close" style:UIBarButtonItemStylePlain target:self action:@selector(close)];
    self.navigationItem.rightBarButtonItem = rightBarItem;
    
    _datas = @[@"0",@"1",@"2",@"3",@"4"].mutableCopy;
    _tv = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tv.dataSource = self;
    _tv.rowHeight = 55;
    _tv.tableFooterView = UIView.new;
    [self.view addSubview:_tv];
    [_tv registerClass:SliderCell.class forCellReuseIdentifier:@"slidercell"];
    
}
- (void)close{
    [[SliderMenu shared] close];
}

- (void)open:(SliderCell *)cell{
    [[SliderMenu shared] close];
    [cell openMenu:true time:0.3 springX:0];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SliderCell *cell = [_tv dequeueReusableCellWithIdentifier:@"slidercell"];
    cell.menuDelegate = self;
    
    cell.textLabel.text = [_datas objectAtIndex:indexPath.row];
    
    return cell;
    
}

// === SliderDelegate ===
- (NSArray<MenuItem *> *)sliderMenuItemsForIndexPath:(NSIndexPath *)indexPath{
    /*
     可设置item属性：title bgcolor font width titleColor
     */
    MenuItem *item1 = [MenuItem title:@"编辑" bgcolor:UIColor.blueColor];
    MenuItem *item3 = [MenuItem title:@"提醒" bgcolor:UIColor.cyanColor];
    MenuItem *item2 = [MenuItem title:@"删除" bgcolor:UIColor.redColor];
    
    return @[item1,item3,item2];
}

// return ture == 自动关闭 == [[SliderMenu shared] close];
- (BOOL)sliderMenuDidSelectIndex:(NSInteger)index atIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"didSelectIndex:%ld row:%ld",index,indexPath.row);
    if (index == 1){
        [_datas removeObjectAtIndex:indexPath.row];
        // deleteRow貌似是让cell做了transform后hidden掉 并非真的delete
        [_tv deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    }
    return false;
    
}

@end

