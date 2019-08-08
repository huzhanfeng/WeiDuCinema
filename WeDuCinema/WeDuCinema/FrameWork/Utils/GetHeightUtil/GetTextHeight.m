//
//  GetTextHeight.m
//  MyThrid
//
//  Created by 耿荣林 on 2018/12/14.
//  Copyright © 2018年 耿荣林. All rights reserved.
//

#import "GetTextHeight.h"

@implementation GetTextHeight


/**
 计算文本高度：

 @param text 带计算文本
 @param fount 字体
 @param width 视图宽度
 @return 文本高度
 */
- (CGFloat)getHeightWidthText:(NSString *)text widthFount:(UIFont *)fount widthWidth:(CGFloat)width{
    NSDictionary *attrs = @{NSFontAttributeName:fount};
    CGSize maxSize = CGSizeMake(width, MAXFLOAT);
    
    NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    
    // 计算文字占据的高度
    CGSize size = [text boundingRectWithSize:maxSize options:options attributes:attrs context:nil].size;

    return  ceilf(size.height);
}


/**
 带间距的文本高度获取:

 @param str text(带计算文本)
 @param font 文本字体大小
 @param width 文本视图宽度
 @return 文本高度
 */
- (CGFloat)getSpaceLabelHeightWithText:(NSString*)str withFont:(UIFont*)font withWidth:(CGFloat)width {
    
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    
    paraStyle.alignment = NSTextAlignmentLeft;
    
    paraStyle.lineSpacing = 11.0f;
    
    paraStyle.hyphenationFactor = 1.0;
    
    paraStyle.firstLineHeadIndent = 0.0;
    
    paraStyle.paragraphSpacingBefore = 0.0;
    
    paraStyle.headIndent = 0;
    
    paraStyle.tailIndent = 0;
    //, NSKernAttributeName:@1.5f
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle
                          };
    CGSize size = [str boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options: NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:dic context:nil].size;
    
    return  ceilf(size.height);
}

@end
