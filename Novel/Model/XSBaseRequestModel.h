//
//  XSBaseRequestModel.h
//  Novel
//
//  Created by tens03 on 16/4/14.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "XSBaseModel.h"

@interface XSBaseRequestModel : XSBaseModel

/**
 *  返回参数拼接的字符串
 */
- (NSString *)paramenterString;
/**
 *  把当前对象转换成jsonData
 */
- (NSData *)jsonData;

/**
 *  把当前对象转换成字典
 */
- (NSDictionary *)dictionary;

@end
