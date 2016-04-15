//
//  XSHomeClassCollectionViewCell.m
//  Novel
//
//  Created by tens03 on 16/4/13.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "XSCollectionViewCell.h"
#import <Masonry.h>


@implementation XSCollectionViewCell

- (void)setContentWithModel:(XSHomeClassModel *)model{
    _homeClassModel = model;
    
    [self addSubviews];
//    self.BookTypeLabel.text = self.homeClassModel.name;
//    self.boyBookNumberLabel.text = [[self.homeClassModel.bookCount stringValue] stringByAppendingString:@"  本"];
    
    [self setLabelLayout];
}

#pragma mark - setLabelLayout 


- (void)addSubviews
{
    [self.contentView addSubview:self.BookTypeLabel];
    [self.contentView addSubview:self.boyBookNumberLabel];
}

- (void)setLabelLayout {
    [self.BookTypeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView.mas_centerX);
        make.top.equalTo(self.contentView.mas_top).offset(10);
        make.width.equalTo(@50);
        make.height.equalTo(@12);
    }];
    
    [self.boyBookNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView.mas_centerX);
        make.top.equalTo(self.BookTypeLabel.mas_bottom).offset(3);
        make.width.equalTo(@50);
        make.height.equalTo(@10);
    }];
}

#pragma mark - Custom Accessor

- (UILabel *)BookTypeLabel {
    if (!_BookTypeLabel) {
        _BookTypeLabel = [[UILabel alloc] init];
        _BookTypeLabel.font = [UIFont systemFontOfSize:12];
        _BookTypeLabel.textAlignment = NSTextAlignmentCenter;
        _BookTypeLabel.text = @"玄幻";
    }
    return _BookTypeLabel;
}

- (UILabel *)boyBookNumberLabel {
    if (!_BookNumberLabel) {
        _BookNumberLabel = [[UILabel alloc] init];
        _BookNumberLabel.font = [UIFont systemFontOfSize:9];
        _BookNumberLabel.textColor = [UIColor grayColor];
        _BookNumberLabel.textAlignment = NSTextAlignmentCenter;
        _BookNumberLabel.text = @"1234 本";
    }
    return _BookNumberLabel;
}
@end
