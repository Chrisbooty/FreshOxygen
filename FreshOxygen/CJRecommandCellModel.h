//
//  CJRecommandCellModel.h
//  FreshOxygen
//
//  Created by mac on 16/6/15.
//  Copyright © 2016年 Cijian.Wu. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "CJRecommandSurgeryModel.h"

@interface CJRecommandCellModel : JSONModel

/** 头像 */
@property(nonatomic,copy) NSString *avatar_u;
/** 用户主页id */
@property(nonatomic,copy) NSString *uid;
/** 用户等级 */
@property(nonatomic,copy) NSString *user_level;
/** 等级 */
@property(nonatomic,copy) NSString *certified_type;
/** 用户名 */
@property(nonatomic,copy) NSString *user_name;
/** 图片左 */
@property(nonatomic,copy) NSString<Optional> *top_img_u;
/** 图片右 */
@property(nonatomic,copy) NSString<Optional> *middle_img_u;
/** 描述内容 */
@property(nonatomic,copy) NSString<Optional> *summary;



/** 手术 */
@property(nonatomic,copy) NSArray<CJRecommandSurgeryModel> *item;


/** 喜欢人数 */
@property(nonatomic,copy) NSString<Optional> *favor_cnt;
/** 浏览人数 */
@property(nonatomic,copy) NSString<Optional> *view_cnt;
/** 留言人数 */
@property(nonatomic,copy) NSString<Optional> *comment_cnt;

/** cell id */
@property(nonatomic,copy) NSString<Optional> *group_id;
/** 底部评论id */
@property(nonatomic,copy) NSString<Optional> *post_id;

@end
