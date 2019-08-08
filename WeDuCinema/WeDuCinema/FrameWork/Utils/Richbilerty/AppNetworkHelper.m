//
//  AppNetworkHelper.m
//  iOSApp
//
//  Created by 耿荣林 on 2018/8/29.
//  Copyright © 2018年 耿荣林. All rights reserved.
//

#import "AppNetworkHelper.h"
#import "AFNetworking.h"
#import "SVProgressHUD.h"


@implementation AppNetworkHelper
+ (void)startMonitorNetwork {
    AFNetworkReachabilityManager *mgr = [AFNetworkReachabilityManager sharedManager];
    [mgr setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        // 当网络状态发生改变的时候调用这个block
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWiFi:
                // [self alertSomething:@"当前网络已经切换至wifi环境"];
                //                [SVProgressHUD showImage:[UIImage imageNamed:@""] status:@"恭喜，您已成功切换至wifi环境"];
                //                [SVProgressHUD dismissWithDelay:1.5];
                break;
                
            case AFNetworkReachabilityStatusReachableViaWWAN:
                //                [SVProgressHUD showImage:[UIImage imageNamed:@""] status:@"注意，当前网络是移动蜂窝环境"];
                //                [SVProgressHUD dismissWithDelay:1.5];
                
                break;
                
            case AFNetworkReachabilityStatusNotReachable:
                //                [SVProgressHUD showImage:[UIImage imageNamed:@""] status:@"注意，当前网络环境不可用"];
                //                [SVProgressHUD dismissWithDelay:1.5];
                break;
                
            case AFNetworkReachabilityStatusUnknown:
                //                [SVProgressHUD showImage:[UIImage imageNamed:@""] status:@"注意，当前网络环境不可用"];
                //                [SVProgressHUD dismissWithDelay:1.5];
                break;
            default:
                break;
        }
    }];
    // 开始监控
    [mgr startMonitoring];
}

+ (void)stopMonitorNetwork {
    [[AFNetworkReachabilityManager sharedManager] stopMonitoring];
}

+ (BOOL)warnningNotReachable {
    if ([[AFNetworkReachabilityManager sharedManager] isReachable]) return NO;
    [SVProgressHUD showImage:[UIImage imageNamed:@""] status:@"当前网络环境不可用"];
    [SVProgressHUD dismissWithDelay:1.5];
    return YES;
}

@end
