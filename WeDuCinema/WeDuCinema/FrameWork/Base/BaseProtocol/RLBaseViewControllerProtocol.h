
//
//  RLBaseViewControllerProtocol.h
//  MyThrid
//
//  Created by 耿荣林 on 2019/1/2.
//  Copyright © 2019年 耿荣林. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol RLBaseViewControllerProtocol <NSObject>
@optional

#pragma mark 布局UI
//2.1 布局Title
- (void)configTitle;
//2.2 布局leftItems
- (void)configLeftItems;
//2.3 布局rightItems
- (void)configRightItems;

#pragma mark 网络请求
//3.1 网络请求
- (void)networkRequest;
//3.2 刷新网络请求
- (void)refreshRequest;
@end

NS_ASSUME_NONNULL_END
