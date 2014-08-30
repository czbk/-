//
//  SettingArrowItem.h
//  蔷薇岛屿
//
//  Created by panyong on 14-8-30.
//  Copyright (c) 2014年 pyagby. All rights reserved.
//

#import "SettingItem.h"

@interface SettingArrowItem : SettingItem

@property (nonatomic, assign) Class destVcClass;

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title destVcClass:(Class)destVcClass;

+ (instancetype)itemWithTitle:(NSString *)title destVcClass:(Class)destVcClass;

@end
