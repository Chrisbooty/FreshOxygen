//
//  CJRecommandCellModel.m
//  FreshOxygen
//
//  Created by mac on 16/6/15.
//  Copyright © 2016年 Cijian.Wu. All rights reserved.
//

#import "CJRecommandCellModel.h"

@implementation CJRecommandCellModel

+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"avatar.u":@"avatar_u",@"top.img.u_n":@"top_img_un",@"middle.img.u_n":@"middle_img_un",@"top.summary":@"summary",@"end.favor_cnt":@"favor_cnt",@"end.view_cnt":@"view_cnt",@"end.comment_cnt":@"comment_cnt",@"top.post_id":@"post_id"}];
}

@end
