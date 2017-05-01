//
//  ViewController.m
//  ExpandCell
//
//  Created by polycom on 2017/4/29.
//  Copyright © 2017年 xuyafei. All rights reserved.
//

#import "ViewController.h"
#import "EPCellModel.h"
#import "EPSectionModel.h"
#import "EPMoreTableViewCell.h"
#import "EPTableViewHeader.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) UITableView *expandTableView;
@property (nonatomic, strong) NSArray<EPSectionModel *> *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"点击展开和缩放";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.expandTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.expandTableView.backgroundColor = [UIColor whiteColor];
    self.expandTableView.delegate = self;
    self.expandTableView.dataSource = self;
    //self.expandTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    [EPSectionModel loadData:^(NSArray *models) {
        self.dataSource = models;
    }];
    self.expandTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (NSArray *)dataSource {
    if(!_dataSource) {
        _dataSource = [[NSArray array] init];
    }
    
    return _dataSource;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableView *)expandTableView {
    if(!_expandTableView) {
        UITableView *expandTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
        _expandTableView = expandTableView;
        [self.view addSubview:expandTableView];
    }
    
    return _expandTableView;
}

#pragma mark - TableView data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource[section].isExpanded ? self.dataSource[section].cellModels.count : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    EPMoreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"epMoreCellID"];
    
    if(!cell) {
        cell = [[EPMoreTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"epMoreCellID"];
    }
    cell.cellModel = self.dataSource[indexPath.section].cellModels[indexPath.row];
    cell.contentView.backgroundColor = [UIColor lightGrayColor];
    cell.contentView.layer.borderColor = [UIColor colorWithRed:188 green:188 blue:194 alpha:1.0].CGColor;
    cell.contentView.layer.borderWidth = 0.5;
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    EPTableViewHeader *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"header"];
    
    if(!headerView) {
        headerView = [[EPTableViewHeader alloc] initWithReuseIdentifier:@"header"];
    }
    
    headerView.sectionModel = self.dataSource[section];
    headerView.headerClickerBack = ^(BOOL isExpand) {
        [tableView reloadSections:[[NSIndexSet alloc] initWithIndex:section] withRowAnimation:UITableViewRowAnimationAutomatic];
    };
    
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return  50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return  50;
}


@end
