//
//  MyCellModel.m
//  UITableViewCellHeightAnimation
//
//  Created by yzkmac on 2020/7/3.
//  Copyright © 2020 yzkmac. All rights reserved.
//

#import "MyCellModel.h"

@implementation MyCellModel

+ (instancetype)modelWithNormalHeight:(CGFloat)normalHeight expendHeight:(CGFloat)expendHeight expend:(BOOL)expend {

    MyCellModel *model = [[MyCellModel alloc] init];
    
    model.normalHeight = normalHeight;
    model.expendHeight = expendHeight;
    model.expend       = expend;
    
    return model;
}

@end
