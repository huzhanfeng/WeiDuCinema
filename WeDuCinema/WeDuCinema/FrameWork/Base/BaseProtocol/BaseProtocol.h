//
//  BaseProtocol.h
//  MyThrid
//
//  Created by 耿荣林 on 2019/1/2.
//  Copyright © 2019年 耿荣林. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol BaseProtocol <NSObject>
#pragma mark 初始化数据
//1.0 初始化数据
- (void)initializeData;

#pragma mark 布局UI
//2.1 布局控件
- (void)configUI;
//2.2 刷新控件
- (void)refreshUI;

@end

NS_ASSUME_NONNULL_END
