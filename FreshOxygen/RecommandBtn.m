//
//  RecommandBtn.m
//  FreshOxygen
//
//  Created by mac on 16/6/15.
//  Copyright © 2016年 Cijian.Wu. All rights reserved.
//

#import "RecommandBtn.h"

@implementation RecommandBtn

// Insert code here to add functionality to your managed object subclass

+ (instancetype)recommandBtnWithDict:(NSDictionary *)dict
{
    return [[RecommandBtn alloc] initWithDict:dict];
}
- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self ) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

@end
