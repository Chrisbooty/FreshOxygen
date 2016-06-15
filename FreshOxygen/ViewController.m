//
//  ViewController.m
//  FreshOxygen
//
//  Created by mac on 16/6/14.
//  Copyright © 2016年 Cijian.Wu. All rights reserved.
//

#import "ViewController.h"
#import "CJRecommandScrollView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CJRecommandScrollView *headerView = [[[NSBundle mainBundle] loadNibNamed:@"CJRecommandScrollView" owner:nil options:nil] lastObject];
    
//    self.tableView.tableHeaderView =
}


//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    
//}
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
