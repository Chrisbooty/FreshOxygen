//
//  RecommandBtn.m
//  FreshOxygen
//
//  Created by mac on 16/6/15.
//  Copyright © 2016年 Cijian.Wu. All rights reserved.
//

#import "RecommandBtn.h"
#import "NSArray+Extension.h"

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
        NSArray *scrollProArr = [NSArray getProperties:[RecommandBtn class]];
        for (NSString *key in scrollProArr) {
            [self setValue:[dict valueForKey:key] forKey:key];
        }
    }
    return self;
}

@end
