//
//  XSSetupViewController.m
//  Novel
//
//  Created by tens03 on 16/4/11.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "XSSetupViewController.h"
#import <Masonry.h>
#import "XSSetupTableViewCell.h"

@interface XSSetupViewController ()
<UITableViewDelegate,
UITableViewDataSource>

{
    NSArray *_titles1;
    NSArray *_titles2;
    NSArray *_titles3;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@property (strong, nonatomic) UILabel *headerLabel_0;
@property (strong, nonatomic) UILabel *headerLabel_1;
@property (strong, nonatomic) UILabel *headerLabel_2;
@property (strong, nonatomic) UILabel *headerLabel_3;



@end

@implementation XSSetupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
        self.automaticallyAdjustsScrollViewInsets = false;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - <UITableViewDelegate,UITableViewDataSource>


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    } else if (section == 1) {
        return 4;
    } else {
        return 7;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier;
    if (indexPath.section == 0) {
        identifier = @"reuseIdentifier1";
    } else if (indexPath.section == 1 && indexPath.row == 0) {
        identifier = @"reuseIdentifier4";
    } else if (indexPath.section == 1 && indexPath.row == 1) {
        identifier = @"reuseIdentifier2";
    } else if (indexPath.section == 1 && (indexPath.row == 2 || indexPath.row == 3)) {
        identifier = @"reuseIdentifier3";
    } else if (indexPath.section == 2 && indexPath.row == 0) {
        identifier = @"reuseIdentifier4";
    } else {
        identifier = @"reuseIdentifier2";
    }
    
    XSSetupTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    cell.titleLabel.backgroundColor = [UIColor clearColor];
    
    _titles1 = @[@"小说更新提醒"];
    _titles2 = @[@"书架排序",@"书架同步",@"省流量模式（无头像）",@"夜间模式"];
    _titles3 = @[@"清理网络缓存",@"书籍缓存管理",@"免责声明",@"意见反馈",@"加入我们",@"报告网络问题",@"请赐予我评分"];

    if (indexPath.section == 0) {
        cell.titleLabel.text = _titles1[indexPath.row];
        if (indexPath.row == 0) {
            cell.detileLabel.text = @"已开启";
        }
    } else if (indexPath.section == 1) {
        cell.titleLabel.text = _titles2[indexPath.row];
        if (indexPath.row == 0) {
            cell.detileLabel.text = @"更新时间";
        }
    } else if (indexPath.section == 2) {
        cell.titleLabel.text = _titles3[indexPath.row];
        if (indexPath.row == 0) {
            cell.detileLabel.text = @"0 MB";
        }
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 45;
}



- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] init];
    
  
    if (section == 0) {
        [headerView addSubview:self.headerLabel_0];
        [self.headerLabel_0 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(@10);
            make.bottom.equalTo(headerView.mas_bottom).offset(-2);
        }];
    }
    if (section == 1) {
        [headerView addSubview:self.headerLabel_1];
        [headerView addSubview:self.headerLabel_2];

        [self.headerLabel_1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(@10);
            make.top.equalTo(headerView.mas_top).offset(2);
        }];
    
        [self.headerLabel_2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(@10);
            make.bottom.equalTo(headerView.mas_bottom).offset(-2);
        }];
    }
    if (section == 2){
          [headerView addSubview:self.headerLabel_3];
        [self.headerLabel_3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(@10);
            make.bottom.equalTo(headerView.mas_bottom).offset(-2);
        }];
    }
    return headerView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Custom Accessor


- (UILabel *)headerLabel_0 {
    if (!_headerLabel_0) {
        _headerLabel_0 = [[UILabel alloc]init];
        _headerLabel_0.font = [UIFont systemFontOfSize:10];
        _headerLabel_0.textColor = [UIColor grayColor];
        _headerLabel_0.text = @"推送设置";
    }
    return _headerLabel_0;
}
- (UILabel *)headerLabel_1 {
    if (!_headerLabel_1) {
        _headerLabel_1 = [[UILabel alloc]init];
        _headerLabel_1.font = [UIFont systemFontOfSize:10];
        _headerLabel_1.textColor = [UIColor grayColor];
        _headerLabel_1.text = @"如需开启/关闭提醒，请在系统的【设置】-【通知中心】中进行设置";
    }
    return _headerLabel_1;
}
- (UILabel *)headerLabel_2 {
    if (!_headerLabel_2) {
        _headerLabel_2 = [[UILabel alloc]init];
        _headerLabel_2.font = [UIFont systemFontOfSize:10];
        _headerLabel_2.textColor = [UIColor grayColor];
        _headerLabel_2.text = @"通用设置";
    }
    return _headerLabel_2;
}
- (UILabel *)headerLabel_3 {
    if (!_headerLabel_3) {
        _headerLabel_3 = [[UILabel alloc]init];
        _headerLabel_3.font = [UIFont systemFontOfSize:10];
        _headerLabel_3.textColor = [UIColor grayColor];
        _headerLabel_3.text = @"关于我们 V2.24.20";
    }
    return _headerLabel_3;
}


@end
