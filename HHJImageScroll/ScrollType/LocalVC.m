//
//  LocalVC.m
//  HHJImageScroll
//
//  Created by 郝好杰 on 2017/5/21.
//  Copyright © 2017年 HHJ. All rights reserved.
//

#import "LocalVC.h"
#import "HHJImageScrollView.h"

#define hjScreen_width    [UIScreen mainScreen].bounds.size.width

@interface LocalVC ()

@property (nonatomic, strong)HHJImageScrollView         *imageScroll;

@end

@implementation LocalVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //解决CollectionView里的cell的偏移问题；
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    NSArray *imageNameArray = @[@"car01.jpeg",
                                @"car02.jpeg",
                                @"car03.jpeg",
                                @"car04.jpeg",
                                @"car05.jpeg",
                                @"car06.jpeg"];
    
    HHJImageScrollView *imageScroll = [HHJImageScrollView imageScrollViewWithFrame:CGRectMake(0, 64, hjScreen_width, 220) isInfiniteLoop:YES imageNamesArray:imageNameArray];
    [self.view addSubview:imageScroll];
    
    imageScroll.pageControlDotSize = CGSizeMake(40, 20);
//    imageScroll.pageControlRightOffset = 50;
//    imageScroll.pageControlBottomOffset = 100;
    imageScroll.autoScrollDirection = UICollectionViewScrollDirectionHorizontal;
//    imageScroll.currentPageDotColor = [UIColor redColor];
//    imageScroll.currentPageDotImage = [UIImage imageNamed:@"pageControlCurrentDot"];
//    imageScroll.othersPageDotImage = [UIImage imageNamed:@"pageControlDot"];
    _imageScroll = imageScroll;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
