//
//  UIView+HHJExtension.m
//  HHJImageScroll
//
//  Created by 郝好杰 on 2017/5/20.
//  Copyright © 2017年 HHJ. All rights reserved.
//

#import "UIView+HHJExtension.h"

@implementation UIView (HHJExtension)

- (CGFloat)hj_x {
    return self.frame.origin.x;
}
- (void)setHj_x:(CGFloat)hj_x {
    CGRect hjFrame = self.frame;
    hjFrame.origin.x = hj_x;
    self.frame = hjFrame;
}

- (CGFloat)hj_y {
    return self.frame.origin.y;
}
- (void)setHj_y:(CGFloat)hj_y {
    CGRect hjFrame = self.frame;
    hjFrame.origin.y = hj_y;
    self.frame = hjFrame;
}

- (CGFloat)hj_width {
    return self.frame.size.width;
}
- (void)setHj_width:(CGFloat)hj_width {
    CGRect hjFrame = self.frame;
    hjFrame.size.width = hj_width;
    self.frame = hjFrame;
}

- (CGFloat)hj_height {
    return self.frame.size.height;
}
- (void)setHj_height:(CGFloat)hj_height {
    CGRect hjFrame = self.frame;
    hjFrame.size.height = hj_height;
    self.frame = hjFrame;
}
@end
