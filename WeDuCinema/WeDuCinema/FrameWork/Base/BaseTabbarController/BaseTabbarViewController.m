//
//  BaseTabbarViewController.m
//  MyThrid
//
//  Created by 耿荣林 on 2019/1/3.
//  Copyright © 2019年 耿荣林. All rights reserved.
//

#import "BaseTabbarViewController.h"
#import "RLBaseViewController.h"

@interface BaseTabbarViewController ()

@end

@implementation BaseTabbarViewController

//初始化（控制器名称数组）
- (instancetype)initWithChildControllerNames:(NSArray<NSString *> *)names{
    if (self = [super init]) {
        [self configChildControllerWithNames:names];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark - ---------- Private Methods ----------

//根据名字初始化子视图控制器
- (void)configChildControllerWithNames:(NSArray <NSString *>*)names {
    [self setViewControllers:[self navigationControllersWithStr:names]];
}

- (NSArray *)navigationControllersWithStr:(NSArray <NSString *>*)strArr{
    NSMutableArray *naviVCArr = [NSMutableArray array];
    for (int i = 0; i < strArr.count; i++) {
        Class c = NSClassFromString([strArr objectAtIndex:i]);
        RLBaseViewController *VC = [[c alloc]init];
        UINavigationController *naviVC = [[UINavigationController alloc]initWithRootViewController:VC];
        [naviVCArr addObject:naviVC];
    }
    return naviVCArr;
}

#pragma mark - ---------- Public Methods ----------
//标签标题
- (void)itemTitles:(NSArray <NSString *>*)titles {
    [self.childViewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.tabBarItem.title = titles[idx];
    }];
}
//标签标题(链式)
- (BaseTabbarViewController *(^)(NSArray <NSString *>*titles))setupItemTitles {
    return ^(NSArray <NSString *>*titles) {
        [self.childViewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            obj.tabBarItem.title = titles[idx];
        }];
        return self;
    };
}

- (BaseTabbarViewController *(^)(NSArray <NSString *>*imageName))setUpSelectImages{
    return ^(NSArray <NSString *>*imageNames){
        [self.childViewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            obj.tabBarItem.selectedImage = [UIImage imageNamed:imageNames[idx]];
            [obj.tabBarController.tabBar setSelectedImageTintColor:[UIColor purpleColor]];
        }];
        return self;
    };
}

- (BaseTabbarViewController *(^)(NSArray <NSString *>*imageName))setUpUnSelectImages{
    return ^(NSArray <NSString *>*imageNames){
        [self.childViewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            obj.tabBarItem.image = [UIImage imageNamed:imageNames[idx]];
            [obj.tabBarController.tabBar setUnselectedItemTintColor:[UIColor grayColor]];
        }];
        return self;
    };
}


//标签标题未选中状态颜色
- (void)itemsTitleColor:(UIColor *)color status:(HRTabBarItemStatus)status {
    [self.childViewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIControlState state = (status == HRTabBarItemStatusSelected) ? UIControlStateSelected : UIControlStateNormal;
        [obj.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:color,NSForegroundColorAttributeName, nil] forState:state];
    }];
}

- (BaseTabbarViewController *(^)(UIColor *))setupItemsTitleDefaultColor {
    return ^(UIColor *color) {
        [self.childViewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [obj.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:color,NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
        }];
        return self;
    };
}

- (BaseTabbarViewController *(^)(UIColor *))setupItemsTitleSelectedColor {
    return ^(UIColor *color) {
        [self.childViewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [obj.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:color,NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
        }];
        return self;
    };
}

//标签标题颜色 [不统一]
- (void)itemTitleColor:(UIColor *)color atIndex:(NSInteger)idx status:(HRTabBarItemStatus)status {
    UIViewController *vc = self.childViewControllers[idx];
    UIControlState state = (status == HRTabBarItemStatusDefault) ? UIControlStateNormal : UIControlStateSelected;
    [vc.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:color,NSForegroundColorAttributeName, nil] forState:state];
}

-(void)removeTabbarTopBlackLine
{
    //方法1
    [UITabBar appearance].clipsToBounds = YES;
    //方法2
    [[UITabBar appearance] setBackgroundColor:[UIColor whiteColor]];
    [[UITabBar appearance] setBarTintColor:[UIColor whiteColor]];
    [[UITabBar appearance] setBackgroundImage:[UIImage imageNamed:@"tabbarImage.png"]];
    [UITabBar appearance].clipsToBounds = YES;
    [[UITabBar appearance] setShadowImage:[UIImage imageNamed:@"tabbarImage.png"]];
}

@end
