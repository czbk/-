//
//  SettingCell.h
//  蔷薇岛屿
//
//  Created by panyong on 14-8-30.
//  Copyright (c) 2014年 pyagby. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SettingItem;

@interface SettingCell : UITableViewCell

@property (nonatomic, strong) SettingItem *item;
@property (nonatomic, assign, getter = isLastRowInSection) BOOL lastRowInSection;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
