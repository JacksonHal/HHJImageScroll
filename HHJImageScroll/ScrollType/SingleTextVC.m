//
//  SingleTextVC.m
//  HHJImageScroll
//
//  Created by 郝好杰 on 2017/6/3.
//  Copyright © 2017年 HHJ. All rights reserved.
//

#import "SingleTextVC.h"
#import "HHJImageScrollView.h"

#define hjScreen_width    [UIScreen mainScreen].bounds.size.width

@interface SingleTextVC ()

@property (nonatomic, strong)HHJImageScrollView         *imageScroll;
@property (nonatomic, strong)NSArray                    *titleArray;

@end

@implementation SingleTextVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.titleArray = @[@"苹果🍎",
                        @"香蕉🍌",
                        @"菠萝🍍",
                        @"西瓜🍉",
                        @"桃子🍑",];
    HHJImageScrollView *imageScroll = [HHJImageScrollView imageScrollViewWithFrame:CGRectMake(0, 64, hjScreen_width, 50) isInfiniteLoop:YES imageNamesArray:nil];
    [self.view addSubview:imageScroll];
    imageScroll.autoScrollDirection = UICollectionViewScrollDirectionVertical;
    imageScroll.onlyDispalyTitle = YES;//设置只显示文字
    imageScroll.titleArray = self.titleArray;
    imageScroll.textAlign = NSTextAlignmentCenter;
    //imageScroll.backgroundColor = [UIColor whiteColor];
    imageScroll.pageControlDotSize = CGSizeMake(40, 20);
    
    _imageScroll = imageScroll;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
