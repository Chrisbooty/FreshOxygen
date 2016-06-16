//
//  CJDiscoverCellTagsModel.h
//  FreshOxygen
//
//  Created by mac on 16/6/16.
//  Copyright © 2016年 Cijian.Wu. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface CJDiscoverCellTagsModel : JSONModel

/** 标签名 */
@property(nonatomic,copy) NSString *name;
/** 跳转id */
@property(nonatomic,copy) NSString *team_related_id;


@end
