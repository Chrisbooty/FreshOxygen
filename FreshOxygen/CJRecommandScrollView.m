//
//  CJRecommandScrollView.m
//  FreshOxygen
//
//  Created by mac on 16/6/14.
//  Copyright © 2016年 Cijian.Wu. All rights reserved.
//

#import "CJRecommandScrollView.h"

@interface CJRecommandScrollView ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet UIView *btnView;
@property (weak, nonatomic) IBOutlet UIImageView *leftImageView;
@property (weak, nonatomic) IBOutlet UIImageView *upImageView;
@property (weak, nonatomic) IBOutlet UIImageView *bottomImageView;
@property (weak, nonatomic) IBOutlet UIImageView *labelImageView;
@property (weak, nonatomic) IBOutlet UILabel *textL;

/** scrollview数据源 */
@property(nonatomic,strong) NSMutableArray *scrollDataArrM;
/** btnview数据源 */
@property(nonatomic,strong) NSMutableArray *btnDataArrM;


@end

@implementation CJRecommandScrollView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)setDict:(NSDictionary *)dict
{
    
    
}


@end
