//
//  AppNetworkHelper.h
//  iOSApp
//
//  Created by 耿荣林 on 2018/8/29.
//  Copyright © 2018年 耿荣林. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppNetworkHelper : NSObject
+ (void)startMonitorNetwork;
+ (void)stopMonitorNetwork;
+ (BOOL)warnningNotReachable;
@end