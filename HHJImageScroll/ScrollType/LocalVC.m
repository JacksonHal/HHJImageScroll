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
    
    
    HHJImageScrollView *imageScroll = [HHJImageScrollView imageScrollViewWithFrame:CGRectMake(0, 64, hjScreen_width, 180) isInfiniteLoop:YES imageNamesArray:nil];
    [self.view addSubview:imageScroll];
    _imageScroll = imageScroll;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
