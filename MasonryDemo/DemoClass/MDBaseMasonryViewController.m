//
//  MDBaseMasonryViewController.m
//  MasonryDemo
//
//  Created by wwhisdavid on 15/12/3.
//  Copyright © 2015年 wwhisdavid. All rights reserved.
//

#import "MDBaseMasonryViewController.h"
#import "Masonry.h"

@interface MDBaseMasonryViewController ()


@end

@implementation MDBaseMasonryViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    [self layoutViews];
}

- (void)layoutViews
{
    // 左上角红色的view
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView]; // 在布置约束前一定要记得该view要有父视图保证有约束立足点
    self.redView = redView;
    
    // 右上角绿色view
    UIView *greenView = [[UIView alloc] init];
    greenView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:greenView]; // 在布置约束前一定要记得该view要有父视图保证有约束立足点
    self.greenView = greenView;
    
    // 下方蓝色的view
    UIView *blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueView]; // 在布置约束前一定要记得该view要有父视图保证有约束立足点
    self.blueView = blueView;
    
    // blue内置的view
    UIView *yellowView = [[UIView alloc] init];
    yellowView.backgroundColor = [UIColor yellowColor];
    [self.blueView addSubview:yellowView]; // 在布置约束前一定要记得该view要有父视图保证有约束立足点
    self.yellowView = yellowView;
    
    ws(self);
    
    [self.redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(weakSelf.view).with.offset(15);
        make.width.equalTo(weakSelf.greenView);
        make.height.equalTo(weakSelf.greenView);
        make.right.equalTo(weakSelf.greenView.mas_left).with.offset(- 15);
    }];
    
    [self.greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.view).with.offset(- 15);
        make.top.equalTo(weakSelf.redView);
        make.height.equalTo(@50);
        make.left.equalTo(weakSelf.redView.mas_right).with.offset(15);
    }];
    
    [self.blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.redView.mas_bottom).with.offset(15);
        make.left.equalTo(weakSelf.redView);
        make.right.equalTo(weakSelf.greenView);
        make.bottom.equalTo(weakSelf.view).with.offset(- 15);
    }];

    [self.yellowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.blueView).with.insets(UIEdgeInsetsMake(10, 20, 30, 40));
    }];
}
@end
