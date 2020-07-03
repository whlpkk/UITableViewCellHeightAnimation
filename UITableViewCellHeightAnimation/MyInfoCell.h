//
//  MyInfoCell.h
//  UITableViewCellHeightAnimation
//
//  Created by yzkmac on 2020/7/3.
//  Copyright © 2020 yzkmac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyCellModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyInfoCell : UITableViewCell

@property (nonatomic, weak) NSIndexPath  *indexPath;
@property (nonatomic, weak) UITableView  *tableView;

- (void)bindModel:(MyCellModel *)data;

@end

NS_ASSUME_NONNULL_END
