//
//  CJDisCoverHeaderView.m
//  FreshOxygen
//
//  Created by mac on 16/6/17.
//  Copyright © 2016年 Cijian.Wu. All rights reserved.
//

#import "CJDiscoverHeaderView.h"
#import "CJHeader.h"
#import "CJDiscoverHeaderCategoryView.h"

@interface CJDiscoverHeaderView ()

/**
 *  scrollview
 */
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation CJDiscoverHeaderView


- (void)setDataArr:(NSArray *)dataArr
{
    _dataArr = dataArr;
    CGFloat viewWith = 100;
    CGFloat ViewHeight = 128;
    _scrollView.contentSize = CGSizeMake(viewWith * dataArr.count, 0);
    [dataArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        CJDiscoverHeaderCategoryView *view = [[CJDiscoverHeaderCategoryView alloc] initWithFrame:CGRectMake( idx * viewWith, 0, viewWith, ViewHeight)];
        CJDiscoverHeaderModel *model = self.dataArr[idx];
        view.model = model;
        
        [_scrollView addSubview:view];
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
