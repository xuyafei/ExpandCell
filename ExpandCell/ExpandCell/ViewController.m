//
//  ViewController.m
//  ExpandCell
//
//  Created by polycom on 2017/4/29.
//  Copyright © 2017年 xuyafei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak) UITableView *expandTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.expandTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableView *)expandTableView {
    if(!_expandTableView) {
        UITableView *expandTableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        _expandTableView = expandTableView;
        [self.view addSubview:expandTableView];
    }
    
    return _expandTableView;
}


@end
