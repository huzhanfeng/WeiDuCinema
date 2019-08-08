//
//  AppCheckOut.m
//  iOSApp
//
//  Created by 耿荣林 on 2018/8/29.
//  Copyright © 2018年 耿荣林. All rights reserved.
//

#import "AppCheckOut.h"

@implementation AppCheckOut
+ (BOOL)checkVerCode:(NSString *)str {
    NSString *emailRegex = @"^\\d{6}$";
    NSPredicate *emailTest=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",emailRegex];
    return [emailTest evaluateWithObject:str];
}
// 邮箱
+ (BOOL)checkEmail:(NSString *)str {
    //NSString *Regex=@"[A-Z0-9a-z._%+-]+@[A-Z0-9a-z._]+\\.[A-Za-z]{2,4}";
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",emailRegex];
    return [emailTest evaluateWithObject:str];
}

//身份证号
+ (BOOL)checkIdentityCard:(NSString *)identityCard {
    BOOL flag;
    if (identityCard.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:identityCard];
}

//车牌号验证
+ (BOOL)checkCarNo:(NSString *)carNo {
    NSString *carRegex = @"^[\u4e00-\u9fa5]{1}[a-zA-Z]{1}[a-zA-Z_0-9]{4}[a-zA-Z_0-9_\u4e00-\u9fa5]$";
    NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",carRegex];
    NSLog(@"carTest is %@",carTest);
    return [carTest evaluateWithObject:carNo];
}

//手机号码验证
+ (BOOL)checkMobile:(NSString *)mobile {
    NSString *phoneRegex = @"^1[3|4|5|7|8][0-9]\\d{8}$";//@"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}

//电话号码验证
+ (BOOL)checkTelephone:(NSString *)telephone {
    NSString *telephoneRegex = @"^(\\d{3,4}-)\\d{7,8}$";
    NSPredicate *telephoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",telephoneRegex];
    return [telephoneTest evaluateWithObject:telephone];
}

//qq号码验证
+ (BOOL)checkQQNumber:(NSString *)qq {
    NSString *qqRegex = @"^[1-9][0-9]\{4,\\}$";
    NSPredicate *qqTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",qqRegex];
    return [qqTest evaluateWithObject:qq];
}

//电话号码验证
+ (BOOL)checkPostCode:(NSString *)postCode {
    NSString *postCodeRegex = @"[1-9]\\d{5}(?!\\d)";
    NSPredicate *postCodeTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",postCodeRegex];
    return [postCodeTest evaluateWithObject:postCode];
}
// 密码验证
+ (BOOL)checkPassword:(NSString *)password {
    NSString *passWordRegex = @"^[a-zA-Z0-9]{6,20}+$"; // 6-20位数字和字符任意组合，不限制全数字或者字符
    //    NSString *passWordRegex = @"^^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}$"; // 6-16位数字和字符组合
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
    return [passWordPredicate evaluateWithObject:password];
}
// 验证码验证
+ (BOOL)checkSecurityCode:(NSString *)code {
    NSString *securityCodeRegex = @"^[0-9]{4,6}+$";
    NSPredicate *securityCodePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",securityCodeRegex];
    return [securityCodePredicate evaluateWithObject:code];
}
// 银行卡校验规则(Luhn算法)  检验数字算法（Luhn Check Digit Algorithm），也被称作“模10算法”，是一种简单的算法，用于验证银行卡、信用卡号码的有效性的算法
+ (BOOL)checkBankCard:(NSString *)card {
    if (card.length < 10) {
        return NO;
    }
    int oddsum = 0;     //奇数求和
    int evensum = 0;    //偶数求和
    int allsum = 0;
    int cardNoLength = (int)[card length];
    int lastNum = [[card substringFromIndex:cardNoLength-1] intValue];
    
    card = [card substringToIndex:cardNoLength - 1];
    for (int i = cardNoLength -1 ; i>=1;i--) {
        NSString *tmpString = [card substringWithRange:NSMakeRange(i-1, 1)];
        int tmpVal = [tmpString intValue];
        if (cardNoLength % 2 ==1 ) {
            if((i % 2) == 0){
                tmpVal *= 2;
                if(tmpVal>=10)
                    tmpVal -= 9;
                evensum += tmpVal;
            }else{
                oddsum += tmpVal;
            }
        }else{
            if((i % 2) == 1){
                tmpVal *= 2;
                if(tmpVal>=10)
                    tmpVal -= 9;
                evensum += tmpVal;
            }else{
                oddsum += tmpVal;
            }
        }
    }
    
    allsum = oddsum + evensum;
    allsum += lastNum;
    if((allsum % 10) == 0)
        return YES;
    else
        return NO;
}

+ (BOOL)checkValidChinese:(NSString *)chinese {
    NSString *regex = @"^[\u4e00-\u9fa5]+$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [predicate evaluateWithObject:chinese];
}

+ (BOOL)checkValidUrl:(NSString *)url {
    NSString *regex = @"^((http)|(https))+:[^\\s]+\\.[^\\s]*$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [predicate evaluateWithObject:url];
    
}

+ (BOOL)checkTaxNo:(NSString *)taxNo {
    NSString *regex = @"[0-9]\\d{13}([0-9]|X)$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [predicate evaluateWithObject:taxNo];
}

+ (BOOL)checkTaxNoValidIP:(NSString *)Ip {
    NSString *regex = [NSString stringWithFormat:@"^(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})$"];
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    BOOL rc = [pre evaluateWithObject:Ip];
    
    if (rc) {
        NSArray *componds = [Ip componentsSeparatedByString:@","];
        
        BOOL v = YES;
        for (NSString *s in componds) {
            if (s.integerValue > 255) {
                v = NO;
                break;
            }
        }
        
        return v;
    }
    
    return NO;
}
@end
