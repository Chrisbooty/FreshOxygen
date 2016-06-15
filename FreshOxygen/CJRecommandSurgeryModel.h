//
//  CJRecommandSurgeryModel.h
//  FreshOxygen
//
//  Created by mac on 16/6/15.
//  Copyright © 2016年 Cijian.Wu. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol CJRecommandSurgeryModel


@end

@interface CJRecommandSurgeryModel : JSONModel

/** 手术跳转id */
@property(nonatomic,copy) NSString *item_id;
/** 手术名 */
@property(nonatomic,copy) NSString *item_name;

@end
