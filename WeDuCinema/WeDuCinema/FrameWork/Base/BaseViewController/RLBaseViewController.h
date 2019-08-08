//
//  RLBaseViewController.h
//  MyThrid
//
//  Created by 耿荣林 on 2019/1/2.
//  Copyright © 2019年 耿荣林. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RLBaseViewControllerProtocol.h"
#import "HRBarItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface RLBaseViewController : UIViewController <RLBaseViewControllerProtocol>
#pragma mark 1 导航
@property(nonatomic,copy) NSString *naviTitle;
//设置 标题文本、颜色、字体
- (void)title:(NSString *)naviTitle colcor:(UIColor *)color font:(UIFont *)font;
- (RLBaseViewController *(^)(NSString *title))setUpNaviTitle;
- (RLBaseViewController *(^)(UIColor *))setUpTitleColcor;
- (RLBaseViewController *(^)(UIFont *))setUpTitleFont;

//左按钮标题
- (void)leftItemTitle:(NSString *)title color:(UIColor *)color font:(UIFont *)font action:(void(^)(void))action;
- (RLBaseViewController *(^)(NSString *title, UIColor *color ,UIFont *font,void (^action)(void)))setUpLeftTitleItem;

//左按钮图片：
- (void)leftImageItem:(NSString *)imageName action:(void(^)(void))action;
- (RLBaseViewController *(^)(NSString *imageName,void(^action)(void)))setupLeftImageItem;

//左按钮通用：
- (void)leftItems:(NSArray <HRBarItem *> *)items actions:(void(^)(NSInteger index))actions;
- (RLBaseViewController *(^)(NSArray <UITabBarItem *> *items,void(^action)(void)))setupLeftItems;

//右按钮标题
- (void)rightItemTitle:(NSString *)title color:(UIColor *)color font:(UIFont *)font action:(void(^)(void))action;
- (RLBaseViewController *(^)(NSString *title, UIColor *color ,UIFont *font,void (^action)(void)))setUpRightTitleItem;

//右按钮图片：
- (void)rightImageItem:(NSString *)imageName action:(void(^)(void))action;
- (RLBaseViewController *(^)(NSString *imageName,void(^action)(void)))setupRightImageItem;

//右按钮通用：
- (void)rightItems:(NSArray <HRBarItem *> *)items actions:(void(^)(NSInteger index))actions;
- (RLBaseViewController *(^)(NSArray <HRBarItem *>*items,void (^actions)(NSInteger index)))setupRightItems;

//隐藏系统返回按钮：
@property (nonatomic,assign) BOOL hiddenBackItem;
- (RLBaseViewController *(^)(void))setupHiddenBackItem;

@end

NS_ASSUME_NONNULL_END
