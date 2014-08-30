//
//  SettingItem.h
//  蔷薇岛屿
//
//  Created by panyong on 14-8-30.
//  Copyright (c) 2014年 pyagby. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^SettingItemOpetion)();

@interface SettingItem : NSObject

@property (nonatomic,copy) NSString *title;

@property (nonatomic,copy) NSString *icon;

@property (nonatomic,copy) NSString *subtitle;

/**
 *  点击那个cell需要做什么事情
 */
@property (nonatomic, copy) SettingItemOpetion option;

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title;

+ (instancetype)itemWithTitle:(NSString *)title;

@end
