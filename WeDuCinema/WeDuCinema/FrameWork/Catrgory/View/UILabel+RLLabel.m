//
//  UILabel+RLLabel.m
//  MyThrid
//
//  Created by 耿荣林 on 2018/12/20.
//  Copyright © 2018年 耿荣林. All rights reserved.
//

#import "UILabel+RLLabel.h"

@implementation UILabel (RLLabel)
+ (UILabel *)createRLLabelWithFrame:(CGRect)frame withText:(NSString *)text withfont:(UIFont *)font withTextColor:(UIColor *)textcolor withBackgroundColor:(UIColor *)backGroundColor withTextAlignment:(NSTextAlignment)textAlignment{
    UILabel *label = [[UILabel alloc]init];
    label.text = text;
    label.frame = frame;
    label.font = font;
    label.textAlignment = textAlignment;
    label.textColor = textcolor;
    label.backgroundColor = backGroundColor;
    return label;
}
@end
