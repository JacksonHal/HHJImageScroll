//
//  HHJImageScrollView.h
//  HHJImageScroll
//
//  Created by 郝好杰 on 2017/5/21.
//  Copyright © 2017年 HHJ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    HHJScrollViewPageControlStyleSystem,        //系统自带的样式
    HHJScrollViewPageControlStyleAnimated,      //动画效果pageControl
    HHJScrollViewPageControlStyleNone,          //不显示pageControl
}HHJScrollViewPageControlStyle;

typedef enum {
    HHJPageControlAlimentRight,                 //分页控制器居右端
    HHJPageControlAlimentCenter,                //分页控制器居中心
}HHJPageControlAliment;

@interface HHJImageScrollView : UIView

/************************轮播图的初始化*********************/
/**
 本地图片轮播初始化

 @param frame imageScrollViewW的frame
 @param isInfiiteLoop 是否无限循环
 @param imageNamesArray 存放本地轮播图片的数组
 @return HHJImageScrollView的对象
 */
+ (instancetype)imageScrollViewWithFrame:(CGRect)frame isInfiniteLoop:(BOOL)isInfiiteLoop imageNamesArray:(NSArray *)imageNamesArray;

/**
 网络图片轮播图的初始化

 @param frame imageScrollView的frame
 @param urlArray 存放网络图片的地址的数组
 @param placeholderImage 网络图片的占位图
 @return HHJImageScrollView的对象
 */
+ (instancetype)imageScrollViewWithFrame:(CGRect)frame imageUrlStringArray:(NSArray *)urlArray placeholderImage:(UIImage *)placeholderImage;



/**
 是否无限循环,默认Yes
 */
@property (nonatomic,assign) BOOL               isInfiniteLoop;

/**
 本地图片数组
 */
@property (nonatomic, strong) NSArray           *localImageNamesArray;

/**
 是否自动滚动,默认Yes
 */
@property (nonatomic, assign) BOOL               autoScroll;

/**
 图片的滚动方向，默认水平滚动
 */
@property (nonatomic, assign) UICollectionViewScrollDirection       autoScrollDirection;



/****************************滚动控制**************************/

//设置自动滚动的时间间隔，默认为2s
@property (nonatomic, assign)CGFloat            autoScrollTimeInterval;

/*****************自定义样式接口***************/

/**
 是否在只有一张图时隐藏pagecontrol，默认为YES
 */

@property (nonatomic) BOOL                        hidesForSinglePage;

/**
 分页的样式，默认为动画的样式 HHJScrollViewPageControlStyleAnimated
 */
@property (nonatomic, assign)HHJScrollViewPageControlStyle      pageControlStyle;

/**
 分页控件小圆标大小
 */
@property (nonatomic, assign) CGSize              pageControlDotSize;

/**
 分页控件距离轮播图的底部间距（在默认间距基础上）的偏移量
 */
@property (nonatomic, assign) CGFloat             pageControlBottomOffset;

/**
 分页控件距离轮播图的右边间距（在默认间距基础上）的偏移量
 */
@property (nonatomic, assign) CGFloat             pageControlRightOffset;

/**
 分页控件位置
 */
@property (nonatomic, assign) HHJPageControlAliment pageControlAliment;

/**
 当前分页控件小圆标颜色
 */
@property (nonatomic, strong) UIColor             *currentPageDotColor;

/**
 其他分页控件小圆标颜色
 */
@property (nonatomic, strong) UIColor             *otherPageDotColor;

/**
 自定义分页控件当前小圆点的Image
 */
@property (nonatomic, strong) UIImage             *currentPageDotImage;

/**
 自定义分页控件其他小圆点的Image
 */
@property (nonatomic, strong) UIImage             *othersPageDotImage;


/****************************网络图片的处理******************************/

@property (nonatomic, strong) UIImage             *placeholderImage;

@end
