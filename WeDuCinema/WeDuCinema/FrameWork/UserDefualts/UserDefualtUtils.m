//
//  UserDefualtUtils.m
//  iOSApp
//
//  Created by 耿荣林 on 2018/8/29.
//  Copyright © 2018年 耿荣林. All rights reserved.
//

#import "UserDefualtUtils.h"

@implementation UserDefualtUtils
+ (void)saveValue:(id) value forKey:(NSString *)key{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:value forKey:key];
    [userDefaults synchronize];
}

+ (id)valueForKey:(NSString *)key{
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults objectForKey:key];
}

+(id)StringForKey:(NSString *)key{
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults stringForKey:key];
}


+(BOOL)boolValueForKey:(NSString *)key{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults boolForKey:key];
}

+(void)saveBoolValue:(BOOL)value forKey:(NSString *)key{
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setBool:value forKey:key];
    [userDefaults synchronize];
}

+(void)printAllUserDefault{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *dic = [userDefaults dictionaryRepresentation];
    NSLog(@"%@",dic);
}

//
+ (NSString *)userId {
    return [[NSUserDefaults standardUserDefaults] objectForKey:UserID];
}
+ (NSString *)userMobile {
    return [[NSUserDefaults standardUserDefaults] objectForKey:UserMobile];
}

+ (NSString *)userCertType {
    return [[NSUserDefaults standardUserDefaults] objectForKey:UserCertType];
}
+ (NSString *)userCertNo {
    return [[NSUserDefaults standardUserDefaults] objectForKey:UserCertNo];
}
+ (NSString *)userAccountStatus {
    return [[NSUserDefaults standardUserDefaults] objectForKey:UserAccountStatus];
}
+ (NSString *)userRealAuthStatus {
    return [[NSUserDefaults standardUserDefaults] objectForKey:UserRealAuthStatus];
}
+ (NSString *)userRealName {
    return [[NSUserDefaults standardUserDefaults] objectForKey:UserRealName];
}
+ (NSString *)userNickName {
    return [[NSUserDefaults standardUserDefaults] objectForKey:UserNickName];
}
+ (NSString *)userProdName {
    return [[NSUserDefaults standardUserDefaults] objectForKey:UserProdName];
}
+ (NSString *)userProdCode {
    return [[NSUserDefaults standardUserDefaults] objectForKey:UserProdCode];
}
+ (NSString *)userCityName {
    return [[NSUserDefaults standardUserDefaults] objectForKey:UserCityName];
}
+ (NSString *)userCityCode {
    return [[NSUserDefaults standardUserDefaults] objectForKey:UserCityCode];
}
+ (NSString *)userSex {
    return [[NSUserDefaults standardUserDefaults] objectForKey:UserSex];
}

+ (NSString *)userSignature {
    return [[NSUserDefaults standardUserDefaults] objectForKey:UserSignature];
}

+ (NSString *)userLogoUrl {
    return [[NSUserDefaults standardUserDefaults] objectForKey:UserLogoUrl];
}

+ (NSString *)userCreateTime {
    return [[NSUserDefaults standardUserDefaults] objectForKey:UserCreateTime];
}
+ (NSString *)userUpdateTime {
    return [[NSUserDefaults standardUserDefaults] objectForKey:UserUpdateTime];
}

+ (NSString *)userToken {
    return [[NSUserDefaults standardUserDefaults] objectForKey:UserToken];
}

+ (NSString *)userDid {
    return [[NSUserDefaults standardUserDefaults] objectForKey:UserDid];
}
+ (NSString *)userLat {
    return [[NSUserDefaults standardUserDefaults] objectForKey:UserLat];
}
+ (NSString *)userLon {
    return [[NSUserDefaults standardUserDefaults] objectForKey:UserLon];
}
+ (NSString *)poiLat {
    return [[NSUserDefaults standardUserDefaults] objectForKey:PoiLat];
}
+ (NSString *)poiLon {
    return [[NSUserDefaults standardUserDefaults] objectForKey:PoiLon];
}
+ (NSString *)userLocolCityName {
    return [[NSUserDefaults standardUserDefaults] objectForKey:UserLocalCity];
}
+ (NSString *)userTradePWD {
    return [[NSUserDefaults standardUserDefaults] objectForKey:UserTradePWD];
}

+ (NSString *)userMsgTime {
    return [[NSUserDefaults standardUserDefaults] objectForKey:UserMsgTime];
}
+ (NSString *)oilCityCode {
    return [[NSUserDefaults standardUserDefaults] objectForKey:OilCityCode];
}
+ (NSString *)oilCityName {
    return [[NSUserDefaults standardUserDefaults] objectForKey:OilCityName];
}
+ (NSString *)userMemberLevel {
    return [[NSUserDefaults standardUserDefaults] objectForKey:UserMemberLevel];
}

/////////////////////////////////////////////////////////////////////////////////////////////////////
+ (void)userDefaultsSaved {
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (BOOL)isLogin {
    return [self userToken] == nil ? NO:YES;
}

+ (BOOL)logout {
    // 清除数据
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:nil forKey:UserID];
    //    [ud setObject:nil forKey:UserMobile];
    [ud setObject:nil forKey:UserCertType];
    [ud setObject:nil forKey:UserCertNo];
    [ud setObject:nil forKey:UserAccountStatus];
    [ud setObject:nil forKey:UserRealAuthStatus];
    [ud setObject:nil forKey:UserRealName];
    [ud setObject:nil forKey:UserNickName];
    [ud setObject:nil forKey:UserProdCode];
    [ud setObject:nil forKey:UserProdName];
    [ud setObject:nil forKey:UserCityName];
    [ud setObject:nil forKey:UserCityCode]; ///////////
    [ud setObject:nil forKey:UserSex];
    [ud setObject:nil forKey:UserSignature];
    [ud setObject:nil forKey:UserLogoUrl];
    [ud setObject:nil forKey:UserCreateTime];
    [ud setObject:nil forKey:UserUpdateTime];
    [ud setObject:nil forKey:UserToken];
    [ud setObject:nil forKey:UserDid];
    [ud setObject:nil forKey:UserTradePWD];
    [ud setObject:nil forKey:UserMemberLevel];
    BOOL success = [ud synchronize];
    //    [[NSNotificationCenter defaultCenter] postNotificationName:UserDidLogoutNotification object:nil];
    if (success) return YES;
    return NO;
    
}
/////////////////////////////////////////////////////////////////////////////////////////////////////

+ (BOOL)userSetId:(NSString *)Id {
    if ([Id isKindOfClass:[NSNull class]]) return NO;
    if (Id) {
        [[NSUserDefaults standardUserDefaults] setObject:Id forKey:UserID];
        return YES;
    }
    return NO;
}

+ (BOOL)userSetMobile:(NSString *)mobile {
    if ([mobile isKindOfClass:[NSNull class]]) return NO;
    if (mobile) {
        [[NSUserDefaults standardUserDefaults] setObject:mobile forKey:UserMobile];
        return YES;
    }
    return NO;
}

+ (BOOL)userSetCertType:(NSString *)cetType {
    if ([cetType isKindOfClass:[NSNull class]]) return NO;
    if (cetType) {
        [[NSUserDefaults standardUserDefaults] setObject:cetType forKey:UserCertType];
        return YES;
    }
    return NO;
}

+ (BOOL)userSetCertNo:(NSString *)certNo {
    if ([certNo isKindOfClass:[NSNull class]]) return NO;
    if (certNo) {
        [[NSUserDefaults standardUserDefaults] setObject:certNo forKey:UserCertNo];
        return YES;
    }
    return NO;
}

+ (BOOL)userSetRealAuthStatus:(NSString *)realAuthSt {
    if ([realAuthSt isKindOfClass:[NSNull class]]) return NO;
    if (realAuthSt) {
        [[NSUserDefaults standardUserDefaults] setObject:realAuthSt forKey:UserRealAuthStatus];
        return YES;
    }
    return NO;
}
+ (BOOL)userSetAccountStatus:(NSString *)accountSt {
    if ([accountSt isKindOfClass:[NSNull class]]) return NO;
    if (accountSt) {
        [[NSUserDefaults standardUserDefaults] setObject:accountSt forKey:UserAccountStatus];
        return YES;
    }
    return NO;
}
+ (BOOL)userSetRealName:(NSString *)realName {
    if ([realName isKindOfClass:[NSNull class]]) return NO;
    if (realName) {
        [[NSUserDefaults standardUserDefaults] setObject:realName forKey:UserRealName];
        return YES;
    }
    return NO;
}

+ (BOOL)userSetNickName:(NSString *)nickName {
    if ([nickName isKindOfClass:[NSNull class]]) return NO;
    if (nickName) {
        [[NSUserDefaults standardUserDefaults] setObject:nickName forKey:UserNickName];
        return YES;
    }
    return NO;
}

+ (BOOL)userSetProdName:(NSString *)prodName {
    if ([prodName isKindOfClass:[NSNull class]]) return NO;
    if (prodName) {
        [[NSUserDefaults standardUserDefaults] setObject:prodName forKey:UserProdName];
        return YES;
    }
    return NO;
}
+ (BOOL)userSetProdCode:(NSString *)prodCode {
    if ([prodCode isKindOfClass:[NSNull class]]) return NO;
    if (prodCode) {
        [[NSUserDefaults standardUserDefaults] setObject:prodCode forKey:UserProdCode];
        return YES;
    }
    return NO;
}
+ (BOOL)userSetCityName:(NSString *)cityName {
    if ([cityName isKindOfClass:[NSNull class]]) return NO;
    if (cityName) {
        [[NSUserDefaults standardUserDefaults] setObject:cityName forKey:UserCityName];
        return YES;
    }
    return NO;
}
+ (BOOL)userSetCityCode:(NSString *)cityCode {
    if ([cityCode isKindOfClass:[NSNull class]]) return NO;
    if (cityCode) {
        [[NSUserDefaults standardUserDefaults] setObject:cityCode forKey:UserCityCode];
        return YES;
    }
    return NO;
}
+ (BOOL)userSetSex:(NSString *)sex {
    if ([sex isKindOfClass:[NSNull class]]) return NO;
    if (sex) {
        [[NSUserDefaults standardUserDefaults] setObject:sex forKey:UserSex];
        return YES;
    }
    return NO;
}

+ (BOOL)userSetSignature:(NSString *)signature {
    if ([signature isKindOfClass:[NSNull class]]) return NO;
    if (signature) {
        [[NSUserDefaults standardUserDefaults] setObject:signature forKey:UserSignature];
        return YES;
    }
    return NO;
}
+ (BOOL)userSetLogoUrl:(NSString *)logoUrl {
    if ([logoUrl isKindOfClass:[NSNull class]]) return NO;
    if (logoUrl) {
        [[NSUserDefaults standardUserDefaults] setObject:logoUrl forKey:UserLogoUrl];
        return YES;
    }
    return NO;
}

+ (BOOL)userSetCreateTime:(NSString *)createT {
    if ([createT isKindOfClass:[NSNull class]]) return NO;
    if (createT) {
        [[NSUserDefaults standardUserDefaults] setObject:createT forKey:UserCreateTime];
        return YES;
    }
    return NO;
}
+ (BOOL)userSetUpdateTime:(NSString *)updateT {
    if ([updateT isKindOfClass:[NSNull class]]) return NO;
    if (updateT) {
        [[NSUserDefaults standardUserDefaults] setObject:updateT forKey:UserUpdateTime];
        return YES;
    }
    return NO;
}

+ (BOOL)userSetToken:(NSString *)token {
    if ([token isKindOfClass:[NSNull class]]) return NO;
    if (token) {
        [[NSUserDefaults standardUserDefaults] setObject:token forKey:UserToken];
        return YES;
    }
    return NO;
}
+ (BOOL)userSetDid:(NSString *)did {
    if ([did isKindOfClass:[NSNull class]]) return NO;
    if (did) {
        [[NSUserDefaults standardUserDefaults] setObject:did forKey:UserDid];
        return YES;
    }
    return NO;
}

+ (BOOL)userSetLat:(NSString *)lat {
    if ([lat isKindOfClass:[NSNull class]]) return NO;
    if (lat) {
        [[NSUserDefaults standardUserDefaults] setObject:lat forKey:UserLat];
        return YES;
    }
    return NO;
}

+ (BOOL)userSetLon:(NSString *)lon {
    if ([lon isKindOfClass:[NSNull class]]) return NO;
    if (lon) {
        [[NSUserDefaults standardUserDefaults] setObject:lon forKey:UserLon];
        return YES;
    }
    return NO;
}
+ (BOOL)setPoiLat:(NSString *)lat {
    if ([lat isKindOfClass:[NSNull class]]) return NO;
    if (lat) {
        [[NSUserDefaults standardUserDefaults] setObject:lat forKey:PoiLat];
        return YES;
    }
    return NO;
}

+ (BOOL)setPoiLon:(NSString *)lon {
    if ([lon isKindOfClass:[NSNull class]]) return NO;
    if (lon) {
        [[NSUserDefaults standardUserDefaults] setObject:lon forKey:PoiLon];
        return YES;
    }
    return NO;
}

+ (BOOL)userSetLocolCityName:(NSString *)cityName {
    if ([cityName isKindOfClass:[NSNull class]]) return NO;
    if (cityName) {
        [[NSUserDefaults standardUserDefaults] setObject:cityName forKey:UserLocalCity];
        return YES;
    }
    return NO;
}
+ (BOOL)setUserTradePWD:(NSString *)tradePwd {
    if ([tradePwd isKindOfClass:[NSNull class]]) return NO;
    
    [[NSUserDefaults standardUserDefaults] setObject:tradePwd forKey:UserTradePWD];
    return YES;
    return NO;
}

+ (BOOL)setUserMsgTime:(NSString *)userMsgTime {
    if ([userMsgTime isKindOfClass:[NSNull class]]) return NO;
    if (userMsgTime) {
        [[NSUserDefaults standardUserDefaults] setObject:userMsgTime forKey:UserMsgTime];
        return YES;
    }
    return NO;
}

+ (BOOL)setOilCityCode:(NSString *)cityCode {
    if ([cityCode isKindOfClass:[NSNull class]]) return NO;
    if (cityCode) {
        [[NSUserDefaults standardUserDefaults] setObject:cityCode forKey:OilCityCode];
        return YES;
    }
    return NO;
}


+ (BOOL)setOilCityName:(NSString *)cityName {
    if ([cityName isKindOfClass:[NSNull class]]) return NO;
    if (cityName) {
        [[NSUserDefaults standardUserDefaults] setObject:cityName forKey:OilCityName];
        return YES;
    }
    return NO;
}

+ (BOOL)userSetMemberLevel:(NSString *)memberLevel {
    if ([memberLevel isKindOfClass:[NSNull class]]) return NO;
    if (memberLevel) {
        [[NSUserDefaults standardUserDefaults] setObject:memberLevel forKey:UserMemberLevel];
        return YES;
    }
    return NO;
}

@end
