//
//  XSHomeViewController.m
//  Novel
//
//  Created by tens03 on 16/4/11.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "XSHomeViewController.h"
#import "XSHomeTableViewCell.h"
#import "XSHomeTableViewCell_1.h"
#import <Masonry.h>
#import "XSHomeAddViewController.h"

@interface XSHomeViewController ()
<UITableViewDelegate,
UITableViewDataSource> {
    NSArray *_titles;
    NSArray *_imageNames;
    CGFloat _redMarkFrame;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView_right;
@property (weak, nonatomic) IBOutlet UIView *markView;
@property (weak, nonatomic) IBOutlet UIButton *leftButton;
@property (weak, nonatomic) IBOutlet UIButton *rightButton;

@property (strong, nonatomic) UITableView *tableView_left;
@property (strong, nonatomic) UIView *redMark;

@end

@implementation XSHomeViewController

- (void)viewWillAppear:(BOOL)animated {
    
    self.navigationController.navigationBarHidden = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:203/255.0 green:15/255.0 blue:0 alpha:1];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _redMarkFrame = 0;
    [self setupLayout];
    self.tableView_right.hidden = YES;
    self.tableView_left.hidden = NO;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)leftAndRightButton:(UIButton *)sender {
    _redMarkFrame = sender.left;
    [self.view setNeedsUpdateConstraints];
    [self.view needsUpdateConstraints];
    [UIView animateWithDuration:0.2 animations:^{
        [self.view layoutIfNeeded];
    }];
    self.tableView_left.hidden = sender.tag != 0;
    self.tableView_right.hidden = sender.tag == 0;
}
- (IBAction)pushHomeAddView:(UIBarButtonItem *)sender {
//    XSHomeAddViewController *homeAddVC = [self.storyboard instantiateViewControllerWithIdentifier:@"XSHomeAddViewController"];
//    [self.navigationController pushViewController:homeAddVC animated:YES];
    [self performSegueWithIdentifier:@"XSHomeAddViewController" sender:sender];
}


#pragma mark - Layout

- (void)updateViewConstraints {
    if (self.redMark.superview) {
        [self.redMark mas_updateConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(@(_redMarkFrame));
        }];
    }
    [super updateViewConstraints];
}

- (void)setupLayout {
    
    [self.markView addSubview:self.redMark];
    
    [self.redMark mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.markView);
        make.leading.equalTo(@(_redMarkFrame));
        make.width.equalTo(self.leftButton.mas_width);
    }];
    [self.tableView_left mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.leftButton.mas_bottom);
        make.leading.trailing.bottom.equalTo(self.view);
    }];
    
    [self.tableView_left registerNib:
     [UINib nibWithNibName:@"XSHomeTableViewCell_1" bundle:nil] forCellReuseIdentifier:@"homeCellIdentifier_1"];
    
    UIImageView *titleImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"zssq_image"]];
    
    self.navigationItem.titleView = titleImage;
    
}

#pragma mark - <UITableViewDelegate,UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([tableView isEqual:self.tableView_left]) {
        return 1;
    } else {
        return 5;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier;
    
    _titles = @[@"动态",@"综合讨论区",@"书评区",@"书荒互助区",@"女生区"];
    _imageNames = @[@"d_icon",@"f_ramble_icon",@"forum_public_review_icon",@"forum_public_help_icon",@"g_girl_avatar"];
    
    if ([tableView isEqual:self.tableView_left]) {
        XSHomeTableViewCell_1 *cell = [tableView dequeueReusableCellWithIdentifier:@"homeCellIdentifier_1" forIndexPath:indexPath];
        
        return cell;
    } else {
        if (indexPath.row == 2) {
            identifier = @"homeDetailedIdentifier";
        } else {
            identifier = @"homeIdentifier";
        }
        
        XSHomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];

        cell.homeCellLabel.text = _titles[indexPath.row];
        cell.homeCelDetailedLabel.text = @"[找书必看]";
        cell.homeCellImage.image = [UIImage imageNamed:_imageNames[indexPath.row]];
        
        return cell;
    }
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Custom Accessor

- (UITableView *)tableView_left {
    if (!_tableView_left) {
        _tableView_left = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView_left.delegate = self;
        _tableView_left.dataSource = self;
        [self.view addSubview:_tableView_left];
    }
    return _tableView_left;
}

- (UIView *)redMark {
    if (!_redMark) {
        _redMark = [[UIView alloc]init];
        _redMark.backgroundColor = [UIColor redColor];
    }
    return _redMark;
}

@end
