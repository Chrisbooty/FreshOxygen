//
//  RecommandImages.m
//  FreshOxygen
//
//  Created by mac on 16/6/15.
//  Copyright © 2016年 Cijian.Wu. All rights reserved.
//

#import "RecommandImages.h"
#import "NSArray+Extension.h"

@implementation RecommandImages

// Insert code here to add functionality to your managed object subclass

+ (instancetype)recommandImagesWithDict:(NSDictionary *)dict
{
    return [[RecommandImages alloc] initWithDict:dict];
}
- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        NSArray *scrollProArr = [NSArray getProperties:[RecommandImages class]];
        for (NSString *key in scrollProArr) {
            [self setValue:[dict valueForKey:key] forKey:key];
        }
    }
    return self;
}

@end
