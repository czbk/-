//
//  SettingViewController.m
//  蔷薇岛屿
//
//  Created by panyong on 14-8-28.
//  Copyright (c) 2014年 pyagby. All rights reserved.
//

#import "SettingViewController.h"
#import "SettingArrowItem.h"
#import "SettingLableItem.h"
#import "SettingSwitchItem.h"
#import "SettingItem.h"
#import "MBProgressHUD+MJ.h"
#import "SettingGroup.h"

@implementation SettingViewController



- (void)setupGroup1
{
    SettingItem *update = [SettingItem itemWithIcon:@"MoreUpdate" title:@"检查新版本"];
    update.option = ^{
        // 弹框提示
        [MBProgressHUD showMessage:@"正在拼命检查中....."];
        
#warning 发送网络请求
        // 几秒后消失
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            // 移除HUD
            [MBProgressHUD hideHUD];
            
            // 提醒有没有新版本
            [MBProgressHUD showError:@"没有新版本"];
        });
    };
    SettingArrowItem *help = [SettingArrowItem itemWithIcon:@"MoreHelp" title:@"版权说明"];
    SettingItem *share = [SettingItem itemWithIcon:@"MoreShare" title:@"分享" ];
    share.option = ^{
        // 弹框提示
        [MBProgressHUD showMessage:@"分享页面现在还没做哦哦！！！！！"];
        
#warning 还再研究啊
        // 几秒后消失
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            // 移除HUD
            [MBProgressHUD hideHUD];
            
            // 提醒有没有新版本
            [MBProgressHUD showError:@"没有新版本"];
        });
    };

//    MJSettingItem *viewMsg = [MJSettingArrowItem itemWithIcon:@"MoreMessage" title:@"查看消息" destVcClass:[MJTest2ViewController class]];
//    MJSettingItem *product = [MJSettingArrowItem itemWithIcon:@"MoreNetease" title:@"产品推荐" destVcClass:[MJProductViewController class]];
//    MJSettingItem *about = [MJSettingArrowItem itemWithIcon:@"MoreAbout" title:@"关于" destVcClass:[MJAboutViewController class]];
    
    SettingGroup *group = [[SettingGroup alloc] init];
    group.items = @[update, help, share];
    [self.data addObject:group];
}

/**
 *  第0组数据
 */
- (void)setupGroup0
{
    SettingItem *appCommentary = [SettingItem itemWithIcon:@"MorePush" title:@"软件评论" ];
    appCommentary.option = ^{
        // 弹框提示
        [MBProgressHUD showMessage:@"正在打开app评分"];
#warning 还再研究啊
        // 几秒后消失
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            // 移除HUD
            [MBProgressHUD hideHUD];
            
            // 提醒有没有新版本
            [MBProgressHUD showError:@"打开失败，功能未完成"];
        });
    };
    SettingSwitchItem *handShake = [SettingSwitchItem itemWithIcon:@"handShake" title:@"摇一摇机选"];
    SettingSwitchItem *soundEffect = [SettingSwitchItem itemWithIcon:@"sound_Effect" title:@"声音效果"];
    
    SettingGroup *group = [[SettingGroup alloc] init];
    group.items = @[appCommentary, handShake, soundEffect];
    [self.data addObject:group];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"设置";
    
    [self setupGroup0];
    [self setupGroup1];
    

}


@end
