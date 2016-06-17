//
//  CJHeader.h
//  FreshOxygen
//
//  Created by mac on 16/6/15.
//  Copyright © 2016年 Cijian.Wu. All rights reserved.
//

#ifndef CJHeader_h
#define CJHeader_h


#import "CJTool.h"

#import <AFNetworking.h>
#import <UIImageView+WebCache.h>
#import <MJRefresh.h>
#import <JSONModel.h>

#import "NSArray+Extension.h"



/**
 *  recommand 控制器
 */
#import "RecommandBtn.h"
#import "RecommandImages.h"
#import "RecommandScroll.h"
#import "RecommandMessage.h"
#import "CJRecommandCellModel.h"
#import "CJRecommandCustomTableCell.h"
#import "CJRecommandGOVTableCell.h"

/**
 *  推荐首页URL
 */
#define RECOMMAND_URL @"http://api.soyoung.com/v4/appindex?index=%ld&range=20&cityId=291&lver=6.3.8"
/**
 *  发现 URL
 */
#define DISCOVER_URL @"http://api.soyoung.com/v8/teams/NewTeamIndex?uid=0&index=%ld&range=10&cityId=291&show=%ld"



#define CJLogStr(arg) NSLog(@"---> %@",arg)

/**
 *  屏幕尺寸
 */
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height


#endif /* CJHeader_h */
