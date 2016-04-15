//
//  XSBaseModel.m
//  Novel
//
//  Created by tens03 on 16/4/14.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "XSBaseModel.h"
#import <objc/runtime.h>

#define kDocumentsPath          [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"]
#define kArchivePath [NSString stringWithFormat:@"%@/%@", kDocumentsPath, [self class]]
@implementation XSBaseModel

/**
 *  初始化model并赋值
 */
- (instancetype)initWithObject:(id)object {
    self = [super init];
    if (self) {
        if ([object isKindOfClass:[NSDictionary class]]) {
            [self setValuesForKeysWithDictionary:object];
        }
        if ([object isKindOfClass:[NSData class]]) {
            NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:object options:NSJSONReadingMutableContainers error:nil];
            [self setValuesForKeysWithDictionary:dictionary];
        }
    }
    return self;
}

- (void)setValue:(id)value forKey:(NSString *)key {
    
}
/**
 *  归档
 */
- (void)archive {
    [NSKeyedArchiver archiveRootObject:self toFile:kArchivePath];
}
/**
 *  解档
 */
+ (instancetype)unarchive {
    return [NSKeyedUnarchiver unarchiveObjectWithFile:kArchivePath];
}
/**
 *  删档
 */
+ (BOOL)removeArchive {
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if ([fileManager fileExistsAtPath:kArchivePath]) {
        
        return [fileManager removeItemAtPath:kArchivePath error:nil];
    }
    
    return NO;
}
/**
 *  返回当前对象的属性列表
 */
- (NSArray *)propertyList {
    
    Class aClass = [self class];
    NSMutableArray *propertyNames = [NSMutableArray array];
    
    while ([aClass isSubclassOfClass:[XSBaseModel class]]) {
        
        unsigned int propertyCount;
        objc_property_t *propertyList = class_copyPropertyList(aClass, &propertyCount);
        
        for (int i=0; i<propertyCount; i++) {
            
            objc_property_t property = propertyList[i];
            
            NSString *name = [NSString stringWithUTF8String:property_getName(property)];
            
            [propertyNames addObject:name];
        }
        
        aClass = [aClass superclass];
    }
    
    return propertyNames;
}

#pragma mark - NSCoding
/*
 *编码 解码
 */
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super init];
    if (self) {
        for (NSString *name in [self propertyList]) {
            id value = [aDecoder decodeObjectForKey:name];
            [self setValue:value forKey:name];
        }
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    
    for (NSString *name in [self propertyList]) {
        [aCoder encodeObject:[self valueForKey:name] forKey:name];
    }
}


@end
