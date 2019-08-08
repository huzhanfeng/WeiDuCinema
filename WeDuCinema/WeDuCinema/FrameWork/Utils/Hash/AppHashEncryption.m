//
//  AppHashEncryption.m
//  iOSApp
//
//  Created by 耿荣林 on 2018/8/29.
//  Copyright © 2018年 耿荣林. All rights reserved.
//

#import "AppHashEncryption.h"
#import "CommonCrypto/CommonDigest.h"
#import <CommonCrypto/CommonCrypto.h>
#define Salt @"phb"

@implementation AppHashEncryption
+ (NSString *)md5StrWithStr:(NSString *)str {
    NSString *strSalt = [NSString stringWithFormat:@"%@%@",Salt,str];
    const char *cStr = [strSalt UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    return [self stringFromBytes:result length:CC_MD5_DIGEST_LENGTH];
}

+ (NSString *)md5LowercaseStringWithString:(NSString *)inPutText {
    return [[self md5StrWithStr:inPutText] lowercaseString];
}
+ (NSString *)md5UppercaseStringWithString:(NSString *)inPutText {
    return [[self md5StrWithStr:inPutText] uppercaseString];
}
+ (NSString *)md5_16_LowercaseStringWithString:(NSString *)inPutText {
    NSString *str32 = [self md5LowercaseStringWithString:inPutText];
    NSRange range = NSMakeRange(8, 16);
    return [str32 substringWithRange:range];
}
+ (NSString *)md5_16_UppercaseStringWithString:(NSString *)inPutText {
    NSString *str32 = [self md5UppercaseStringWithString:inPutText];
    NSRange range = NSMakeRange(8, 16);
    return [str32 substringWithRange:range];
}
#pragma mark - sha加密算法
+ (NSString *)sha1StringWithString:(NSString *)inPutText {
    const char *str = inPutText.UTF8String;
    unsigned char buffer[CC_SHA1_DIGEST_LENGTH];
    
    CC_SHA1(str, (CC_LONG)strlen(str), buffer);
    
    return [self stringFromBytes:buffer length:CC_SHA1_DIGEST_LENGTH];
}
+ (NSString *)sha256StringWithString:(NSString *)inPutText {
    const char *str = inPutText.UTF8String;
    unsigned char buffer[CC_SHA256_DIGEST_LENGTH];
    
    CC_SHA256(str, (CC_LONG)strlen(str), buffer);
    
    return [self stringFromBytes:buffer length:CC_SHA256_DIGEST_LENGTH];
}
+ (NSString *)sha512StringWithString:(NSString *)inPutText {
    const char *str = inPutText.UTF8String;
    unsigned char buffer[CC_SHA512_DIGEST_LENGTH];
    
    CC_SHA512(str, (CC_LONG)strlen(str), buffer);
    
    return [self stringFromBytes:buffer length:CC_SHA512_DIGEST_LENGTH];
}
#pragma mark - HMAC 加密算法
+ (NSString *)hmacMD5StringWithString:(NSString *)inPutText withKey:(NSString *)key {
    const char *keyData = key.UTF8String;
    const char *strData = inPutText.UTF8String;
    unsigned char buffer[CC_MD5_DIGEST_LENGTH];
    
    CCHmac(kCCHmacAlgMD5, keyData, strlen(keyData), strData, strlen(strData), buffer);
    
    return [self stringFromBytes:buffer length:CC_MD5_DIGEST_LENGTH];
}
+ (NSString *)hmacSHA1StringWithString:(NSString *)inPutText withKey:(NSString *)key {
    const char *keyData = key.UTF8String;
    const char *strData = inPutText.UTF8String;
    unsigned char buffer[CC_SHA1_DIGEST_LENGTH];
    
    CCHmac(kCCHmacAlgSHA1, keyData, strlen(keyData), strData, strlen(strData), buffer);
    
    return [self stringFromBytes:buffer length:CC_SHA1_DIGEST_LENGTH];
}
+ (NSString *)hmacSHA256StringWithString:(NSString *)inPutText withKey:(NSString *)key {
    const char *keyData = key.UTF8String;
    const char *strData = inPutText.UTF8String;
    unsigned char buffer[CC_SHA256_DIGEST_LENGTH];
    
    CCHmac(kCCHmacAlgSHA256, keyData, strlen(keyData), strData, strlen(strData), buffer);
    
    return [self stringFromBytes:buffer length:CC_SHA256_DIGEST_LENGTH];
    
}
+ (NSString *)hmacSHA512StringWithString:(NSString *)inPutText withKey:(NSString *)key {
    const char *keyData = key.UTF8String;
    const char *strData = inPutText.UTF8String;
    unsigned char buffer[CC_SHA512_DIGEST_LENGTH];
    
    CCHmac(kCCHmacAlgSHA512, keyData, strlen(keyData), strData, strlen(strData), buffer);
    return [self stringFromBytes:buffer length:CC_SHA512_DIGEST_LENGTH];
}

#pragma mark - 文件散列函数
#define FileHashDefaultChunkSizeForReadingData 4096

+ (NSString *)fileMD5HashWithFilePath:(NSString *)filePath {
    NSFileHandle *fp = [NSFileHandle fileHandleForReadingAtPath:filePath];
    if (fp == nil) {
        return nil;
    }
    
    CC_MD5_CTX hashCtx;
    CC_MD5_Init(&hashCtx);
    
    while (YES) {
        @autoreleasepool {
            NSData *data = [fp readDataOfLength:FileHashDefaultChunkSizeForReadingData];
            
            CC_MD5_Update(&hashCtx, data.bytes, (CC_LONG)data.length);
            
            if (data.length == 0) {
                break;
            }
        }
    }
    [fp closeFile];
    
    unsigned char buffer[CC_MD5_DIGEST_LENGTH];
    CC_MD5_Final(buffer, &hashCtx);
    
    return [self stringFromBytes:buffer length:CC_MD5_DIGEST_LENGTH];
}
+ (NSString *)fileSHA1HashWithFilePath:(NSString *)filePath {
    NSFileHandle *fp = [NSFileHandle fileHandleForReadingAtPath:filePath];
    if (fp == nil) {
        return nil;
    }
    
    CC_SHA1_CTX hashCtx;
    CC_SHA1_Init(&hashCtx);
    
    while (YES) {
        @autoreleasepool {
            NSData *data = [fp readDataOfLength:FileHashDefaultChunkSizeForReadingData];
            
            CC_SHA1_Update(&hashCtx, data.bytes, (CC_LONG)data.length);
            
            if (data.length == 0) {
                break;
            }
        }
    }
    [fp closeFile];
    
    unsigned char buffer[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1_Final(buffer, &hashCtx);
    
    return [self stringFromBytes:buffer length:CC_SHA1_DIGEST_LENGTH];
}
+ (NSString *)fileSHA256HashWithFilePath:(NSString *)filePath {
    NSFileHandle *fp = [NSFileHandle fileHandleForReadingAtPath:filePath];
    if (fp == nil) {
        return nil;
    }
    
    CC_SHA256_CTX hashCtx;
    CC_SHA256_Init(&hashCtx);
    
    while (YES) {
        @autoreleasepool {
            NSData *data = [fp readDataOfLength:FileHashDefaultChunkSizeForReadingData];
            
            CC_SHA256_Update(&hashCtx, data.bytes, (CC_LONG)data.length);
            
            if (data.length == 0) {
                break;
            }
        }
    }
    [fp closeFile];
    
    unsigned char buffer[CC_SHA256_DIGEST_LENGTH];
    CC_SHA256_Final(buffer, &hashCtx);
    
    return [self stringFromBytes:buffer length:CC_SHA256_DIGEST_LENGTH];
}
+ (NSString *)fileSHA512HashWithFilePath:(NSString *)filePath {
    NSFileHandle *fp = [NSFileHandle fileHandleForReadingAtPath:filePath];
    if (fp == nil) {
        return nil;
    }
    
    CC_SHA512_CTX hashCtx;
    CC_SHA512_Init(&hashCtx);
    
    while (YES) {
        @autoreleasepool {
            NSData *data = [fp readDataOfLength:FileHashDefaultChunkSizeForReadingData];
            
            CC_SHA512_Update(&hashCtx, data.bytes, (CC_LONG)data.length);
            
            if (data.length == 0) {
                break;
            }
        }
    }
    [fp closeFile];
    
    unsigned char buffer[CC_SHA512_DIGEST_LENGTH];
    CC_SHA512_Final(buffer, &hashCtx);
    
    return [self stringFromBytes:buffer length:CC_SHA512_DIGEST_LENGTH];
}
#pragma mark - 助手方法
/**
 *  返回二进制 Bytes 流的字符串表示形式
 *
 *  @param bytes  二进制 Bytes 数组
 *  @param length 数组长度
 *
 *  @return 字符串表示形式
 */
+ (NSString *)stringFromBytes:(unsigned char *)bytes length:(int)length {
    NSMutableString *strM = [NSMutableString string];
    for (int i = 0; i < length; i++) {
        [strM appendFormat:@"%02x", bytes[i]];
    }
    return [strM copy];
}
@end
