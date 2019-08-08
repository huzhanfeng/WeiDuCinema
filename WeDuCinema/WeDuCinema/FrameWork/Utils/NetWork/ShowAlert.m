//
//  ShowAlert.m
//  iOSApp
//
//  Created by 耿荣林 on 2018/9/7.
//  Copyright © 2018年 耿荣林. All rights reserved.
//

#import "ShowAlert.h"
#import "SVProgressHUD.h"
#import "SIAlertView.h"

@implementation ShowAlert
/**
 网络提示框
 
 @param msg 提示消息
 @param dely 延时时间
 */
+ (void)showAlterWithMsg:(NSString *)msg withDely:(NSTimeInterval)dely{
    [SVProgressHUD showWithStatus:msg];
    [SVProgressHUD dismissWithDelay:dely];
}
    
/**
 提示框（alert）
 
 @param title title description
 @param message message description
 */
+ (void)showAlterWithTitle:(NSString *)title withMessage:(NSString *)message{
    SIAlertView *alterV = [[SIAlertView alloc]initWithTitle:title andMessage:message];
    [alterV addButtonWithTitle:@"确定" type:SIAlertViewButtonTypeDefault handler:^(SIAlertView *alertView) {
    }];
    alterV.transitionStyle = SIAlertViewTransitionStyleBounce;
    [alterV show];
}

+ (void)showAlterWithTitle:(NSString *)title withMessage:(NSString *)message withSureName:(NSString *)okay withCancelName:(NSString *)cancel complate:(buttomClickType)type{
    SIAlertView *alterV = [[SIAlertView alloc]initWithTitle:title andMessage:message];
    [alterV addButtonWithTitle:okay type:SIAlertViewButtonTypeDefault handler:^(SIAlertView *alertView) {
        type(okay);
    }];
    [alterV addButtonWithTitle:cancel type:SIAlertViewButtonTypeCancel handler:^(SIAlertView *alertView) {
        type(cancel);
    }];
    alterV.transitionStyle = SIAlertViewTransitionStyleBounce;
    [alterV show];
}

@end
