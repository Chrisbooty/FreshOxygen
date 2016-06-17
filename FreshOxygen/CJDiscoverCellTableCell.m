//
//  CJDiscoverCellTableCell.m
//  FreshOxygen
//
//  Created by mac on 16/6/17.
//  Copyright © 2016年 Cijian.Wu. All rights reserved.
//

#import "CJDiscoverCellTableCell.h"
#import <UIImageView+WebCache.h>

@interface CJDiscoverCellTableCell ()
/**
 *  头像
 */
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
/**
 *  用户名
 */
@property (weak, nonatomic) IBOutlet UILabel *userNameL;
/**
 *  提示标签
 */
@property (weak, nonatomic) IBOutlet UILabel *tipsL;
/**
 *  手术计时
 */
@property (weak, nonatomic) IBOutlet UILabel *timeL;
/**
 *  图片
 */
@property (weak, nonatomic) IBOutlet UIView *imgsView;
/**
 *  标题内容
 */
@property (weak, nonatomic) IBOutlet UILabel *textL;
/**
 *  标签
 */
@property (weak, nonatomic) IBOutlet UIView *tagsView;
/**
 *  浏览人数
 */
@property (weak, nonatomic) IBOutlet UIButton *viewBtn;
/**
 *  留言人数
 */
@property (weak, nonatomic) IBOutlet UIButton *talkBtn;
/**
 *  喜欢人数
 */
@property (weak, nonatomic) IBOutlet UIButton *favBtn;

@end

@implementation CJDiscoverCellTableCell

- (void)awakeFromNib {
    // Initialization code
    _iconView.layer.cornerRadius = 17.5f;
    _iconView.clipsToBounds = YES;
    //隐藏图片
    [_imgsView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if ([obj isKindOfClass:[UIImageView class]]) {
            UIImageView *imgV = (UIImageView *)obj;
            imgV.image = nil;
            imgV.hidden = YES;
        }
    }];
    //隐藏关键词组
    [_tagsView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if ([obj isKindOfClass:[UIButton class]]) {
            obj = nil;
        }
    }];
}

- (void)setModel:(CJDiscoverCellModel *)model
{
    _model = model;
    [_iconView sd_setImageWithURL:[NSURL URLWithString:model.title_u] placeholderImage:[UIImage imageNamed:@"photo"]];
    _userNameL.text = model.user_name;
    
    //添加判断
    _tipsL.text = [NSString stringWithFormat:@"%@",[self intervalFromLastDate:model.update_date]];
    //初始化图片
    [_imgsView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if (idx == model.imgs.count) {
            *stop = YES;
        }
        if ([obj isKindOfClass:[UIImageView class]] && idx < model.imgs.count) {
            UIImageView *imgV = (UIImageView *)obj;
            [imgV sd_setImageWithURL:[NSURL URLWithString:model.imgs[idx][@"u"]] placeholderImage:[UIImage imageNamed:@"photo"]];
            imgV.hidden = NO;
        }
    }];
    _textL.text = model.title;
    //间隔
    CGFloat spacing = 5;
    CGFloat btnWith = 15;
    //创建关键词
    for (NSInteger i = 0; i <model.tags.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        NSString *str = model.tags[i][@"name"];
        CGSize strSize = [str sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]}];
        btn.frame = CGRectMake(btnWith + spacing, 0, strSize.width, strSize.height);
        [btn setTitle: str forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor colorWithRed:79.0/255.0 green:207/255.0 blue:199/255.0 alpha:1.0] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:12];
        btn.tag = 100+i;
        btnWith = strSize.width + btn.frame.origin.x;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_tagsView addSubview:btn];
    }
    //底部按钮
    [_viewBtn setTitle:model.view_cnt forState:UIControlStateNormal];
    [_talkBtn setTitle:model.comment_cnt forState:UIControlStateNormal];
    [_favBtn setTitle:model.up_cnt forState:UIControlStateNormal];
    
}

#pragma mark - 关键词点击事件
- (void)btnClick:(UIButton *)btn
{
    
}

#pragma mark - 计算时间差
- (NSString *)intervalFromLastDate: (NSString *) dateString2
{
    NSArray *timeArray1=[dateString2 componentsSeparatedByString:@"."];
    dateString2=[timeArray1 objectAtIndex:0];
    
    //当前时间
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSString *dateString1 = [formatter stringFromDate:[NSDate date]];
    
    NSDateFormatter *date=[[NSDateFormatter alloc] init];
    [date setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDate *d1=[date dateFromString:dateString1];
    
    NSTimeInterval late1=[d1 timeIntervalSince1970]*1;
    
    NSDate *d2=[date dateFromString:dateString2];
    
    NSTimeInterval late2=[d2 timeIntervalSince1970]*1;
    
    NSTimeInterval cha=late2-late1;
    NSString *timeString=@"";
    NSString *house=@"";
    NSString *min=@"";
    NSString *sen=@"";
    
    sen = [NSString stringWithFormat:@"%d", (int)cha%60];
    //        min = [min substringToIndex:min.length-7];
    //    秒
    sen=[NSString stringWithFormat:@"%@", sen];
    
    min = [NSString stringWithFormat:@"%d", (int)cha/60%60];
    //        min = [min substringToIndex:min.length-7];
    //    分
    min=[NSString stringWithFormat:@"%@", min];
    
    //    小时
    house = [NSString stringWithFormat:@"%d", (int)cha/3600];
    //        house = [house substringToIndex:house.length-7];
    house=[NSString stringWithFormat:@"%@", house];
    
//    timeString=[NSString stringWithFormat:@"%02d:%02d:%02d",house.intValue,min.intValue,sen.intValue];
    timeString = [NSString stringWithFormat:@"%d",house.intValue *60 + min.intValue];
    return timeString;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
@end
