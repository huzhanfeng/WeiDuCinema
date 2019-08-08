//
//  RLBaseViewController.m
//  MyThrid
//
//  Created by 耿荣林 on 2019/1/2.
//  Copyright © 2019年 耿荣林. All rights reserved.
//

#import "RLBaseViewController.h"


@interface RLBaseViewController ()
//导航标题颜色
@property (strong, nonatomic) UIColor *titleColor;
//导航标题字体
@property (strong, nonatomic) UIFont *titleFont;
//leftItem 点击回调
@property (copy, nonatomic) void(^leftItemActionBlock)(void);
//leftItems 点击回调
@property (copy, nonatomic) void(^leftItemsActionBlock)(NSInteger index);
//rightItem 点击回调
@property (copy, nonatomic) void(^rightItemActionBlock)(void);
//rightItems 点击回调
@property (copy, nonatomic) void(^rightItemsActionBlock)(NSInteger index);
@end

@implementation RLBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeBaseViewControllerData];
    [self configBaseViewControllerControl];
}

- (void)initializeBaseViewControllerData{
    self.titleColor = [UIColor whiteColor];
    self.titleFont = [UIFont systemFontOfSize:17];
}

- (void)configBaseViewControllerControl{
    
}

- (void)setNaviTitle:(NSString *)naviTitle{
    self.navigationItem.title = naviTitle;
}

- (void)title:(NSString *)naviTitle colcor:(UIColor *)color font:(UIFont *)font{
    self.navigationItem.title = naviTitle;
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:color,NSFontAttributeName:font}];
}

- (RLBaseViewController * _Nonnull (^)(NSString * _Nonnull))setUpNaviTitle{
    return ^(NSString *title){
        self.navigationItem.title = title;
        return self;
    };
}

- (RLBaseViewController * _Nonnull (^)(UIColor * _Nonnull))setUpTitleColcor{
    return ^(UIColor *color){
        self.titleColor = color;
        [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:self.titleColor,NSFontAttributeName:self.titleFont}];
        return self;
    };
}

- (RLBaseViewController * _Nonnull (^)(UIFont * _Nonnull))setUpTitleFont{
    return ^(UIFont *font){
        self.titleFont = font;
        [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:self.titleColor,NSFontAttributeName:self.titleFont}];
        return self;
    };
}

- (void)leftItemTitle:(NSString *)title color:(UIColor *)color font:(UIFont *)font action:(void (^)(void))action{
    self.leftItemActionBlock = action;
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn setTitle:title forState:UIControlStateNormal];
    [leftBtn setTitleColor:color forState:UIControlStateNormal];
    [leftBtn.titleLabel setFont:font];
    [leftBtn sizeToFit];
    [leftBtn addTarget:self action:@selector(leftitemClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = item;
}

- (void)leftitemClick:(UIButton *)sender{
    if (self.leftItemsActionBlock) {
        self.leftItemsActionBlock(sender.tag);
    }
    if (self.leftItemActionBlock) {
        self.leftItemActionBlock();
    }
}

- (RLBaseViewController * _Nonnull (^)(NSString * _Nonnull, UIColor * _Nonnull, UIFont * _Nonnull, void (^ _Nonnull)(void)))setUpLeftTitleItem{
    return ^(NSString *title,UIColor *color,UIFont *font,void(^action)(void)){
        self.leftItemActionBlock = action;
        UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [leftBtn setTitle:title forState:UIControlStateNormal];
        [leftBtn setTitleColor:color forState:UIControlStateNormal];
        [leftBtn.titleLabel setFont:font];
        [leftBtn sizeToFit];
        [leftBtn addTarget:self action:@selector(leftitemClick:) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
        self.navigationItem.leftBarButtonItem = item;
        return self;
    };
}

- (void)leftImageItem:(NSString *)imageName action:(void (^)(void))action{
    self.leftItemActionBlock = action;
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]style:UIBarButtonItemStylePlain target:self action:@selector(leftitemClick:)];
    self.navigationItem.leftBarButtonItem = item;
}

- (RLBaseViewController * _Nonnull (^)(NSString * _Nonnull, void (^ _Nonnull)(void)))setupLeftImageItem{
    return ^(NSString *imageName,void(^action)(void)){
        self.leftItemActionBlock = action;
        UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]style:UIBarButtonItemStylePlain target:self action:@selector(leftitemClick:)];
        self.navigationItem.leftBarButtonItem = item;
        return self;
    };
}

- (void)leftItems:(NSArray<HRBarItem *> *)items actions:(void (^)(NSInteger))actions{
    self.leftItemsActionBlock = actions;
    NSMutableArray *barButtonItems = [NSMutableArray array];
    [items enumerateObjectsUsingBlock:^(HRBarItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:obj];
        obj.tag = idx;
        [obj addTarget:self action:@selector(leftitemClick:) forControlEvents:UIControlEventTouchUpInside];
        [barButtonItems addObject:item];
        if (obj.frame.size.width == 0) {
            [obj sizeToFit];
        }
    }];
}

- (void)rightItemTitle:(NSString *)title color:(UIColor *)color font:(UIFont *)font action:(void (^)(void))action{
    UIButton *itemButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [itemButton setTitle:title forState:UIControlStateNormal];
    [itemButton setTitleColor:color forState:UIControlStateNormal];
    [itemButton.titleLabel setFont:font];
    [itemButton sizeToFit];
    [itemButton addTarget:self action:@selector(rightItemAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:itemButton];
    self.navigationItem.rightBarButtonItem = item;
}

- (void)rightItemAction:(UIButton *)sender{
    if (self.rightItemActionBlock) {
        self.rightItemActionBlock();
    }
    if (self.rightItemsActionBlock) {
        self.rightItemsActionBlock(sender.tag);
    }
}

- (RLBaseViewController * _Nonnull (^)(NSString * _Nonnull, UIColor * _Nonnull, UIFont * _Nonnull, void (^ _Nonnull)(void)))setUpRightTitleItem{
    return ^(NSString *title, UIColor *color, UIFont *font, void(^action)(void)) {
        self.rightItemActionBlock = action;
        return self;
    };
}

- (void)rightImageItem:(NSString *)imageName action:(void (^)(void))action{
    self.rightItemActionBlock = action;
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]style:UIBarButtonItemStylePlain target:self action:@selector(rightItemAction:)];
    self.navigationItem.rightBarButtonItem = item;
}

- (RLBaseViewController * _Nonnull (^)(NSString * _Nonnull, void (^ _Nonnull)(void)))setupRightImageItem{
    return ^(NSString *imageName, void(^action)(void)){
        self.rightItemActionBlock = action;
        UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]style:UIBarButtonItemStylePlain target:self action:@selector(rightItemAction:)];
        self.navigationItem.rightBarButtonItem = item;
        return self;
    };
}

- (void)rightItems:(NSArray<HRBarItem *> *)items actions:(void(^)(NSInteger))action{
    self.rightItemsActionBlock = action;
    NSMutableArray *barButtonItems = [NSMutableArray array];
    [items enumerateObjectsUsingBlock:^(HRBarItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:obj];
        obj.tag = idx;
        [obj addTarget:self action:@selector(rightItemAction:) forControlEvents:UIControlEventTouchUpInside];
        [barButtonItems addObject:item];
        if (obj.frame.size.width == 0) {
            [obj sizeToFit];
        }
    }];
    self.navigationItem.rightBarButtonItems = barButtonItems;
}

- (RLBaseViewController *(^)(NSArray <HRBarItem *>*items,void (^actions)(NSInteger index)))setupRightItems {
    return ^(NSArray <HRBarItem *>*items,void (^actions)(NSInteger index)){
        self.rightItemsActionBlock = actions;
        NSMutableArray *barButtonItems = [NSMutableArray array];
        [items enumerateObjectsUsingBlock:^(HRBarItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:obj];
            obj.tag = idx;
            [obj addTarget:self action:@selector(rightItemAction:) forControlEvents:UIControlEventTouchUpInside];
            [barButtonItems addObject:item];
            if (obj.frame.size.width == 0) {
                [obj sizeToFit];
            }
        }];
        self.navigationItem.rightBarButtonItems = barButtonItems;
        return self;
    };
}

- (RLBaseViewController * _Nonnull (^)(void))setupHiddenBackItem{
    return ^{
        self.navigationItem.hidesBackButton = YES;
        return self;
    };
}

@end
