//
//  DMTabBarController.m
//  DMTabBarDemo
//
//  Created by Amon   Deng on 2016/9/22.
//  Copyright © 2016年 Amon. All rights reserved.
//

#import "DMTabBarController.h"
#import "DMTabBar.h"
#import "OneViewController.h"
#import "TwoViewController.h"
@interface DMTabBarController ()<DMTabBarDelegate>

@end

@implementation DMTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    OneViewController * one = [[OneViewController alloc] init];
    TwoViewController * two = [[TwoViewController alloc] init];

    self.viewControllers = @[one, two];

    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc] init]];
    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];

    DMTabBar *tabBar = [[DMTabBar alloc] initWithFrame:self.tabBar.bounds];
    tabBar.tabBarItemAttributes = @[@{kDMTabBarItemAttributeTitle : @"首页", kDMTabBarItemAttributeNormalImageName : @"home_normal", kDMTabBarItemAttributeSelectedImageName : @"home_highlight", kDMTabBarItemAttributeType : @(DMTabBarItemNormal)},

                                    @{kDMTabBarItemAttributeTitle : @"发布", kDMTabBarItemAttributeNormalImageName : @"post_normal", kDMTabBarItemAttributeSelectedImageName : @"post_normal", kDMTabBarItemAttributeType : @(DMTabBarItemRise)},

                                    @{kDMTabBarItemAttributeTitle : @"我的", kDMTabBarItemAttributeNormalImageName : @"account_normal", kDMTabBarItemAttributeSelectedImageName : @"account_highlight", kDMTabBarItemAttributeType : @(DMTabBarItemNormal)}];
    tabBar.delegate = self;
    [self.tabBar addSubview:tabBar];
    

    // Do any additional setup after loading the view.
}

#pragma mark - DMTabBarDelegate

- (void)tabBarDidSelectedRiseButton {
    NSLog(@"HI");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
