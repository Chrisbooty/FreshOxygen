//
//  CJDiscoverTableController.m
//  FreshOxygen
//
//  Created by mac on 16/6/16.
//  Copyright © 2016年 Cijian.Wu. All rights reserved.
//

#import "CJDiscoverTableController.h"
#import "CJHeader.h"
#import "CJDiscoverCellTableCell.h"
#import "CJDiscoverHeaderView.h"
#import "CJDiscoverTableHeaderView.h"

@interface CJDiscoverTableController ()

/** 下拉刷新次数 */
@property(nonatomic,assign) NSInteger count;
/** 对应分类id */
@property(nonatomic,assign) NSInteger btnId;
/** 表头数据源 */
@property(nonatomic,strong) NSMutableArray *headerDataArrM;
/** cell数据源 */
@property(nonatomic,strong) NSMutableArray *dataArrM;

@end

@implementation CJDiscoverTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化请求id
    _count = _btnId = 1;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self requestData];
}

#pragma mark - 数据请求
- (void)requestData
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:[NSString stringWithFormat:DISCOVER_URL,_count,_btnId] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        //表头数据
        NSArray *headerArr = responseObject[@"responseData"][@"hot_team"];
        for (NSDictionary *dict in headerArr) {
            CJDiscoverHeaderModel *model = [[CJDiscoverHeaderModel alloc] initWithDictionary:dict error:nil];
            [self.headerDataArrM addObject:model];
        }
        //加载表头UI
        if (self.headerDataArrM.count != 0) {
            [self createHeaderView];
        }
        //cell 数据源
        NSArray *cellArr = responseObject[@"responseData"][@"data"];
        for (NSDictionary *dict in cellArr) {
            CJDiscoverCellModel *model = [[CJDiscoverCellModel alloc] initWithDictionary:dict error:nil];
            if (model != nil) {
                [self.dataArrM addObject:model];
            }
        }
        
        [self.tableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

 - (void)createHeaderView
{
    //加载表头自定义 view
    CJDiscoverHeaderView *view = [[[NSBundle mainBundle] loadNibNamed:@"CJDiscoverHeaderView" owner:nil options:nil] lastObject];
    view.dataArr = self.headerDataArrM;
    self.tableView.tableHeaderView = view;
}
#pragma mark -- Table view data source
#pragma mark - 段
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
#pragma mark - 行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArrM.count;
}
#pragma makr - 设置行
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CJDiscoverCellTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"discoverCell"];
    CJDiscoverCellModel *model = self.dataArrM[indexPath.row];
    cell.model = model;
    return cell;
}
#pragma mark - 自定义表头
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    CJDiscoverTableHeaderView *headerView = [CJDiscoverTableHeaderView new];
    return headerView;
}
#pragma mark - 表头高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}

#pragma mark -懒加载
- (NSMutableArray *)headerDataArrM
{
    if (_headerDataArrM == nil) {
        _headerDataArrM = [NSMutableArray array];
    }
    return _headerDataArrM;
}
- (NSMutableArray *)dataArrM
{
    if (_dataArrM == nil) {
        _dataArrM = [NSMutableArray array];
    }
    return _dataArrM;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
