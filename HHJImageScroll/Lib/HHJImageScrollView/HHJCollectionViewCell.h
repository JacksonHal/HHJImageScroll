//
//  HHJCollectionViewCell.h
//  HHJImageScroll
//
//  Created by 郝好杰 on 2017/5/21.
//  Copyright © 2017年 HHJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HHJCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong)UIImageView            *imageView;

@property (nonatomic, copy)NSString                 *title;

//文字控件的高度
@property (nonatomic, assign)CGFloat                titleLabelHeight;
//显示文字的颜色
@property (nonatomic, strong)UIColor                *textColor;
//文字控件的背景色
@property (nonatomic, strong)UIColor                *titleLabelBgColor;
//文字的对齐方式
@property (nonatomic, assign)NSTextAlignment        textAlign;
//显示文字的大小
@property (nonatomic, strong)UIFont                 *textFont;


/**
 是否只显示文字轮播
 */
@property (nonatomic, assign)BOOL                   onlyDispalyTitle;


/**
 是否已经配置好图片轮播里的属性
 */
@property (nonatomic, assign)BOOL                   hasConfigured;

@end
