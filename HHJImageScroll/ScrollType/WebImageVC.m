//
//  WebImageVC.m
//  HHJImageScroll
//
//  Created by meixiang02 on 2017/5/26.
//  Copyright © 2017年 HHJ. All rights reserved.
//

#import "WebImageVC.h"
#import "HHJImageScrollView.h"

#define hjScreen_width    [UIScreen mainScreen].bounds.size.width
@interface WebImageVC ()

@property (nonatomic, strong)HHJImageScrollView         *imageScroll;

@end

@implementation WebImageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //解决CollectionView里的cell的偏移问题；
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    NSArray *imageUrlArray = @[@"http://www.tenda.com.cn/newspic/20170502/1ooxg23vu2n.jpg",
                                @"http://resource.feng.com/resource/h061/h78/img201705181655190.jpg",
                                @"http://car.southcn.com/7/attachment/20170425/20034044/414e22d1259941f49864.jpg",
                                @"http://img1.cheshi-img.com/center/600/74/e6/86/97c5597c7419b2ec344e75cd62.jpeg",
                                @"http://img1.bitautoimg.com/Video/2015/08/25/2015825174750469.jpg"
                                ];
    
    HHJImageScrollView *imageScroll = [HHJImageScrollView imageScrollViewWithFrame:CGRectMake(0, 64, hjScreen_width, 220) imageUrlStringArray:imageUrlArray placeholderImage:[UIImage imageNamed:@"placeholder"]];
    [self.view addSubview:imageScroll];
    
    imageScroll.pageControlDotSize = CGSizeMake(10, 10);
    //    imageScroll.pageControlRightOffset = 50;
    //    imageScroll.pageControlBottomOffset = 100;
    imageScroll.autoScrollDirection = UICollectionViewScrollDirectionHorizontal;
    //    imageScroll.currentPageDotColor = [UIColor redColor];
    imageScroll.currentPageDotImage = [UIImage imageNamed:@"pageControlCurrentDot"];
    imageScroll.othersPageDotImage = [UIImage imageNamed:@"pageControlDot"];
    _imageScroll = imageScroll;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
