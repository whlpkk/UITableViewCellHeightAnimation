//
//  MyInfoCell.m
//  UITableViewCellHeightAnimation
//
//  Created by yzkmac on 2020/7/3.
//  Copyright © 2020 yzkmac. All rights reserved.
//

#import "MyInfoCell.h"

@interface MyInfoCell ()

@property (nonatomic, weak  ) MyCellModel *model;
@property (nonatomic, strong) UIButton    *button;
@property (nonatomic, strong) UIView      *lineView;
@property (nonatomic, strong) UILabel     *infoLabel;

@end

@implementation MyInfoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setup];
    }
    return self;
}

- (void)setup {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0];
    
    self.button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];
    [self.button addTarget:self action:@selector(buttonEvent) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.button];
    
    self.lineView                 = [[UIView alloc] initWithFrame:CGRectMake(0, 49.5, 320, 1.5f)];
    self.lineView.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.5f];
    [self.contentView addSubview:self.lineView];
    
    self.infoLabel      = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 100, 50)];
    self.infoLabel.text = @"Demo";
    [self.contentView addSubview:self.infoLabel];
}

- (void)buttonEvent {
    
    if (self.model.expend == YES) {
        self.model.expend = NO;
        [self.tableView beginUpdates];
        [self.tableView endUpdates];
        [self normalStateWithAnimated:YES];
    } else {
        self.model.expend = YES;
        [self.tableView beginUpdates];
        [self.tableView endUpdates];
        [self expendStateWithAnimated:YES];
    }
}

- (void)bindModel:(MyCellModel *)data {
    self.model = data;
    if (self.model.expend == YES) {
        [self expendStateWithAnimated:NO];
    } else {
        [self normalStateWithAnimated:NO];
    }
}

- (void)normalStateWithAnimated:(BOOL)animated {
    if (animated == YES) {
        [UIView animateWithDuration:0.3f animations:^{
            self.lineView.frame  = CGRectMake(0, 49.5, 320, 1.5f);
            self.infoLabel.frame = CGRectMake(10, 0, 100, 50);
        }];
    } else {
        self.lineView.frame  = CGRectMake(0, 49.5, 320, 1.5f);
        self.infoLabel.frame = CGRectMake(10, 0, 100, 50);
    }
}

- (void)expendStateWithAnimated:(BOOL)animated {
    if (animated == YES) {
        [UIView animateWithDuration:0.3f animations:^{
            self.lineView.frame  = CGRectMake(0, 99.5f, 320, 1.5f);
            self.infoLabel.frame = CGRectMake(30, 0, 100, 50);
        }];
    } else {
        self.lineView.frame  = CGRectMake(0, 99.5f, 320, 1.5f);
        self.infoLabel.frame = CGRectMake(30, 0, 100, 50);
    }
}


@end
