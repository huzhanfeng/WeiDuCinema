//
//  ClearCache.h
//  IOSCache
//
//  Created by 耿荣林 on 18/3/17.
//  Copyright © 2018年 耿荣林. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClearCache : NSObject

/*
 *描述：获取path路径下文件大小
 *参数： path 要获取的文件夹路径
 *返回： 返回路径文件夹下的大小
 */
+ (NSString *)getCacheSizeWithFilePath:(NSString *)path;

/*
 *清楚path路径下文件夹缓存
 *param path 要获取的文件夹路径
 *return 是否清除成功
 */
+ (BOOL)clearCacheWithFilePath:(NSString *)path;

@end
