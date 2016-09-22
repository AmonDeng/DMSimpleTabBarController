//
//  DMTabBarItem.h
//  DMTabBarDemo
//
//  Created by Amon   Deng on 2016/9/21.
//  Copyright © 2016年 Amon. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger,DMTabBarItemType){
    DMTabBarItemNormal =0,
    DMTabBarItemRise,
};

extern NSString *const kDMTabBarItemAttributeTitle;// NSString
extern NSString *const kDMTabBarItemAttributeNormalImageName;// NSString
extern NSString *const kDMTabBarItemAttributeSelectedImageName;// NSString
extern NSString *const kDMTabBarItemAttributeType;// NSNumber,

@interface DMTabBarItem : UIButton

@property (nonatomic,assign) DMTabBarItemType tabBarItemType;
@end
