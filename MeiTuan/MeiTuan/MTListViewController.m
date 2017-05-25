//
//  MTListViewController.m
//  MeiTuan
//
//  Created by xujunhao on 2017/5/25.
//  Copyright © 2017年 cocoadogs. All rights reserved.
//

#import "MTListViewController.h"
#import "MTListViewCell.h"


@interface MTListViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (copy, nonatomic) NSArray *infoArray;
@property (assign, nonatomic) NSUInteger listNum;
@property (strong, nonatomic) UITableView *tableView;

@end

@implementation MTListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"订单详情";
    [self.view setBackgroundColor:[UIColor colorWithRed:244/255.0f green:244/255.0f blue:244/255.0f alpha:1.0f]];
    self.edgesForExtendedLayout = UIRectEdgeAll;
    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.infoArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MTListViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MTListViewCell class]) forIndexPath:indexPath];
    // Configure the cell...
    NSInteger row = indexPath.row;
    [cell.infoLabel setText:self.infoArray[row]];
    cell.topLine.backgroundColor = [UIColor orangeColor];
    cell.bottomLine.backgroundColor = (row == (self.infoArray.count-1))?[UIColor grayColor]:[UIColor orangeColor];
    return cell;
}

#pragma mark - UITableViewDelegate Methods

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    [self scrollViewDidScroll:self.tableView];
}

#pragma mark - UIScrollViewDelegate Methods

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    MTListViewCell *topCell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    MTListViewCell *bottomCell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:self.listNum-1 inSection:0]];
    topCell.topLineTopConstraint.constant = MIN(0, scrollView.contentOffset.y);
    bottomCell.bottomLineBottomConstraint.constant = -scrollView.contentOffset.y-scrollView.frame.size.height;
}

#pragma mark - Lazy Load Methods

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.alwaysBounceVertical = YES;
        _tableView.backgroundColor = [UIColor colorWithRed:244/255.0f green:244/255.0f blue:244/255.0f alpha:1.0f];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.tableFooterView = [UIView new];
        _tableView.rowHeight = 64.0f;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([MTListViewCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([MTListViewCell class])];
    }
    return _tableView;
}

- (NSArray *)infoArray {
    if (!_infoArray) {
        _infoArray = @[@"订单已提交", @"支付成功", @"商家已接单", @"订单完成"];
        _listNum = _infoArray.count;
    }
    return _infoArray;
}

@end
