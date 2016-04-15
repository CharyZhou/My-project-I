//
//  XSMyViewController.m
//  Novel
//
//  Created by tens03 on 16/4/11.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "XSMyViewController.h"
#import "XSMyTableViewCell.h"
#import <Masonry.h>

@interface XSMyViewController ()
<UITableViewDataSource,
UITableViewDelegate>
{
    NSArray *_title_0;
    NSArray *_title_1;
    NSArray *_title_2;
    NSArray *_title_3;
    
    NSArray *_image_0;
    NSArray *_image_1;
    NSArray *_image_2;
    NSArray *_image_3;
    
    __weak IBOutlet UIImageView *userImage;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) UIButton *logoutButton;

@end

@implementation XSMyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    userImage.layer.cornerRadius = 50/2;
    userImage.layer.masksToBounds = YES;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - <UITableViewDataSource,UITableViewDelegate>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 3;
    } else if (section == 1) {
        return 2;
    } else if (section == 2) {
        return 1;
    } else {
        return 2;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = @"identifier";
    XSMyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    _title_0 = @[@"消息",@"话题",@"书单"];
    _title_1 = @[@"我的账户",@"经验等级"];
    _title_2 = @[@"任务"];
    _title_3 = @[@"微信公众号",@"设置"];
    
    _image_0 = @[@"userCenter_msg",@"userCenter_topic",@"userCenter_bookList"];
    _image_1 = @[@"userCenter_account",@"userCenter_experience"];
    _image_2 = @[@"userCenter_task"];
    _image_3 = @[@"wechat",@"userCenter_setting"];
    
    if (indexPath.section == 0) {
        cell.MyCellLabel.text = _title_0[indexPath.row];
        cell.MyCellImage.image = [UIImage imageNamed:_image_0[indexPath.row]];
    } else if (indexPath.section == 1) {
        cell.MyCellLabel.text = _title_1[indexPath.row];
        cell.MyCellImage.image = [UIImage imageNamed:_image_1[indexPath.row]];
    } else if (indexPath.section == 2) {
        cell.MyCellLabel.text = _title_2[indexPath.row];
        cell.MyCellImage.image = [UIImage imageNamed:_image_2[indexPath.row]];
    } else {
        cell.MyCellLabel.text = _title_3[indexPath.row];
        cell.MyCellImage.image = [UIImage imageNamed:_image_3[indexPath.row]];
    }

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 3) {
        return 50;
    }
    return 20;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *footerView = [[UIView alloc] init];
    footerView.userInteractionEnabled = YES;
    
    if (section == 3) {
        [footerView addSubview:self.logoutButton];
        [self.logoutButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(footerView.mas_centerX);
            make.top.equalTo(@10);
            make.width.equalTo(@150);
            make.height.equalTo(@30);
        }];
    }
    
    return footerView;
}

#pragma mark - Custom Accessor

- (UIButton *)logoutButton {
    if (!_logoutButton) {
        _logoutButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 400, 40)];
        [_logoutButton setTitle:@"退出登录" forState:UIControlStateNormal];
        [_logoutButton setTintColor:[UIColor whiteColor]];
        _logoutButton.backgroundColor = [UIColor redColor];
    }
    return _logoutButton;
}


@end
