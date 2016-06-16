//
//  RecommandImages.m
//  FreshOxygen
//
//  Created by mac on 16/6/16.
//  Copyright © 2016年 Cijian.Wu. All rights reserved.
//

#import "RecommandImages.h"
#import "NSArray+Extension.h"
#import "CJTool.h"

@implementation RecommandImages

// Insert code here to add functionality to your managed object subclass


+ (instancetype)recommandImagesWithDict:(NSDictionary *)dict
{
    return [[RecommandImages alloc] initWithDict:dict];
}
- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super initWithEntity:[NSEntityDescription entityForName:@"RecommandImages" inManagedObjectContext:[CJTool sharedTool].context] insertIntoManagedObjectContext:[CJTool sharedTool].context];
    if (self) {
        NSArray *scrollProArr = [NSArray getProperties:[RecommandImages class]];
        for (NSString *key in scrollProArr) {
            [self setValue:[dict valueForKey:key] forKey:key];
        }
    }
    return self;
}

@end
