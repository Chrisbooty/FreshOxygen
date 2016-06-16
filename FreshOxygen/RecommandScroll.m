//
//  RecommandScroll.m
//  FreshOxygen
//
//  Created by mac on 16/6/15.
//  Copyright © 2016年 Cijian.Wu. All rights reserved.
//

#import "RecommandScroll.h"
#import "NSArray+Extension.h"
#import "CJTool.h"

@implementation RecommandScroll

// Insert code here to add functionality to your managed object subclass

+ (instancetype)recommandScrollWithDict:(NSDictionary *)dict
{
    return [[RecommandScroll alloc] initWithDict:dict];
}
- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super initWithEntity:self insertIntoManagedObjectContext:[CJTool sharedTool]];
    if (self) {
        NSArray *scrollProArr = [NSArray getProperties:[RecommandScroll class]];
        for (NSString *key in scrollProArr) {
            [self setValue:[dict valueForKey:key] forKey:key];
        }
    }
    return self;
}

@end
