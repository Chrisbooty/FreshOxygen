//
//  RecommandScroll+CoreDataProperties.h
//  FreshOxygen
//
//  Created by mac on 16/6/15.
//  Copyright © 2016年 Cijian.Wu. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "RecommandScroll.h"

NS_ASSUME_NONNULL_BEGIN

@interface RecommandScroll (CoreDataProperties)
/**
 *  轮播图链接
 */
@property (nullable, nonatomic, retain) NSString *con;
/**
 *  标题
 */
@property (nullable, nonatomic, retain) NSString *title;
/**
 *  图片url
 */
@property (nullable, nonatomic, retain) NSString *u;

@end

NS_ASSUME_NONNULL_END
