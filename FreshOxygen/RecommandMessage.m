//
//  RecommandMessage.m
//  FreshOxygen
//
//  Created by mac on 16/6/15.
//  Copyright © 2016年 Cijian.Wu. All rights reserved.
//

#import "RecommandMessage.h"
#import "CJTool.h"
#import "NSArray+Extension.h"

@implementation RecommandMessage

// Insert code here to add functionality to your managed object subclass

+ (instancetype)recommandMessageWithDict:(NSDictionary *)dict
{
    return [[RecommandMessage alloc] initWithDict:dict];
}
- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super initWithEntity:[NSEntityDescription entityForName:@"RecommandMessage" inManagedObjectContext:[CJTool sharedTool].context] insertIntoManagedObjectContext:[CJTool sharedTool].context];
    if (self ) {
        self.con = dict[@"city_micro"][@"info"][@"url"][@"con"];
        self.icon = dict[@"city_micro"][@"info"][@"icon"];
        NSArray *dataArr = dict[@"city_micro"][@"info"][@"notice"];
        NSError *error;
        self.notice = [NSJSONSerialization dataWithJSONObject:dataArr options:NSJSONWritingPrettyPrinted error:&error];
        if (error) {
            NSLog(@"%@",error);
        }
        
    }
    return self;
}

@end
