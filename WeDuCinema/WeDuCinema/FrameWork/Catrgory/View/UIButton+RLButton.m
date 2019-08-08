//
//  UIButton+RLButton.m
//  MyThrid
//
//  Created by 耿荣林 on 2018/12/20.
//  Copyright © 2018年 耿荣林. All rights reserved.
//

#import "UIButton+RLButton.h"

@implementation UIButton (RLButton)
+ (UIButton *)createButtonWithTitle:(NSString *)title titleFont:(UIFont *)titleLabelFont Image:(UIImage *)image backgroundImage:(UIImage *)backgroundImage backgroundColor:(UIColor *)backgroundColor titleColor:(UIColor *)titleLabelColor frame:(CGRect)frame{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:image forState:UIControlStateNormal];
    [button setBackgroundImage:backgroundImage forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleLabelColor forState:UIControlStateNormal];
    button.backgroundColor = backgroundColor;
    button.frame = frame;
    button.titleLabel.font = titleLabelFont;
    return button;
}




@end
