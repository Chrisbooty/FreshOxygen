//
//  RecommandMessage+CoreDataProperties.h
//  FreshOxygen
//
//  Created by mac on 16/6/15.
//  Copyright © 2016年 Cijian.Wu. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "RecommandMessage.h"

NS_ASSUME_NONNULL_BEGIN

@interface RecommandMessage (CoreDataProperties)
/**
 *  广告图片
 */
@property (nullable, nonatomic, retain) NSString *icon;
/**
 *  广告跳转链接
 */
@property (nullable, nonatomic, retain) NSString *con;
/**
 *  广告数组－data
 */
@property (nullable, nonatomic, retain) NSData *notice;

@end

NS_ASSUME_NONNULL_END
