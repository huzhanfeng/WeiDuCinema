//
//  ShowAlert.h
//  iOSApp
//
//  Created by 耿荣林 on 2018/9/7.
//  Copyright © 2018年 耿荣林. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^buttomClickType) (NSString *name);
@interface ShowAlert : NSObject
+ (void)showAlterWithMsg:(NSString *)msg withDely:(NSTimeInterval)dely;
+ (void)showAlterWithTitle:(NSString *)title withMessage:(NSString *)message;
+ (void)showAlterWithTitle:(NSString *)title withMessage:(NSString *)message withSureName:(NSString *)okay withCancelName:(NSString *)cancel complate:(buttomClickType)type;

@end
