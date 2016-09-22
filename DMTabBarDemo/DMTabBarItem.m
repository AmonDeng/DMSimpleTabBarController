//
//  DMTabBarItem.m
//  DMTabBarDemo
//
//  Created by Amon   Deng on 2016/9/21.
//  Copyright © 2016年 Amon. All rights reserved.
//

#import "DMTabBarItem.h"

NSString *const kDMTabBarItemAttributeTitle = @"DMTabBarItemAttributeTitle";
NSString *const kDMTabBarItemAttributeNormalImageName = @"DMTabBarItemAttributeNormalImageName";
NSString *const kDMTabBarItemAttributeSelectedImageName = @"DMTabBarItemAttributeSelectedImageName";
NSString *const kDMTabBarItemAttributeType = @"DMTabBarItemAttributeType";

@implementation DMTabBarItem

- (id) initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return self;
}

- (id) init
{
    if (self = [super init]) {
         self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.titleLabel sizeToFit];
    CGSize titleSize = self.titleLabel.frame.size;
    CGSize imageSize = [self imageForState:UIControlStateNormal].size;
    // icon 与 字体 属性设置处
    if (imageSize.width !=0 && imageSize.height !=0) {
        CGFloat imageViewCenterY = CGRectGetHeight(self.frame) - 3 - titleSize.height - imageSize.height / 2 - 5;
        self.imageView.center = CGPointMake(CGRectGetWidth(self.frame) / 2, imageViewCenterY);
       // self.imageView.transform = CGAffineTransformRotate(CGAffineTransformIdentity, 45);

    }else {
        CGPoint imageViewCenter = self.imageView.center;
        imageViewCenter.x = CGRectGetWidth(self.frame) / 2;
        imageViewCenter.y = (CGRectGetHeight(self.frame) - titleSize.height) / 2;
        self.imageView.center = imageViewCenter;
    }
    CGPoint labelCenter = CGPointMake(CGRectGetWidth(self.frame) / 2, CGRectGetHeight(self.frame) - 3 - titleSize.height / 2);
    self.titleLabel.center = labelCenter;


}

/**
 *  复写系统的高量实现，禁止按钮高亮
 *  此函数里不用写任何代码
 */
- (void)setHighlighted:(BOOL)highlighted{
    // do not anything
}

@end
