//
//  CJTool.m
//  FreshOxygen
//
//  Created by mac on 16/6/16.
//  Copyright © 2016年 Cijian.Wu. All rights reserved.
//

#import "CJTool.h"

@implementation CJTool

#pragma mark - 初始化managedcontext
- (instancetype)init
{
    self = [super init];
    if (self) {
        id app = [UIApplication sharedApplication].delegate;
        _context = [app managedObjectContext];
    }
    return self;
}
#pragma mark - 获取单例对象
+ (instancetype)sharedTool
{
    static CJTool *tool = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tool = [CJTool new];
    });
    return tool;
}


@end
