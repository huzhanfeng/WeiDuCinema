//
//  GetTextHeight.h
//  MyThrid
//
//  Created by 耿荣林 on 2018/12/14.
//  Copyright © 2018年 耿荣林. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GetTextHeight : NSObject
- (CGFloat)getHeightWidthText:(NSString *)text widthFount:(UIFont *)fount widthWidth:(CGFloat)width;
-(CGFloat)getSpaceLabelHeightWithText:(NSString *)str withFont:(UIFont *)font withWidth:(CGFloat)width;
@end

NS_ASSUME_NONNULL_END
