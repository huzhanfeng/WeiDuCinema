//
//  BaseTabbarViewController.h
//  MyThrid
//
//  Created by 耿荣林 on 2019/1/3.
//  Copyright © 2019年 耿荣林. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSUInteger, HRTabBarItemStatus) {
    HRTabBarItemStatusSelected, //选中状态
    HRTabBarItemStatusDefault, //默认状态
};

@interface BaseTabbarViewController : UITabBarController
//初始化（控制器名称数组）
- (instancetype)initWithChildControllerNames:(NSArray<NSString *> *)names;

//标签标题
- (void)itemTitles:(NSArray <NSString *>*)titles;
- (BaseTabbarViewController *(^)(NSArray <NSString *>*titles))setupItemTitles;

//标签标题颜色 [统一]
- (void)itemsTitleColor:(UIColor *)color status:(HRTabBarItemStatus)status;
- (BaseTabbarViewController *(^)(UIColor *))setupItemsTitleDefaultColor;
- (BaseTabbarViewController *(^)(UIColor *))setupItemsTitleSelectedColor;

//标签标题颜色 [不统一]
- (void)itemTitleColor:(UIColor *)color atIndex:(NSInteger)idx status:(HRTabBarItemStatus)status;

//去除tabbar顶部黑线
-(void)removeTabbarTopBlackLine;

//设置选中图片
- (BaseTabbarViewController *(^)(NSArray <NSString *>*imageName))setUpSelectImages;

//设置未选中图片
- (BaseTabbarViewController *(^)(NSArray <NSString *>*imageName))setUpUnSelectImages;
@end

NS_ASSUME_NONNULL_END
