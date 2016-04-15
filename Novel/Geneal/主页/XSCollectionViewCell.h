//
//  XSHomeClassCollectionViewCell.h
//  Novel
//
//  Created by tens03 on 16/4/13.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XSHomeClassModel.h"

@interface XSCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) UILabel *BookTypeLabel;
@property (strong, nonatomic) UILabel *BookNumberLabel;
@property (strong, nonatomic) XSHomeClassModel *homeClassModel;

- (void)setContentWithModel:(XSHomeClassModel *)model;

- (void)addSubviews;
- (void)setLabelLayout;

@end
