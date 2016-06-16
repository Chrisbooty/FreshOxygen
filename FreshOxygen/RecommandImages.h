//
//  RecommandImages.h
//  FreshOxygen
//
//  Created by mac on 16/6/16.
//  Copyright © 2016年 Cijian.Wu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface RecommandImages : NSManagedObject

// Insert code here to declare functionality of your managed object subclass

+ (instancetype)recommandImagesWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;


@end

NS_ASSUME_NONNULL_END

#import "RecommandImages+CoreDataProperties.h"
