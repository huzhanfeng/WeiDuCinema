//
//  UserDefualtUtils.h
//  iOSApp
//
//  Created by 耿荣林 on 2018/8/29.
//  Copyright © 2018年 耿荣林. All rights reserved.
//

#import <Foundation/Foundation.h>
#define UserID                              @"userId"
#define UserMobile                          @"mobile"
#define UserCertType                        @"certType"
#define UserCertNo                          @"certNo"
#define UserAccountStatus                   @"accountStatus"
#define UserRealAuthStatus                  @"realAuthStatus"

#define UserRealName                        @"realName"
#define UserNickName                        @"nickName"
#define UserProdName                        @"prodName" //省
#define UserProdCode                        @"prodCode" //编码
#define UserCityName                        @"cityName"
#define UserCityCode                        @"cityCode"
#define UserSex                             @"sex"


#define UserSignature                       @"signature"
#define UserLogoUrl                         @"logoUrl"
#define UserCreateTime                      @"createTime"
#define UserUpdateTime                      @"updateTime"
#define UserToken                           @"sign"
#define UserDid                             @"did"//
#define UserLat                             @"lat"//
#define UserLon                             @"lon"//
#define PoiLat                              @"poiLat"
#define PoiLon                              @"poiLon"
#define UserLocalCity                       @"localCity"//
#define OilCityName                         @"oilCityName"//
#define OilCityCode                         @"oilCityCode"//

#define UserTradePWD                        @"user_trade_pwd"
#define UserMemberLevel                     @"user_member_level"
// 标记消息读取时间（小红点处理）
#define UserMsgTime                        @"UserMsgTime"


@interface UserDefualtUtils : NSObject
+(void)saveValue:(id) value forKey:(NSString *)key;

+(id)valueForKey:(NSString *)key;

+(id)StringForKey:(NSString *)key;

+(void)saveBoolValue:(BOOL)value forKey:(NSString *)key;

+(BOOL)boolValueForKey:(NSString *)key;

+(void)printAllUserDefault;


//
+ (NSString *)userId;
+ (NSString *)userMobile;
+ (NSString *)userCertType;
+ (NSString *)userCertNo;
+ (NSString *)userAccountStatus;
+ (NSString *)userRealAuthStatus;
+ (NSString *)userRealName;
+ (NSString *)userNickName;
+ (NSString *)userProdName;
+ (NSString *)userProdCode;
+ (NSString *)userCityName;
+ (NSString *)userCityCode;
+ (NSString *)userSex;
+ (NSString *)userSignature;
+ (NSString *)userLogoUrl;
+ (NSString *)userCreateTime;
+ (NSString *)userUpdateTime;
+ (NSString *)userToken;//登录请求的token
+ (NSString *)userDid;
// 定位相关的信息
+ (NSString *)userLat;
+ (NSString *)userLon;
+ (NSString *)poiLat;
+ (NSString *)poiLon;

+ (NSString *)userLocolCityName;
+ (NSString *)oilCityName;
+ (NSString *)oilCityCode;

+ (NSString *)userTradePWD;
+ (NSString *)userMsgTime;
+ (NSString *)userMemberLevel;
/////////////////////////////////////////////////////////////////////////////////////////////////////
+ (void)userDefaultsSaved;
+ (BOOL)isLogin;
+ (BOOL)logout;
/////////////////////////////////////////////////////////////////////////////////////////////////////

+ (BOOL)userSetId:(NSString *)Id;
+ (BOOL)userSetMobile:(NSString *)mobile;
+ (BOOL)userSetCertType:(NSString *)cetType;
+ (BOOL)userSetCertNo:(NSString *)certNo;
+ (BOOL)userSetAccountStatus:(NSString *)accountSt;
+ (BOOL)userSetRealAuthStatus:(NSString *)realAuthSt;
+ (BOOL)userSetRealName:(NSString *)realName;
+ (BOOL)userSetNickName:(NSString *)nickName;
+ (BOOL)userSetProdName:(NSString *)prodName;
+ (BOOL)userSetProdCode:(NSString *)prodCode;
+ (BOOL)userSetCityName:(NSString *)cityName;
+ (BOOL)userSetCityCode:(NSString *)cityCode;
+ (BOOL)userSetSex:(NSString *)sex;
+ (BOOL)userSetSignature:(NSString *)signature;
+ (BOOL)userSetLogoUrl:(NSString *)logoUrl;
+ (BOOL)userSetCreateTime:(NSString *)createT;
+ (BOOL)userSetUpdateTime:(NSString *)updateT;
+ (BOOL)userSetToken:(NSString *)token;//登录请求的token
+ (BOOL)userSetDid:(NSString *)did;
+ (BOOL)userSetMemberLevel:(NSString *)memberLevel;
// 定位相关的信息
+ (BOOL)userSetLat:(NSString *)lat;
+ (BOOL)userSetLon:(NSString *)lon;
+ (BOOL)setPoiLat:(NSString *)lat;
+ (BOOL)setPoiLon:(NSString *)lon;
+ (BOOL)userSetLocolCityName:(NSString *)cityName;
+ (BOOL)setOilCityName:(NSString *)cityName;
+ (BOOL)setOilCityCode:(NSString *)cityCode;
+ (BOOL)setUserTradePWD:(NSString *)tradePwd;
+ (BOOL)setUserMsgTime:(NSString *)userMsgTime;


@end
