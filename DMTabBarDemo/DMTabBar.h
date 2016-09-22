//
//  DMTabBar.h
//  DMTabBarDemo
//
//  Created by Amon   Deng on 2016/9/21.
//  Copyright © 2016年 Amon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DMTabBarItem.h"
@protocol DMTabBarDelegate <NSObject>

- (void)tabBarDidSelectedRiseButton;

@end

@interface DMTabBar : UIView

@property (nonatomic, copy) NSArray<NSDictionary *> *tabBarItemAttributes;
@property (strong, nonatomic) NSMutableArray *tabBarItems;

@property (nonatomic, weak) id <DMTabBarDelegate> delegate;

@end
