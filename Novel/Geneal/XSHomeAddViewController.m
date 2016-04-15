//
//  XSHomeAddViewController.m
//  Novel
//
//  Created by tens03 on 16/4/13.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "XSHomeAddViewController.h"
#import "XSHomeAddTableViewCell.h"
#import "XSClassViewController.h"

@interface XSHomeAddViewController ()
<UITableViewDelegate,
UITableViewDataSource>
{
    NSArray *_titles;
    NSArray *_images;
}
@property (weak, nonatomic) IBOutlet UITableView *homeAddTableView;
@end

@implementation XSHomeAddViewController

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBarHidden = YES;
    self.homeAddTableView.backgroundColor = [UIColor blackColor];
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc]init];
    backButton.title = @"返回";
    self.navigationItem.backBarButtonItem = backButton;


}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - <UITableViewDelegate,UITableViewDataSource>

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 8;
}


- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = @"homeAddIdentifier";
    
    XSHomeAddTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    _titles = @[@"搜索",@"排行榜",@"主题书单",@"分类",@"随机看书",@"一元抢宝",@"游戏中心",@"漫画中心"];
    _images = @[@"rsm_icon_0",@"rsm_icon_1",@"rsm_icon_2",@"rsm_icon_3",@"rsm_icon_4",@"rsm_icon_5",@"rsm_icon_6",@"rsm_icon_7"];
    
    cell.homeAddLabel.text = _titles[indexPath.row];
    cell.homeAddImage.image = [UIImage imageNamed:_images[indexPath.row]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if (indexPath.row == 3) {
//        [self performSegueWithIdentifier:@"push" sender:indexPath];
        XSClassViewController *homeAddVC = [self.storyboard instantiateViewControllerWithIdentifier:@"XSClassViewController"];
            [self.navigationController pushViewController:homeAddVC animated:YES];
    }
}


@end
