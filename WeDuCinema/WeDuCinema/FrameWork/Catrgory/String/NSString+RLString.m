//
//  NSString+RLString.m
//  MyThrid
//
//  Created by 耿荣林 on 2018/12/20.
//  Copyright © 2018年 耿荣林. All rights reserved.
//

#import "NSString+RLString.h"

@implementation NSString (RLString)
- (NSString*)reverseWordsInString:(NSString*)oldStr{
    NSMutableString *newStr = [NSMutableString string];
    for (int i = (int)oldStr.length - 1; i >= 0; i--) {
        unichar character = [oldStr characterAtIndex:i];
        [newStr appendFormat:@"%c",character];
    }
    return newStr;
}

- (NSString *)timeWithTimeIntervalString:(NSString *)timeString
{
    // 格式化时间
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    // 毫秒值转化为秒
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timeString doubleValue]/ 1000.0];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
}

- (NSString *)updateTimeForRow:(NSString *)createTimeString {
    NSTimeInterval currentTime = [[NSDate date] timeIntervalSince1970];
    NSTimeInterval createTime = [createTimeString longLongValue]/1000;
    NSTimeInterval time = currentTime - createTime;
    NSInteger sec = time/60;
    if (sec<60) {
        return [NSString stringWithFormat:@"%ld分钟前",sec];
    }
    // 秒转小时
    NSInteger hours = time/3600;
    if (hours<24) {
        return [NSString stringWithFormat:@"%ld小时前",hours];
    }
    //秒转天数
    NSInteger days = time/3600/24;
    if (days < 30) {
        return [NSString stringWithFormat:@"%ld天前",days];
    }
    //秒转月
    NSInteger months = time/3600/24/30;
    if (months < 12) {
        return [NSString stringWithFormat:@"%ld月前",months];
    }
    //秒转年
    NSInteger years = time/3600/24/30/12;
    return [NSString stringWithFormat:@"%ld年前",years];
}

/**判断字符串是否为空*/
+(BOOL)isEmptyOrNull:(NSString *)str
{
    if (!str || [str isKindOfClass:[NSNull class]])
    {
        // null object
        return true;
    } else {
        NSString *trimedString = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        if ([trimedString length] == 0) {
            
            // empty string
            return true;
        }
        else{
            // is neither empty nor null
            return false;
        }
    }
}

/**去掉空格*/
+ (NSString *)deleteBlank:(NSString *)string
{
    NSString *newString= [string stringByReplacingOccurrencesOfString:@" " withString:@""];
    return newString;
}

/**去掉空格及空行*/
+ (NSString *)deleteBlankAndEnter:(NSString *)string
{
    NSString *newString= [string stringByReplacingOccurrencesOfString:@" " withString:@""];
    newString= [newString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    return newString;
}


@end
