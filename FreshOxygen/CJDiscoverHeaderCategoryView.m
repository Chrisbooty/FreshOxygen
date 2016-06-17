//
//  CJDiscoverHeaderCategoryView.m
//  FreshOxygen
//
//  Created by mac on 16/6/17.
//  Copyright © 2016年 Cijian.Wu. All rights reserved.
//

#import "CJDiscoverHeaderCategoryView.h"
#import <UIImageView+WebCache.h>

@interface CJDiscoverHeaderCategoryView ()

@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@property (weak, nonatomic) IBOutlet UILabel *txtL;

@end

@implementation CJDiscoverHeaderCategoryView

-(void)awakeFromNib
{
    _imgView.layer.cornerRadius = 50.0f;
    _imgView.clipsToBounds = YES;
}


- (void)setModel:(CJDiscoverHeaderModel *)model
{
    _model = model;
    [_imgView sd_setImageWithURL:[NSURL URLWithString:model.img_url] placeholderImage:[UIImage imageNamed:@"photo"]];
    _txtL.text = model.title;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
