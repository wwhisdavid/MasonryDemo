//
//  MDKeyboardMasonryViewController.m
//  MasonryDemo
//
//  Created by wwhisdavid on 15/12/3.
//  Copyright © 2015年 wwhisdavid. All rights reserved.
//

#import "MDKeyboardMasonryViewController.h"
#import "Masonry.h"

@interface MDKeyboardMasonryViewController ()

@property (nonatomic, strong) UITextField *textField;

@end

@implementation MDKeyboardMasonryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 注册键盘通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrameNotification:) name:UIKeyboardWillChangeFrameNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHideNotification:) name:UIKeyboardWillHideNotification object:nil];
    // Do any additional setup after loading the view.
    [self layoutTextField];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark -- Private
- (void)keyboardWillChangeFrameNotification:(NSNotification *)notification {
    
    // 获取键盘基本信息（动画时长与键盘高度）
    NSDictionary *userInfo = [notification userInfo];
    CGRect rect = [userInfo[UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    CGFloat keyboardHeight = CGRectGetHeight(rect);
    CGFloat keyboardDuration = [userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    // 修改下边距约束
    [self.blueView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(- keyboardHeight);
    }];
    
    [self.view setNeedsUpdateConstraints];
    [self.view updateConstraintsIfNeeded];
    // 更新约束
    [UIView animateWithDuration:keyboardDuration animations:^{
        [self.view layoutIfNeeded];
    }];
}

- (void)keyboardWillHideNotification:(NSNotification *)notification {
    
    // 获得键盘动画时长
    NSDictionary *userInfo = [notification userInfo];
    CGFloat keyboardDuration = [userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    // 修改为以前的约束（距下边距0）
    [self.blueView mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.mas_equalTo(- 15);
    }];
    
    [self.view setNeedsUpdateConstraints];
    [self.view updateConstraintsIfNeeded];
    // 更新约束
    [UIView animateWithDuration:keyboardDuration animations:^{
        [self.view layoutIfNeeded];
    }];
}

- (void)layoutTextField
{
    [self.yellowView addSubview:self.textField];
    
    ws(self);
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(weakSelf.yellowView);
        make.width.mas_equalTo(100);
        make.height.equalTo(@40);
    }];
}

- (UITextField *)textField
{
    if (!_textField) {
        _textField = [[UITextField alloc] init];
        _textField.backgroundColor = [UIColor whiteColor];
        _textField.layer.borderColor = [UIColor blackColor].CGColor;
        _textField.layer.borderWidth = 1;
    }
    return _textField;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [self.textField endEditing:YES];
}

@end
