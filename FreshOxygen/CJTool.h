//
//  CJTool.h
//  FreshOxygen
//
//  Created by mac on 16/6/16.
//  Copyright © 2016年 Cijian.Wu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CJHeader.h"

@interface CJTool : NSObject
{
    NSManagedObjectContext *_context;
}

+ (instancetype)sharedTool;

@end
