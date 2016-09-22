//
//  DMTabBar.m
//  DMTabBarDemo
//
//  Created by Amon   Deng on 2016/9/21.
//  Copyright © 2016年 Amon. All rights reserved.
//

#import "DMTabBar.h"

// 屏幕高度
#define SCREEN_HEIGHT         [[UIScreen mainScreen] bounds].size.height
// 屏幕宽度
#define SCREEN_WIDTH          [[UIScreen mainScreen] bounds].size.width
@implementation DMTabBar

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];

    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        UIImageView *topLine = [[UIImageView alloc] initWithFrame:CGRectMake(0, -5, SCREEN_WIDTH, 5)];
        topLine.image = [UIImage imageNamed:@"tapbar_top_line"];
        [self addSubview:topLine];
    }
    
    return self;
}

- (void)setSelectedIndex:(NSInteger)index {
    for (DMTabBarItem *item in self.tabBarItems) {
        if (item.tag == index) {
            item.selected = YES;
        } else {
            item.selected = NO;
        }
    }
    
//key work
    UIWindow *keyWindow = [[[UIApplication sharedApplication] delegate] window];
    UITabBarController *tabBarController = (UITabBarController *)keyWindow.rootViewController;
    if (tabBarController) {
        tabBarController.selectedIndex = index;
    }
}

#pragma mark - Touch Event

- (void)itemSelected:(DMTabBarItem *)sender {
    if (sender.tabBarItemType != DMTabBarItemRise) {
        [self setSelectedIndex:sender.tag];
    } else {
        if (self.delegate) {
            if ([self.delegate respondsToSelector:@selector(tabBarDidSelectedRiseButton)]) {
                [UIView animateWithDuration:0.5 animations:^{
                
                  
                }];
                [self.delegate tabBarDidSelectedRiseButton];
            }
        }
    }
}

- (void)setTabBarItemAttributes:(NSArray<NSDictionary *> *)tabBarItemAttributes
{
    _tabBarItemAttributes = tabBarItemAttributes.copy;

    NSAssert(_tabBarItemAttributes.count > 2, @"TabBar item count must greet than two.");
 

    CGFloat normalItemWidth = (SCREEN_WIDTH * 3 / 4) / (_tabBarItemAttributes.count - 1);
    CGFloat tabBarHeight = CGRectGetHeight(self.frame);
    CGFloat publishItemWidth = (SCREEN_WIDTH / 4);

    NSInteger itemTag = 0;
    BOOL passedRiseItem = NO;

    _tabBarItems = [NSMutableArray arrayWithCapacity:_tabBarItemAttributes.count];


    for (id item in _tabBarItemAttributes) {
        if ([item isKindOfClass:[NSDictionary class]]) {
            NSDictionary *itemDict = (NSDictionary *)item;

            DMTabBarItemType type = [itemDict[kDMTabBarItemAttributeType] integerValue];

            CGRect frame = CGRectMake(itemTag * normalItemWidth + (passedRiseItem ? publishItemWidth : 0), 0, type == DMTabBarItemRise ? publishItemWidth : normalItemWidth, tabBarHeight);

            DMTabBarItem *tabBarItem = [self tabBarItemWithFrame:frame
                                                           title:itemDict[kDMTabBarItemAttributeTitle]
                                                 normalImageName:itemDict[kDMTabBarItemAttributeNormalImageName]
                                               selectedImageName:itemDict[kDMTabBarItemAttributeSelectedImageName] tabBarItemType:type];
            if (itemTag == 0) {
                tabBarItem.selected = YES;
            }

            [tabBarItem addTarget:self action:@selector(itemSelected:) forControlEvents:UIControlEventTouchUpInside];

            if (tabBarItem.tabBarItemType != DMTabBarItemRise) {
                tabBarItem.tag = itemTag;
                itemTag++;
            } else {
                passedRiseItem = YES;
            }

            [_tabBarItems addObject:tabBarItem];
            [self addSubview:tabBarItem];
        }
    }

}

- (DMTabBarItem *)tabBarItemWithFrame:(CGRect)frame title:(NSString *)title normalImageName:(NSString *)normalImageName selectedImageName:(NSString *)selectedImageName tabBarItemType:(DMTabBarItemType)tabBarItemType
{
    DMTabBarItem * item = [[DMTabBarItem alloc] initWithFrame:frame];
    [item setTitle:title forState:UIControlStateNormal];
    [item setTitle:title forState:UIControlStateSelected];
    item.titleLabel.font = [UIFont systemFontOfSize:8];
    UIImage *normalImage = [UIImage imageNamed:normalImageName];
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    [item setImage:normalImage forState:UIControlStateNormal];
    [item setImage:selectedImage forState:UIControlStateSelected];
    [item setTitleColor:[UIColor colorWithWhite:51 / 255.0 alpha:1] forState:UIControlStateNormal];
    [item setTitleColor:[UIColor colorWithWhite:51 / 255.0 alpha:1] forState:UIControlStateSelected];
    item.tabBarItemType = tabBarItemType;
    return item;
}
@end
