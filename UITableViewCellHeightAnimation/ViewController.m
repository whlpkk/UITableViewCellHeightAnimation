//
//  ViewController.m
//  UITableViewCellHeightAnimation
//
//  Created by yzkmac on 2020/7/3.
//  Copyright © 2020 yzkmac. All rights reserved.
//

#import "ViewController.h"
#import "MyInfoCell.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray *datasArray;
@property (nonatomic, strong) UITableView    *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.datasArray = [NSMutableArray array];
    for (int i=0; i<4; i++) {
        [self.datasArray addObject:[MyCellModel modelWithNormalHeight:50.f expendHeight:100.f expend:NO]];
        [self.datasArray addObject:[MyCellModel modelWithNormalHeight:50.f expendHeight:100.f expend:YES]];
        [self.datasArray addObject:[MyCellModel modelWithNormalHeight:50.f expendHeight:100.f expend:YES]];
        [self.datasArray addObject:[MyCellModel modelWithNormalHeight:50.f expendHeight:100.f expend:NO]];
        [self.datasArray addObject:[MyCellModel modelWithNormalHeight:50.f expendHeight:100.f expend:YES]];
        [self.datasArray addObject:[MyCellModel modelWithNormalHeight:50.f expendHeight:100.f expend:YES]];
    }
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate       = self;
    self.tableView.dataSource     = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[MyInfoCell class] forCellReuseIdentifier:@"MyInfoCell"];
    [self.view addSubview:self.tableView];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _datasArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyInfoCell"];
    cell.indexPath = indexPath;
    cell.tableView = tableView;
    [cell bindModel:_datasArray[indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyCellModel *model = _datasArray[indexPath.row];
    if (model.expend) {
        return model.expendHeight;
    } else {
        return model.normalHeight;
    }
}

@end
