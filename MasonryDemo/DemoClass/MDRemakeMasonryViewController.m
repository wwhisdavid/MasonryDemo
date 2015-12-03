//
//  MDRemakeMasonryViewController.m
//  MasonryDemo
//
//  Created by wwhisdavid on 15/12/3.
//  Copyright © 2015年 wwhisdavid. All rights reserved.
//

#import "MDRemakeMasonryViewController.h"
#import "Masonry.h"

@interface MDRemakeMasonryViewController ()

@property (nonatomic, strong) UIButton *drawerBtn;
@property (nonatomic, assign) BOOL isOpened;

@end

@implementation MDRemakeMasonryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.isOpened = YES;
    [self layoutViewBtn];
}

- (void)layoutViewBtn
{
    [self.yellowView addSubview:self.drawerBtn];
    ws(self);
    [self.drawerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(weakSelf.yellowView);
    }];
}

- (void)click:(UIButton *)sender
{
    sender.selected = !sender.selected;
    self.isOpened = !sender.isSelected;
    
    [self.view setNeedsUpdateConstraints];
    [self.view updateConstraintsIfNeeded];
    
    [UIView animateWithDuration:0.7 animations:^{
        [self.view layoutIfNeeded];
    }];
}

- (void)updateViewConstraints
{
    ws(self);
    if (!self.isOpened) { // 收起操作
        [self.yellowView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(weakSelf.blueView).with.insets(UIEdgeInsetsMake(10, 20, 130, 40));
        }];
    }
    else{ // 打开操作
        [self.yellowView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(weakSelf.blueView).with.insets(UIEdgeInsetsMake(10, 20, 30, 40));
        }];
    }
    [super updateViewConstraints];
}

- (UIButton *)drawerBtn
{
    if (!_drawerBtn) {
        _drawerBtn = [[UIButton alloc] init];
        [_drawerBtn setTitle:@"收起" forState:UIControlStateNormal];
        [_drawerBtn setTitle:@"展开" forState:UIControlStateSelected];
        [_drawerBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_drawerBtn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchDown];
    }
    return _drawerBtn;
}
@end
