//
//  AppChache.h
//  iOSApp
//
//  Created by 耿荣林 on 2018/8/29.
//  Copyright © 2018年 耿荣林. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppChache : NSObject
+ (NSString *)getTempPath;
//返回缓存根目录 "caches"
+ (NSString *)getCachesDirectory;

//返回根目录路径 "document"
+ (NSString *)getDocumentPath;

//创建文件夹
+ (BOOL)creatDir:(NSString*)dirPath;

//删除文件夹
+ (BOOL)deleteDir:(NSString*)dirPath;

//移动文件夹
+ (BOOL)moveDir:(NSString*)srcPath to:(NSString*)desPath;

//创建文件
+ (BOOL)creatFile:(NSString*)filePath withData:(NSData*)data;

//读取文件
+ (NSData*)readFile:(NSString *)filePath;

//删除文件
+ (BOOL)deleteFile:(NSString *)filePath;

//返回 文件全路径
+ (NSString*)getFilePath:(NSString*) fileName;

//在对应文件保存数据
+ (BOOL)writeDataToFile:(NSString*)fileName data:(NSData*)data;

//从对应的文件读取数据
+ (NSData*)readDataFromFile:(NSString*)fileName;
+ (void)writeLocalCacheData:(NSData *)data withKey:(NSString *)key;
+ (NSData *)readLocalCacheDataWithKey:(NSString *)key;
@end
