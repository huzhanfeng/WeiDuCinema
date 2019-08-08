//
//  UILabel+RLLabel.h
//  MyThrid
//
//  Created by 耿荣林 on 2018/12/20.
//  Copyright © 2018年 耿荣林. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (RLLabel)
+ (UILabel *)createRLLabelWithFrame:(CGRect)frame withText:(NSString *)text withfont:(UIFont *)font withTextColor:(UIColor *)textcolor withBackgroundColor:(UIColor *)backGroundColor withTextAlignment:(NSTextAlignment)textAlignment;
@end

NS_ASSUME_NONNULL_END
