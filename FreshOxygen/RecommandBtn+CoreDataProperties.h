//
//  RecommandBtn+CoreDataProperties.h
//  FreshOxygen
//
//  Created by mac on 16/6/15.
//  Copyright © 2016年 Cijian.Wu. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "RecommandBtn.h"

NS_ASSUME_NONNULL_BEGIN

@interface RecommandBtn (CoreDataProperties)
/**
 *  图片
 */
@property (nullable, nonatomic, retain) NSString *img;
/**
 *  按钮名
 */
@property (nullable, nonatomic, retain) NSString *name;

@end

NS_ASSUME_NONNULL_END
