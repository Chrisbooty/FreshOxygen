//
//  CJRecommandCustomTableCell.m
//  FreshOxygen
//
//  Created by mac on 16/6/15.
//  Copyright © 2016年 Cijian.Wu. All rights reserved.
//

#import "CJRecommandCustomTableCell.h"
#import <UIImageView+WebCache.h>

@interface CJRecommandCustomTableCell ()
/**
 *  头像
 */
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
/**
 *  用户名
 */
@property (weak, nonatomic) IBOutlet UILabel *userNameL;
/**
 *  用户等级
 */
@property (weak, nonatomic) IBOutlet UIImageView *userGradeView;
/**
 *  关注
 */
@property (weak, nonatomic) IBOutlet UILabel *attentionL;
/**
 *  图片－左
 */
@property (weak, nonatomic) IBOutlet UIImageView *imgLeftView;
/**
 *  图片－右
 */
@property (weak, nonatomic) IBOutlet UIImageView *imgRightView;
/**
 *  内容
 */
@property (weak, nonatomic) IBOutlet UILabel *textL;
/**
 *  手术标签
 */
@property (weak, nonatomic) IBOutlet UIView *labelView;
/**
 *  浏览按钮
 */
@property (weak, nonatomic) IBOutlet UIButton *viewL;
/**
 *  评论按钮
 */
@property (weak, nonatomic) IBOutlet UIButton *talkL;
/**
 *  收藏/喜欢按钮
 */
@property (weak, nonatomic) IBOutlet UIButton *favL;

@end

@implementation CJRecommandCustomTableCell

- (void)awakeFromNib {
    // Initialization code
    _iconView.layer.cornerRadius = 17.0f;
    _iconView.clipsToBounds = YES;
}

- (void)setModel:(CJRecommandCellModel *)model
{
    _model = model;
    [_iconView sd_setImageWithURL:[NSURL URLWithString:model.avatar_u] placeholderImage:[UIImage imageNamed:@"photo"]];
    _userNameL.text = model.user_name;
    _userGradeView.image = [UIImage imageNamed:[NSString stringWithFormat:@"experienceLevel_%@_13x13_",model.user_level]];
    _attentionL.text = @"关注";
    [_imgLeftView sd_setImageWithURL:[NSURL URLWithString:model.top_img_u] placeholderImage:[UIImage imageNamed:@"photo"]];
    [_imgRightView sd_setImageWithURL:[NSURL URLWithString:model.middle_img_u] placeholderImage:[UIImage imageNamed:@"photo"]];
    _textL.text = model.summary;
    
    //删除item
    for (UIView *view in _labelView.subviews) {
        [view removeFromSuperview];
    }
    //间隔
    CGFloat spacing = 15;
    CGFloat btnWith = 0;
    for (NSInteger i = 0; i <model.item.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        NSString *str = [model.item[i] item_name];
        CGSize strSize = [str sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]}];
        btn.frame = CGRectMake(btnWith +spacing *(i+1), 0, strSize.width, strSize.height);
        [btn setTitle: [model.item[i] item_name] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor colorWithRed:79.0/255.0 green:207/255.0 blue:199/255.0 alpha:1.0] forState:UIControlStateNormal];
        btn.tag = 100+i;
        btnWith = strSize.width;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_labelView addSubview:btn];
    }
    //底部按钮
    [_viewL setTitle:model.view_cnt forState:UIControlStateNormal];
    [_talkL setTitle:model.comment_cnt forState:UIControlStateNormal];
    [_favL setTitle:model.favor_cnt forState:UIControlStateNormal];
    
}

- (void)btnClick:(UIButton *)btn
{
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
@end
