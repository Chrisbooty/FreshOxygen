//
//  CJRecommandBtnView.m
//  FreshOxygen
//
//  Created by mac on 16/6/15.
//  Copyright © 2016年 Cijian.Wu. All rights reserved.
//

#import "CJRecommandBtnView.h"
#import <UIImageView+WebCache.h>

@interface CJRecommandBtnView ()

/** 图片 */
@property(nonatomic,weak) IBOutlet UIImageView *imgView;
/** 文字 */
@property(nonatomic,weak) IBOutlet UILabel *txtL;

@end

@implementation CJRecommandBtnView



- (void)setModel:(RecommandBtn *)model
{
    _model = model;
    [_imgView sd_setImageWithURL:[NSURL URLWithString:model.img] placeholderImage:[UIImage imageNamed:@"photo"]];
    _imgView.userInteractionEnabled = YES;
    _txtL.text = model.name;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
