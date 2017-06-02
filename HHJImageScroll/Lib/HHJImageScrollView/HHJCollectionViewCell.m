//
//  HHJCollectionViewCell.m
//  HHJImageScroll
//
//  Created by 郝好杰 on 2017/5/21.
//  Copyright © 2017年 HHJ. All rights reserved.
//

#import "HHJCollectionViewCell.h"
#import "UIView+HHJExtension.h"

@implementation HHJCollectionViewCell {

    __weak UILabel      *_titleLabel;
    
}

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setUpImageView];
        [self setUpTitleLabel];
    }
    return self;
}

-(void)setUpImageView {
    UIImageView *imageView = [[UIImageView alloc] init];
    [self.contentView addSubview:imageView];
    _imageView = imageView;
    
}

- (void)setUpTitleLabel {
    UILabel  *titleLabel = [[UILabel alloc] init];
    _titleLabel = titleLabel;
    _titleLabel.hidden = YES;
    [self.contentView addSubview:titleLabel];
}

-(void)layoutSubviews {
    [super layoutSubviews];
    
    if (self.onlyDispalyTitle) {
        _titleLabel.frame = self.bounds;
    }else {
        _imageView.frame = self.bounds;
        CGFloat titleW = self.hj_width;
        CGFloat titleH = self.titleLabelHeight;
        CGFloat titleX = 0;
        CGFloat titleY = self.hj_height-titleH;
        _titleLabel.frame = CGRectMake(titleX, titleY, titleW, titleH);
    }
}

#pragma mark -setter

- (void)setTitle:(NSString *)title {
    _title = title;
    _titleLabel.text = title;
    if (_titleLabel.hidden) {
        _titleLabel.hidden = NO;
    }
}
- (void)setTextFont:(UIFont *)textFont {
    _textFont = textFont;
    _titleLabel.font = textFont;
}
- (void)setTextAlign:(NSTextAlignment)textAlign {
    _textAlign = textAlign;
    _titleLabel.textAlignment = textAlign;
}
- (void)setTextColor:(UIColor *)textColor {
    _textColor = textColor;
    _titleLabel.textColor = textColor;
}
- (void)setTitleLabelBgColor:(UIColor *)titleLabelBgColor {
    _titleLabelBgColor = titleLabelBgColor;
    _titleLabel.backgroundColor = titleLabelBgColor;
}
@end
