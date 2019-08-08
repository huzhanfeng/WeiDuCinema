//
//  RLAppDelegateProtocol.h
//  MyThrid
//
//  Created by 耿荣林 on 2019/1/2.
//  Copyright © 2019年 耿荣林. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol RLAppDelegateProtocol <NSObject>
@required
//配置根视图
- (void)configRootViewController;

@optional
//配置网络监测环境
- (void)configNetStatusMoniterEnvironment;
//配置分享环境
- (void)configShareEnvironment;
//配置推送环境
- (void)configPushEnvironment;
//配置定位服务环境
- (void)configLocationServiceEnvironment;
//配置地图环境
- (void)configMapEnvironment;
//配置支付环境
- (void)configPayEnvironment;

@end

NS_ASSUME_NONNULL_END
