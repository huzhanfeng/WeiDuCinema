//
//  NSString+RLString.h
//  MyThrid
//
//  Created by 耿荣林 on 2018/12/20.
//  Copyright © 2018年 耿荣林. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (RLString)

/**
 字符串逆序

 @param oldStr 旧字符串
 @return 新字符串
 */
- (NSString*)reverseWordsInString:(NSString*)oldStr;

/**
 时间戳转化日期字符串

 @param timeString 时间戳
 @return 日期字符串
 */
- (NSString *)timeWithTimeIntervalString:(NSString *)timeString;

/**
 时间戳转与当前时间间隔

 @param createTimeString 时间戳
 @return 与当前时间间隔
 */
- (NSString *)updateTimeForRow:(NSString *)createTimeString;

/*判断字符串是否为空*/
+(BOOL)isEmptyOrNull:(NSString *)str;

/**去掉空格*/
+ (NSString *)deleteBlank:(NSString *)string;

/**去掉回车和空格*/
+ (NSString *)deleteBlankAndEnter:(NSString *)string;
@end

NS_ASSUME_NONNULL_END
