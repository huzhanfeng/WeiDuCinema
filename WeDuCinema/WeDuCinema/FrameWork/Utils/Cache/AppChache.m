//
//  AppChache.m
//  iOSApp
//
//  Created by 耿荣林 on 2018/8/29.
//  Copyright © 2018年 耿荣林. All rights reserved.
//

#import "AppChache.h"

@implementation AppChache
// 返回临时路径
+ (NSString *)getTempPath {
    return NSTemporaryDirectory();
}
//返回缓存根目录 "caches"
+ (NSString *)getCachesDirectory {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *caches = [paths firstObject];
    NSLog(@"=======%@",caches);
    return caches;
}

//返回根目录路径 "document"
+ (NSString *)getDocumentPath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentPath = [paths firstObject];
    return documentPath;
}

//创建文件目录
+ (BOOL)creatDir:(NSString*)dirPath {
    if ([[NSFileManager defaultManager] fileExistsAtPath:dirPath]) {//判断dirPath路径文件夹是否已存在，此处dirPath为需要新建的文件夹的绝对路径
        return NO;
    } else {
        [[NSFileManager defaultManager] createDirectoryAtPath:dirPath withIntermediateDirectories:YES attributes:nil error:nil];//创建文件夹
        return YES;
    }
}

//删除文件目录
+ (BOOL)deleteDir:(NSString*)dirPath {
    if([[NSFileManager defaultManager] fileExistsAtPath:dirPath]) {//如果存在临时文件的配置文件
        NSError *error=nil;
        return [[NSFileManager defaultManager]  removeItemAtPath:dirPath error:&error];
        
    }
    
    return  NO;
}

//移动文件夹
+ (BOOL)moveDir:(NSString*)srcPath to:(NSString*)desPath {
    NSError *error=nil;
    if([[NSFileManager defaultManager] moveItemAtPath:srcPath toPath:desPath error:&error]!=YES) {// prePath 为原路径、     cenPath 为目标路径
        NSLog(@"移动文件失败");
        return NO;
    } else {
        NSLog(@"移动文件成功");
        return YES;
    }
}

//创建文件
+ (BOOL)creatFile:(NSString*)filePath withData:(NSData*)data {
    return  [[NSFileManager defaultManager] createFileAtPath:filePath contents:data attributes:nil];
}

//读取文件
+ (NSData*)readFile:(NSString *)filePath {
    return [NSData dataWithContentsOfFile:filePath options:0 error:NULL];
}

//删除文件
+ (BOOL)deleteFile:(NSString *)filePath {
    
    return [self deleteDir:filePath];
    
}

+ (NSString *)getFilePath:(NSString *)fileName {
    NSString *dirPath = [[self getDocumentPath] stringByAppendingPathComponent:fileName];
    return dirPath;
}


+ (BOOL)writeDataToFile:(NSString*)fileName data:(NSData*)data {
    NSString *filePath=[self getFilePath:fileName];
    return [self creatFile:filePath withData:data];
}

+ (NSData*)readDataFromFile:(NSString*)fileName {
    NSString *filePath=[self getFilePath:fileName];
    return [self readFile:filePath];
}

+ (void)writeLocalCacheData:(NSData *)data withKey:(NSString *)key {
    // 设置存储路径
    NSString *cachesPath = [[self getCachesDirectory]stringByAppendingPathComponent:key];
    // 判读缓存数据是否存在
    if ([[NSFileManager defaultManager] fileExistsAtPath:cachesPath]) {
        // 删除旧的缓存数据
        [[NSFileManager defaultManager] removeItemAtPath:cachesPath error:nil];
    }
    // 存储新的缓存数据
    [data writeToFile:cachesPath atomically:YES];
}

// 读缓存
+ (NSData *)readLocalCacheDataWithKey:(NSString *)key {
    NSString *cachesPath = [[self getCachesDirectory]stringByAppendingPathComponent:key];
    // 判读缓存数据是否存在
    if ([[NSFileManager defaultManager] fileExistsAtPath:cachesPath]) {
        // 读取缓存数据
        return [NSData dataWithContentsOfFile:cachesPath];
    }
    return nil;
}

@end
