//
//  CJRecommandScrollView.h
//  FreshOxygen
//
//  Created by mac on 16/6/14.
//  Copyright © 2016年 Cijian.Wu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RecommandMessage.h"

@interface CJRecommandScrollView : UIView

/** 轮播图数据源 */
@property(nonatomic,strong) NSMutableArray *scrollDataArrM;
/** 按钮数据源 */
@property(nonatomic,strong) NSMutableArray *btnDataArrM;
/** 推广图片数据源 */
@property(nonatomic,strong) NSMutableArray *imagesDataArrM;
/** 广告消息模型 */
@property(nonatomic,strong) RecommandMessage *messageModel;

@end
