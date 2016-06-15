//
//  CJRecommandGOVTableCell.m
//  FreshOxygen
//
//  Created by mac on 16/6/15.
//  Copyright © 2016年 Cijian.Wu. All rights reserved.
//

#import "CJRecommandGOVTableCell.h"
#import <UIImageView+WebCache.h>

@interface CJRecommandGOVTableCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@property (weak, nonatomic) IBOutlet UILabel *nameL;

@property (weak, nonatomic) IBOutlet UIImageView *gradeView;
@property (weak, nonatomic) IBOutlet UILabel *attentionL;
@property (weak, nonatomic) IBOutlet UILabel *contentL;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UIButton *viewBtn;
@property (weak, nonatomic) IBOutlet UIButton *talkBtn;
@property (weak, nonatomic) IBOutlet UIButton *favBtn;

@end

@implementation CJRecommandGOVTableCell

- (void)awakeFromNib {
    // Initialization code
    _iconView.layer.cornerRadius = 17.0f;
    _iconView.clipsToBounds = YES;
}


- (void)setModel:(CJRecommandCellModel *)model
{
    _model = model;
    [_iconView sd_setImageWithURL:[NSURL URLWithString:model.avatar_u] placeholderImage:[UIImage imageNamed:@"photo"]];
    _nameL.text = model.user_name;
    if (model.certified_type.intValue == 1) {
        _gradeView.image = [UIImage imageNamed:@"experienceLevel_daren_26x12_"];
    }else if(model.certified_type.intValue == 5)
    {
        _gradeView.image = [UIImage imageNamed:@"experienceLevel_guanfang_26x12_"];
    }
    _attentionL.text = @"关注";
    _contentL.text = model.summary;
    [_viewBtn setTitle:model.view_cnt forState:UIControlStateNormal];
    [_talkBtn setTitle:model.comment_cnt forState:UIControlStateNormal];
    [_favBtn setTitle:model.favor_cnt forState:UIControlStateNormal];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
@end
