//
//  HHJRootVC.m
//  HHJImageScroll
//
//  Created by 郝好杰 on 2017/5/20.
//  Copyright © 2017年 HHJ. All rights reserved.
//

#import "HHJRootVC.h"
#import "LocalVC.h"

@interface HHJRootVC ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)UITableView        *tableview;
@property (nonatomic, strong)NSArray            *arrayType;

@end

@implementation HHJRootVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.arrayType = @[@"本地图片实现轮播"];
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    _tableview = tableView;
    [self.view addSubview:_tableview];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


#pragma mark -UITableViewDelegate & UITableViewDatasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrayType.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50.f;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString * const cellID = @"tbvID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = self.arrayType[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        LocalVC *vc = [[LocalVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}


@end