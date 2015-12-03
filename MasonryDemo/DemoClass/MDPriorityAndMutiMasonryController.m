//
//  MDPriorityAndMutiMasonryController.m
//  MasonryDemo
//
//  Created by wwhisdavid on 15/12/3.
//  Copyright © 2015年 wwhisdavid. All rights reserved.
//

#import "MDPriorityAndMutiMasonryController.h"
#import "Masonry.h"

@interface MDPriorityAndMutiMasonryController ()

@property (nonatomic, strong) UIButton *priorityBtn;

@end

@implementation MDPriorityAndMutiMasonryController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self layoutPriorityView];
}

- (void)layoutPriorityView
{
    CGFloat HWRate = [UIScreen mainScreen].bounds.size.height / [UIScreen mainScreen].bounds.size.width;
    [self.yellowView addSubview:self.priorityBtn];
    ws(self);
    [self.priorityBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(weakSelf.yellowView);
        make.width.equalTo(@60).priorityLow();
        make.height.mas_equalTo(weakSelf.priorityBtn.mas_width).multipliedBy(HWRate); // height = width * HWRate 固定宽高比
        
    }];
}

- (void)click:(UIButton *)sender
{
    ws(self);
    [self.priorityBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.right.lessThanOrEqualTo(weakSelf.yellowView);
        make.height.equalTo(self.yellowView).priorityLow();
    }];
    
    [self.view setNeedsUpdateConstraints];
    [self.view updateConstraintsIfNeeded];
    
    [UIView animateWithDuration:1.0 animations:^{
        [self.view layoutIfNeeded];
    }];
}

- (UIButton *)priorityBtn
{
    if (!_priorityBtn) {
        _priorityBtn = [[UIButton alloc] init];
        _priorityBtn.backgroundColor = [UIColor purpleColor];
        [_priorityBtn setTitle:@"点我" forState:UIControlStateNormal];
        [_priorityBtn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _priorityBtn;
}
@end
