//
//  CJDiscoverCellModel.m
//  FreshOxygen
//
//  Created by mac on 16/6/16.
//  Copyright © 2016年 Cijian.Wu. All rights reserved.
//

#import "CJDiscoverCellModel.h"

@implementation CJDiscoverCellModel

+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"user.user_name":@"user_name",@"user.avatar.u":@"title_u"}];
}

@end
