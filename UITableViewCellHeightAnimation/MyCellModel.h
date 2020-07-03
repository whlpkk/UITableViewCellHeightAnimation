//
//  MyCellModel.h
//  UITableViewCellHeightAnimation
//
//  Created by yzkmac on 2020/7/3.
//  Copyright © 2020 yzkmac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyCellModel : NSObject

@property (nonatomic) CGFloat  normalHeight;
@property (nonatomic) CGFloat  expendHeight;
@property (nonatomic) BOOL     expend;

+ (instancetype)modelWithNormalHeight:(CGFloat)normalHeight expendHeight:(CGFloat)expendHeight expend:(BOOL)expend;

@end

NS_ASSUME_NONNULL_END
