//
//  ClearCache.m
//  IOSCache
//
//  Created by 耿荣林 on 18/3/17.
//  Copyright © 2018年 耿荣林. All rights reserved.
//

#import "ClearCache.h"
//#import "SDImageCache.h"

@implementation ClearCache

+ (NSString *)getCacheSizeWithFilePath:(NSString *)path{
    //获取当前路径下的所有文件：
    NSArray *subPathArr = [[NSFileManager defaultManager]subpathsAtPath:path];
    NSString *filePath = nil;
    NSInteger *totleSize = 0;
    for (NSString *subPath in subPathArr) {
        //拼接每一个子文件的路径：
        filePath = [path stringByAppendingString:subPath];
        //是否是文件夹：
        BOOL isDirectory = NO;
        //文件是否存在
        BOOL isExist = [[NSFileManager defaultManager]fileExistsAtPath:filePath isDirectory:&isDirectory];
        //文件过滤
        if (!isExist || isDirectory || [filePath containsString:@".DS"]) {
            continue;
        }
        //指定路径，获取这个路径属性
        long size = [[[NSFileManager defaultManager]attributesOfItemAtPath:filePath error:nil]fileSize];
        totleSize += size;
    }
//    long SDSize = [[SDImageCache sharedImageCache] getSize];
//    totleSize += SDSize;
    //将文件夹大小转化为M/KB/B
    NSString *totleStr = @"";
    if ((long)totleSize > 1024 * 1024) {
        totleStr = [NSString stringWithFormat:@"%.2fM",(long)totleSize / (1024.00f * 1024.00f)];
    }else if ((long)totleSize > 1024){
        totleStr = [NSString stringWithFormat:@"%.2fB",(long)totleSize / 1024.00f];
    }else{
        totleStr = [NSString stringWithFormat:@"%.2fB",(long)totleSize / 1.00f];
    }
    return totleStr;
}

+ (BOOL)clearCacheWithFilePath:(NSString *)path{
    NSArray *subPathArr = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:path error:nil];
    NSString *filePath = @"";
    NSError *error = nil;
    for (NSString *subPath in subPathArr) {
        filePath = [path stringByAppendingString:subPath];
        //删除子文件
        [[NSFileManager defaultManager]removeItemAtPath:filePath error:&error];
        if (error) {
            return NO;
        }
    }
    //SDImageCache
//    [[SDImageCache sharedImageCache] clearDiskOnCompletion:^{
    
//    }];
    return YES;
}

@end
