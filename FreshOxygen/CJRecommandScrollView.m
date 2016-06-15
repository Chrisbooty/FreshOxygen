//
//  CJRecommandScrollView.m
//  FreshOxygen
//
//  Created by mac on 16/6/14.
//  Copyright © 2016年 Cijian.Wu. All rights reserved.
//

#import "CJRecommandScrollView.h"
#import "CJHeader.h"
#import <UIImageView+WebCache.h>
#import "CJRecommandBtnView.h"

#define WITDH [UIScreen mainScreen].bounds.size.width

@interface CJRecommandScrollView ()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet UIView *btnView;
@property (weak, nonatomic) IBOutlet UIImageView *leftImageView;
@property (weak, nonatomic) IBOutlet UIImageView *upImageView;
@property (weak, nonatomic) IBOutlet UIImageView *bottomImageView;
@property (weak, nonatomic) IBOutlet UIImageView *labelImageView;
@property (weak, nonatomic) IBOutlet UILabel *textL;

/** 定时器 */
@property(nonatomic,strong) NSTimer *timer;
/** 记录轮播索引 */
@property(nonatomic,assign) NSInteger index;


@end

@implementation CJRecommandScrollView

#pragma mark - 设置轮播图
- (void)setScrollDataArrM:(NSMutableArray *)scrollDataArrM
{
    _scrollDataArrM = scrollDataArrM;
    _pageControl.numberOfPages = scrollDataArrM.count;
    _scrollView.contentSize = CGSizeMake(scrollDataArrM.count * WITDH, 0);
    _scrollView.delegate = self;
    for (NSInteger i = 0; i < scrollDataArrM.count; i++) {
        RecommandScroll *model = scrollDataArrM[i];
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(WITDH *i, 0, WITDH, _scrollView.frame.size.height)];
        [imgView sd_setImageWithURL:[NSURL URLWithString:model.u] placeholderImage:[UIImage imageNamed:@"photo"]];
        imgView.userInteractionEnabled = YES;
        imgView.tag = 1000 + i;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scrollClick:)];
        [imgView addGestureRecognizer:tap];
        [_scrollView addSubview:imgView];
    }
    _timer = [NSTimer scheduledTimerWithTimeInterval:2.0f target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
}
#pragma mark - 设置按钮
- (void)setBtnDataArrM:(NSMutableArray *)btnDataArrM
{
    _btnDataArrM = btnDataArrM;
    NSInteger i = 0;
    for (UIView *view in _btnView.subviews) {
        if ([view isKindOfClass:[CJRecommandBtnView class]]) {
            if (btnDataArrM.count) {
                CJRecommandBtnView *btnview = (CJRecommandBtnView *)view;
                RecommandBtn *btnModel = btnDataArrM[i];
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(btnClick:)];
                [btnview addGestureRecognizer:tap];
                btnview.model = btnModel;
            }
        }
    }
}
#pragma mark - 设置推广图片
- (void)setImagesDataArrM:(NSMutableArray *)imagesDataArrM
{
    _imagesDataArrM = imagesDataArrM;
    [imagesDataArrM enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        RecommandImages *imgModel = (RecommandImages *)obj;
        switch (idx) {
            case 0:
            {
                [_leftImageView sd_setImageWithURL:[NSURL URLWithString:imgModel.img] placeholderImage:[UIImage imageNamed:@"photo"]];
                _leftImageView.userInteractionEnabled = YES;
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imgClick:)];
                [_leftImageView addGestureRecognizer:tap];
            }
                break;
            case 1:
            {
                [_upImageView sd_setImageWithURL:[NSURL URLWithString:imgModel.img] placeholderImage:[UIImage imageNamed:@"photo"]];
                _upImageView.userInteractionEnabled = YES;
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imgClick:)];
                [_upImageView addGestureRecognizer:tap];
            }
                break;
            case 2:
            {
                [_bottomImageView sd_setImageWithURL:[NSURL URLWithString:imgModel.img] placeholderImage:[UIImage imageNamed:@"photo"]];
                _bottomImageView.userInteractionEnabled = YES;
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imgClick:)];
                [_bottomImageView addGestureRecognizer:tap];
            }
                break;
                
            default:
                break;
        }
    }];
}
#pragma mark - 设置广告标签
- (void)setMessageModel:(RecommandMessage *)messageModel
{
    _messageModel = messageModel;
    if (messageModel !=nil) {
        [_labelImageView sd_setImageWithURL:[NSURL URLWithString:messageModel.icon] placeholderImage:[UIImage imageNamed:@"photo"]];
        
        //滚动文字
        NSArray *arr = [NSJSONSerialization JSONObjectWithData:messageModel.notice options:NSJSONReadingMutableContainers error:nil];
        _textL.text = arr.lastObject;
    }
}

#pragma mark - 计时器
- (void)timerAction
{
    if (_scrollView.isDragging) {
        return;
    }
    _index ++;
    if (_index == _scrollDataArrM.count) {
        _index = 0;
    }else if (_index <= 0)
    {
        _index = _scrollDataArrM.count -1;
    }
    _pageControl.currentPage = _index;
    [_scrollView setContentOffset:CGPointMake(_index * WITDH, 0) animated:YES];
    
}
#pragma mark - 监听轮播图事件
- (void)scrollClick:(UITapGestureRecognizer *)tap
{
    
}
#pragma mark - 按钮点击事件
- (void)btnClick:(UITapGestureRecognizer *)tap
{
    
}
#pragma mark - 推广图片点击事件
- (void)imgClick:(UITapGestureRecognizer *)tap
{
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
@end
