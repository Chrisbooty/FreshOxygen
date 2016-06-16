//
//  CJDiscoverCellModel.h
//  FreshOxygen
//
//  Created by mac on 16/6/16.
//  Copyright © 2016年 Cijian.Wu. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface CJDiscoverCellModel : JSONModel

/** 正文跳转id */
@property(nonatomic,copy) NSString *post_id;
/** 用户id */
@property(nonatomic,copy) NSString *uid;
/** 用户名 */
@property(nonatomic,copy) NSString *user_name;
/** 用户头像 */
@property(nonatomic,copy) NSString *title_u;
/** 发布时间 */
@property(nonatomic,copy) NSString *update_date;
/** 标题 */
@property(nonatomic,copy) NSString *title;
/** 图片数组 - u */
@property(nonatomic,strong) NSArray *imgs;
/** 标签数组 */
@property(nonatomic,strong) NSArray *tags;
/** 浏览人数 */
@property(nonatomic,copy) NSString *view_cnt;
/** 留言数 */
@property(nonatomic,copy) NSString *comment_cnt;
/** 喜欢人数 */
@property(nonatomic,copy) NSString *up_cnt;


@end
