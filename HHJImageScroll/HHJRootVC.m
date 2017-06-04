//
//  HHJRootVC.m
//  HHJImageScroll
//
//  Created by 郝好杰 on 2017/5/20.
//  Copyright © 2017年 HHJ. All rights reserved.
//

#import "HHJRootVC.h"
#import "LocalVC.h"
#import "WebImageVC.h"
#import "ImageAndTitleVC.h"
#import "SingleTextVC.h"

@interface HHJRootVC ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)UITableView        *tableview;
@property (nonatomic, strong)NSArray            *arrayType;

@end

@implementation HHJRootVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.arrayType = @[@"本地图片实现轮播",@"网络图片实现轮播",@"图片上显示文字说明的轮播",@"纯文本上下轮播"];
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
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSArray *classNameArray = @[@"LocalVC",
                                @"WebImageVC",
                                @"ImageAndTitleVC",
                                @"SingleTextVC",];
    Class clss = NSClassFromString(classNameArray[indexPath.row]);
    UIViewController *vc = [[clss alloc] init];
    vc.navigationItem.title = self.arrayType[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];

}


@end
