//
//  AppCheckOut.h
//  iOSApp
//
//  Created by 耿荣林 on 2018/8/29.
//  Copyright © 2018年 耿荣林. All rights reserved.
//

#import <Foundation/Foundation.h>
/*!
 @class
 @abstract 正则验证号码合理类
 */

@interface AppCheckOut : NSObject
/*!
 @method
 @abstract 验证四位验证码合理
 */
+ (BOOL)checkVerCode:(NSString *)str;
/*!
 @method
 @abstract 验证email合理
 */
+ (BOOL)checkEmail:(NSString *)str;

/*!
 @method
 @abstract 验证身份证合理
 */
+ (BOOL)checkIdentityCard:(NSString *)identityCard;

/*!
 @method
 @abstract 验证车牌号码合理
 */
+ (BOOL)checkCarNo:(NSString *)carNo;

/*!
 @method
 @abstract 验证手机号码合理
 */
+ (BOOL)checkMobile:(NSString *)mobile;

/*!
 @method
 @abstract 电话号码验证合理
 */
+ (BOOL)checkTelephone:(NSString *)telephone;

/*!
 @method
 @abstract qq号码验证合理
 */
+ (BOOL)checkQQNumber:(NSString *)qq;

/*!
 @method
 @abstract 邮政编码验证合理
 */
+ (BOOL)checkPostCode:(NSString *)postCode;
/*!
 @method
 @abstract 密码验证合理
 */
+ (BOOL)checkPassword:(NSString *)password;
/*!
 @method
 @abstract 验证码验证合理
 */
+ (BOOL)checkSecurityCode:(NSString *)code;

/*!
 @method
 @abstract 银行卡信用卡验证合理
 */
+ (BOOL)checkBankCard:(NSString *)card;

/*!
 @method
 @abstract 纯汉字验证合理
 */
+ (BOOL)checkValidChinese:(NSString *)chinese;

/*!
 @method
 @abstract 网址验证验证合理
 */
+ (BOOL)checkValidUrl:(NSString *)url;

/*!
 @method
 @abstract 工商税号验证合理
 */
+ (BOOL)checkTaxNo:(NSString *)taxNo;


/**
 @brief     是否符合IP格式，xxx.xxx.xxx.xxx
 */
+ (BOOL)checkTaxNoValidIP:(NSString *)Ip;
@end
