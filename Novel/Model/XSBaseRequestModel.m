//
//  XSBaseRequestModel.m
//  Novel
//
//  Created by tens03 on 16/4/14.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "XSBaseRequestModel.h"

@implementation XSBaseRequestModel

- (NSString *)paramenterString {
    
//    NSMutableString *string = [NSMutableString string];
//    
//    for (NSString *name in [self propertyList]) {
//        
//        id value = [self valueForKey:name];
//        
//        if (value == nil) {
//            continue;
//        }
//        
//        NSString *aName = [name isEqualToString:@"idstr"] ?  @"id": name;
//        [string appendString:[NSString stringWithFormat:@"%@=%@&", aName, value]];
//    }
//    
//    [string deleteCharactersInRange:NSMakeRange(string.length-1, 1)];
    
//    return string;
    return nil;
}

- (NSData *)jsonData {
    return [[self paramenterString] dataUsingEncoding:NSUTF8StringEncoding];
}

- (NSDictionary *)dictionary {
    return [self dictionaryWithValuesForKeys:[self propertyList]];
}

@end
