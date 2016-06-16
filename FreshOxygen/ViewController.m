//
//  ViewController.m
//  FreshOxygen
//
//  Created by mac on 16/6/14.
//  Copyright © 2016年 Cijian.Wu. All rights reserved.
//

#import "ViewController.h"
#import "CJRecommandScrollView.h"
#import "CJHeader.h"


@interface ViewController ()

/** 下拉次数 */
@property(nonatomic,assign) NSInteger count;
/** 轮播图数据源 */
@property(nonatomic,strong) NSMutableArray *scrollDataArrM;
/** 按钮数据源 */
@property(nonatomic,strong) NSMutableArray *btnDataArrM;
/** 推广图片数据源 */
@property(nonatomic,strong) NSMutableArray *imagesDataArrM;
/** 广告消息模型 */
@property(nonatomic,strong) RecommandMessage *messageModel;
/** cell数据源 */
@property(nonatomic,strong) NSMutableArray *cellDataArrM;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    [self.tableView registerNib:[UINib nibWithNibName:@"CJRecommandCustomTableCell" bundle:nil] forCellReuseIdentifier:@"CJRecommandCustomTableCell"];
    [self requestData];

}
#pragma mark - 请求数据
- (void)requestData
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //设置请求方式
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
    
    [manager GET:[NSString stringWithFormat:RECOMMAND_URL,self.count] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        //轮播图数据源
        NSArray *scrollArr = responseObject[@"responseData"][@"banner"][@"child"];
        for (NSDictionary *dict in scrollArr) {
            RecommandScroll *scrollModel = [RecommandScroll recommandScrollWithDict:dict];
            [self.scrollDataArrM addObject:scrollModel];
        }
        //按钮数据源
        NSArray *btnArr = responseObject[@"responseData"][@"tool"];
        for (NSDictionary *dict in btnArr) {
            RecommandBtn *btnModel = [RecommandBtn recommandBtnWithDict:dict];
            [self.btnDataArrM addObject:btnModel];
        }
        //加载推荐模型
        NSArray *imgArr = responseObject[@"responseData"][@"wz_product"];
        for (NSDictionary *dict in imgArr) {
            RecommandImages *imgModel = [RecommandImages recommandImagesWithDict:dict];
            [self.imagesDataArrM addObject:imgModel];
        }
        //广告模型
        _messageModel = [RecommandMessage recommandMessageWithDict:responseObject[@"responseData"]];
        //cell数据源
        NSArray *cellArr = responseObject[@"responseData"][@"feed"];
        for (NSDictionary *dict in cellArr) {
            
            /**
             *  测试
             */
            
            if ([dict[@"certified_type"] integerValue] == 0) {
                CJRecommandCellModel *model = [[CJRecommandCellModel alloc] initWithDictionary:dict error:nil];
                [self.cellDataArrM addObject:model];
            }
            
        }
        [self createTopView];
        [self.tableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        CJLogStr(error);
    }];
}

- (void)createTopView
{
    CJRecommandScrollView *headerView = [[[NSBundle mainBundle] loadNibNamed:@"CJRecommandScrollView" owner:nil options:nil] lastObject];
    headerView.scrollDataArrM = self.scrollDataArrM;
    headerView.imagesDataArrM = self.imagesDataArrM;
    headerView.btnDataArrM = self.btnDataArrM;
    headerView.messageModel = self.messageModel;
    self.tableView.tableHeaderView = headerView;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cellDataArrM.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CJRecommandCellModel *model = self.cellDataArrM[indexPath.row];
    if (model.certified_type.intValue == 0) {
        CJRecommandCustomTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CJRecommandCustomTableCell"];
        cell.model = model;
        return cell;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CJRecommandCustomTableCell *cell =  (CJRecommandCustomTableCell*)[self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.contentView.frame.size.height;
}


- (NSMutableArray *)scrollDataArrM
{
    if (_scrollDataArrM == nil) {
        _scrollDataArrM = [NSMutableArray array];
    }
    return _scrollDataArrM;
}

-(NSMutableArray *)btnDataArrM
{
    if (_btnDataArrM == nil) {
        _btnDataArrM = [NSMutableArray array];
    }
    return _btnDataArrM;
}
- (NSMutableArray *)imagesDataArrM
{
    if (_imagesDataArrM == nil) {
        _imagesDataArrM = [NSMutableArray array];
    }
    return _imagesDataArrM;
}
- (NSMutableArray *)cellDataArrM
{
    if (_cellDataArrM == nil) {
        _cellDataArrM = [NSMutableArray array];
    }
    return _cellDataArrM;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
