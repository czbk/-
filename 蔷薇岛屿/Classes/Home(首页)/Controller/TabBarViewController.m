//
//  TabBarViewController.m
//  蔷薇岛屿
//
//  Created by panyong on 14-8-27.
//  Copyright (c) 2014年 pyagby. All rights reserved.
//

#import "TabBarViewController.h"
#import "NavigationViewController.h"
#import "TabBarView.h"
#import "CategoryTableViewController.h"
#import "HotViewController.h"
#import "PlayViewController.h"
#import "SettingViewController.h"

@interface TabBarViewController ()<TabBarViewDelegate>
{
    TabBarView *_customTabbar;
}
@end

@implementation TabBarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    // 0.添加tabbar
    [self addTabbar];
    
    // 1.添加所有的子控制器
    [self addAllChildViewControllers];

}

/**
 *  删除原来tabBar上的按钮
 */
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // 移除之前的4个UITabBarButton
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) { //UITabBarButton
            [child removeFromSuperview];
        }
    }
}

/**
 *  添加一个自定义的tabbar
 */
- (void)addTabbar
{
    TabBarView *customTabbar = [[TabBarView alloc] initWithFrame:self.tabBar.bounds];
    customTabbar.delegate = self;
    [self.tabBar addSubview:customTabbar];
    _customTabbar = customTabbar;
}

/**
 *  添加所有的子控制器
 */
- (void)addAllChildViewControllers
{
    // 1.最新
    HotViewController *home = [[HotViewController alloc] init];
    [self addChildViewController:home title:@"热门" image:@"tabbar_home" selectedImage:@"tabbar_home_selected"];
    
    // 2.分类
    CategoryTableViewController *msg = [[CategoryTableViewController alloc] init];
    [self addChildViewController:msg title:@"分类" image:@"tabbar_message_center" selectedImage:@"tabbar_message_center_selected"];
    
    // 3.播放器
    PlayViewController *square = [[PlayViewController alloc] init];
    [self addChildViewController:square title:@"播放" image:@"tabbar_discover" selectedImage:@"tabbar_discover_selected"];
    
    // 4.设置
    SettingViewController *setting = [[SettingViewController alloc] init];
    [self addChildViewController:setting title:@"设置" image:@"tabbar_profile" selectedImage:@"tabbar_profile_selected"];
}

/**
 *  添加一个子控制器
 *
 *  @param child         子控制器
 *  @param title         标题
 *  @param image         图标
 *  @param selectedImage 选中时的图标
 */
- (void)addChildViewController:(UIViewController *)child title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 1.设置标题和图标
    child.tabBarItem.title = title;
    child.tabBarItem.image = [UIImage imageWithName:image];
    UIImage *selected = [UIImage imageWithName:selectedImage];
    //    child.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d", arc4random_uniform(10)];
    
    // 如果是iOS7，不要渲染选中的图片
    if (iOS7) {
        child.tabBarItem.selectedImage = [selected imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    } else {
        child.tabBarItem.selectedImage = selected;
    }
    
    // 2.包装一个导航控制器
    child.title = title;
    NavigationViewController *nav = [[NavigationViewController alloc] initWithRootViewController:child];
    
    // 3.成为tabbarcontroller的子控器
    [self addChildViewController:nav];
    
    // 4.添加一个按钮
    [_customTabbar addTabBarButtonWithItem:child.tabBarItem];
}


-(void)tabBarView:(TabBarView *)tabBar didSelectButtonFrom:(int)from to:(int)to
{
    self.selectedIndex = to;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
