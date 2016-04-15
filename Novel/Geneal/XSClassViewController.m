//
//  XSClassViewController.m
//  Novel
//
//  Created by tens03 on 16/4/13.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "XSClassViewController.h"
#import <Masonry.h>
#import "XSCollectionViewCell.h"
//#import "XSBaseModel.h"
//#import "XSNetworkManager.h"
//#import "XSHomeClassModel.h"

static NSString *Identifier = @"CollectionView";
static NSString *headerIdentifier = @"headerIdentifier";
@interface XSClassViewController ()
<UICollectionViewDelegateFlowLayout,
UICollectionViewDataSource>

@property (strong, nonatomic) UICollectionView *collectionView;

//@property (copy, nonatomic) NSMutableArray *boyArray;
//@property (copy, nonatomic) NSMutableArray *girlArray;


@end

@implementation XSClassViewController

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBarHidden = NO;
    self.navigationItem.title = @"分类";
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.tintColor = [UIColor redColor];
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc]init];
    backButton.title = @"返回";
    self.navigationItem.backBarButtonItem = backButton;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerClass:[XSCollectionViewCell class] forCellWithReuseIdentifier:Identifier];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerIdentifier];

    
    [self setCollectionViewFrame];
    
    XSCollectionViewCell *collectionViewCell = [[XSCollectionViewCell alloc] init];
    [collectionViewCell addSubviews];
    [collectionViewCell setLabelLayout];
//    [self downloadData];
    
}

#pragma mark - privte

//- (void)downloadData {
//    XSBaseModel *requestModel = [[XSBaseModel alloc] init];
//    
//    [[XSNetworkManager shareInstance] homeClassWithModel:requestModel completionHandler:^(id result, NSError *error) {
//        if (error) {
//            
//        }
//        
//        for (NSDictionary *item in result[@"male"]) {
//            
//            XSHomeClassModel *model = [[XSHomeClassModel alloc] init];
//            model.name = item[@"name"];
//            model.bookCount = item[@"bookCount"];
//            
//            [self.boyArray addObject:model];
//        }
//        for (NSDictionary *item in result[@"female"]) {
//            
//            XSHomeClassModel *model = [[XSHomeClassModel alloc] init];
//            model.name = item[@"name"];
//            model.bookCount = item[@"bookCount"];
//            
//            [self.girlArray addObject:model];
//        }
//
//        
//        
//        [self.boyCollectionView reloadData];
//        [self.girlCollectionView reloadData];
//        
//    }];
//}

#pragma mark - setCollectionViewFrame

- (void)setCollectionViewFrame {
    
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@64);
        make.right.left.equalTo(self.view);
        make.height.equalTo(@(40 * 11));
    }];
    
}

#pragma mark - boyAndGirl <UICollectionViewDelegate,UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
//        return self.boyArray.count;
        return 14;
    } else {
//        return self.girlArray.count;
        return 12;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    XSCollectionViewCell *Cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:Identifier forIndexPath:indexPath];
    UICollectionViewFlowLayout *boyLayout = (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;
    CGFloat itemWidth = ceil((CGRectGetWidth([UIScreen mainScreen].bounds) - 1*2)/3);
    boyLayout.itemSize = CGSizeMake(itemWidth, 40);
    Cell.layer.borderWidth = 1;
    Cell.layer.borderColor = [UIColor grayColor].CGColor;
    Cell.backgroundColor = [UIColor whiteColor];

    
    if (indexPath.section == 0) {
//        [Cell setContentWithModel:self.boyArray[indexPath.row]];
    }else  {
//        [Cell setContentWithModel:self.girlArray[indexPath.row]];
    }
    return Cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    [self performSegueWithIdentifier:@"detaileClassIdentifier" sender:indexPath];
}

// collectionHeader
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {

    UICollectionReusableView *Header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerIdentifier forIndexPath:indexPath];

    UILabel *_title = [[UILabel alloc] initWithFrame:Header.frame];
    _title.textColor = [UIColor grayColor];
    _title.font = [UIFont systemFontOfSize:12];
    _title.backgroundColor = [UIColor whiteColor];
    _title.layer.borderWidth = 1;
    _title.layer.borderColor = [UIColor grayColor].CGColor;
    
    [Header addSubview:_title];
    
    if (indexPath.section == 0) {
        _title.text = @"男生";
    } else {
        _title.text = @"女生";
    }
    
    return Header;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(kScreenWidth, 50);
}

//设置每个item水平间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 1;
}

//设置每个item垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 1;
}

#pragma mark - Custom Accessor


- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        CGFloat itemFrame = ceil((CGRectGetWidth([UIScreen mainScreen].bounds) - 1 * 2)/3);
        layout.itemSize = CGSizeMake(itemFrame, 40);
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
    }
    return _collectionView;
}


//- (NSMutableArray *)boyArray {
//    if (!_boyArray) {
//        _boyArray = [NSMutableArray array];
//    }
//    return _boyArray;
//}
//
//- (NSMutableArray *)girlArray {
//    if (!_girlArray) {
//        _girlArray = [NSMutableArray array];
//    }
//    return _girlArray;
//}

@end
