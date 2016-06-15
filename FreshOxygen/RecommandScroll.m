//
//  RecommandScroll.m
//  FreshOxygen
//
//  Created by mac on 16/6/15.
//  Copyright © 2016年 Cijian.Wu. All rights reserved.
//

#import "RecommandScroll.h"

@implementation RecommandScroll

// Insert code here to add functionality to your managed object subclass

+ (instancetype)recommandScrollWithDict:(NSDictionary *)dict
{
    return [[RecommandScroll alloc] initWithDict:dict];
}
- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

@end
