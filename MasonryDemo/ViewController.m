//
//  ViewController.m
//  MasonryDemo
//
//  Created by wwhisdavid on 15/12/3.
//  Copyright © 2015年 wwhisdavid. All rights reserved.
//

#import "ViewController.h"
#import "MDBaseMasonryViewController.h"
#import "MDKeyboardMasonryViewController.h"
#import "MDRemakeMasonryViewController.h"
#import "MDPriorityAndMutiMasonryController.h";

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *demoArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initTableView];
}

- (void)initTableView
{
    self.demoArray = [NSArray arrayWithObjects:@"基本布局使用", @"约束变化以及在动画中的使用(键盘)", @"约束变化以及在动画中的使用(Remake)", @"约束中比例和优先级",nil];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Demo"];
}

#pragma mark -- UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.demoArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Demo" forIndexPath:indexPath];
    cell.textLabel.text = (NSString *)[self.demoArray objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark -- UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
            [self presentViewController:[[MDBaseMasonryViewController alloc] init] animated:YES completion:^{
                
            }];
            break;
            
        case 1:
            [self presentViewController:[[MDKeyboardMasonryViewController alloc] init] animated:YES completion:^{
                
            }];
            break;
            
        case 2:
            [self presentViewController:[[MDRemakeMasonryViewController alloc] init] animated:YES completion:^{
                
            }];
            break;
            
        case 3:
            [self presentViewController:[[MDPriorityAndMutiMasonryController alloc] init] animated:YES completion:^{
                
            }];
            break;
        default:
            break;
    }
    }
@end
