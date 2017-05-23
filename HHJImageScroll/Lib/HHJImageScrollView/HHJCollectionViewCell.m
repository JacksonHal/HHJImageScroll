//
//  HHJCollectionViewCell.m
//  HHJImageScroll
//
//  Created by 郝好杰 on 2017/5/21.
//  Copyright © 2017年 HHJ. All rights reserved.
//

#import "HHJCollectionViewCell.h"
#import "UIView+HHJExtension.h"
@implementation HHJCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupImageView];
    }
    return self;
}

-(void)setupImageView {
    UIImageView *imageView = [[UIImageView alloc] init];
    [self.contentView addSubview:imageView];
    _imageView = imageView;
    
}
-(void)layoutSubviews {
    [super layoutSubviews];
    _imageView.frame = self.bounds;
    _imageView.backgroundColor = [UIColor blueColor];
}
@end
