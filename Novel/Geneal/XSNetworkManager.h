//
//  XSNetworkManager.h
//  Novel
//
//  Created by tens03 on 16/4/14.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "XSBaseModel.h"
#import "XSHomeClassModel.h"

typedef void(^CompletionHandler)(id result,NSError *error);
@interface XSNetworkManager : XSBaseModel

/**
 *  创建并返回一个单例对象
 */
+ (instancetype)shareInstance;

- (void)homeClassWithModel:(XSBaseModel *)model
         completionHandler:(CompletionHandler)completionHandler;

@end
