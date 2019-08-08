//
//  RLAlterView.h
//  MyThrid
//
//  Created by 耿荣林 on 2018/12/19.
//  Copyright © 2018年 耿荣林. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol GetMenuVlueDelegate <NSObject>

- (void)sendMenuValue:(NSString *)menuStr;

@end
@interface RLAlterView : UIView
- (void)initAlterViewWithTitle:(NSString *)title withmessage:(NSString *)message withCancelTitle:(NSString *)cancelTitle withSureTitle:(NSString *)sureTitle;
@property (nonatomic,weak) id <GetMenuVlueDelegate> dalegate;
@property (nonatomic,strong) UIButton *sureBtn;
@property (nonatomic,strong) UIButton *cancelBtn;

@end

NS_ASSUME_NONNULL_END
