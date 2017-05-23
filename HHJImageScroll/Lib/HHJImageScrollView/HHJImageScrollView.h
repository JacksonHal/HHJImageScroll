//
//  HHJImageScrollView.h
//  HHJImageScroll
//
//  Created by 郝好杰 on 2017/5/21.
//  Copyright © 2017年 HHJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HHJImageScrollView : UIView


/**
 本地图片轮播初始化

 @param frame imageScrollViewW的frame
 @param isInfiiteLoop 是否无限循环
 @param imageNamesArray 存放本地轮播图片的数组
 @return HHJImageScrollView的对象
 */
+(instancetype)imageScrollViewWithFrame:(CGRect)frame isInfiniteLoop:(BOOL)isInfiiteLoop imageNamesArray:(NSArray *)imageNamesArray;


/** 是否无限循环,默认Yes */
@property (nonatomic,assign) BOOL               isInfiniteLoop;

/** 本地图片数组 */
@property (nonatomic, strong) NSArray           *localImageNamesArray;

/** 是否自动滚动,默认Yes */
@property (nonatomic, assign) BOOL               autoScroll;

//图片的滚动方向，默认水平滚动
@property (nonatomic, assign) UICollectionViewScrollDirection       scrollDirection;

/*****************滚动控制***************/
//设置自动滚动的时间间隔，默认为2s
@property (nonatomic, assign)CGFloat            autoScrollTimeInterval;

@end
