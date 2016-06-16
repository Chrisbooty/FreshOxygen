//
//  RecommandImages+CoreDataProperties.h
//  FreshOxygen
//
//  Created by mac on 16/6/16.
//  Copyright © 2016年 Cijian.Wu. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "RecommandImages.h"

NS_ASSUME_NONNULL_BEGIN

@interface RecommandImages (CoreDataProperties)

/**
 *  图片名
 */
@property (nullable, nonatomic, retain) NSString *img;
/**
 *  链接
 */
@property (nullable, nonatomic, retain) NSString *url;

@end

NS_ASSUME_NONNULL_END
