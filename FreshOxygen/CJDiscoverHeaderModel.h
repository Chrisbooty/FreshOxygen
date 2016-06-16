//
//  CJDiscoverHeaderModel.h
//  FreshOxygen
//
//  Created by mac on 16/6/16.
//  Copyright © 2016年 Cijian.Wu. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface CJDiscoverHeaderModel : JSONModel

/** 跳转id */
@property(nonatomic,copy) NSString *tag_id;
/** 标题文字 */
@property(nonatomic,copy) NSString *title;
/** 图片地址 */
@property(nonatomic,copy) NSString *img_url;
/** 用户id */
@property(nonatomic,copy) NSString *uid;



@end
