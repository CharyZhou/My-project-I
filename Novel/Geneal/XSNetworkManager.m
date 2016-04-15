//
//  XSNetworkManager.m
//  Novel
//
//  Created by tens03 on 16/4/14.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "XSNetworkManager.h"

static XSNetworkManager *networkManager;
@implementation XSNetworkManager

#pragma mark - single instance

+ (instancetype)shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!networkManager) {
            networkManager = [[XSNetworkManager alloc] init];
        }
    });
    return networkManager;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!networkManager) {
            networkManager = [super allocWithZone:zone];
        }
    });
    return networkManager;
}

- (id)copy {
    return networkManager;
}

#pragma mark - Private

- (void)sendRequest:(NSURLRequest *)request completionHandler:(CompletionHandler)completionHandler {
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *URLSession = [NSURLSession sessionWithConfiguration:config];
    NSURLSessionDataTask *dataTask = [URLSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            completionHandler(nil, error);
            
        }
        NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
            completionHandler(result, nil);
    
    }];
    [dataTask resume];
}

#pragma mark - API

- (void)homeClassWithModel:(XSBaseModel *)model completionHandler:(CompletionHandler)completionHandler {
    NSString *URLString = @"http://api.zhuishushenqi.com/cats/lv2/statistics";
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:URLString]];
    [self sendRequest:request completionHandler:^(id result, NSError *error) {
        
        if (error) {
            completionHandler(nil, error);
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
             completionHandler(result,nil);
        });
    }];
}

@end
