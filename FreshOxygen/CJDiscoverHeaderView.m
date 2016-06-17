//
//  CJDisCoverHeaderView.m
//  FreshOxygen
//
//  Created by mac on 16/6/17.
//  Copyright © 2016年 Cijian.Wu. All rights reserved.
//

#import "CJDiscoverHeaderView.h"
#import "CJHeader.h"




@interface CJDiscoverHeaderView ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;


@end

@implementation CJDiscoverHeaderView


- (void)setDataArr:(NSArray *)dataArr
{
    _dataArr = dataArr;
    _scrollView.contentSize = CGSizeMake(WIDTH * dataArr.count, 0);
    [dataArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        
    }];
}


- (IBAction)moreInfoClick {
    
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
