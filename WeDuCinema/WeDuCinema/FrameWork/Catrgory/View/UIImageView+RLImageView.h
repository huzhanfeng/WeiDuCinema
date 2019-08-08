//
//  UIImageView+RLImageView.h
//  MyThrid
//
//  Created by 耿荣林 on 2018/12/20.
//  Copyright © 2018年 耿荣林. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (RLImageView)
+(UIImageView *)createImageViewWithImgName:(NSString *)ImgName cornerRaduis:(CGFloat)raduis backgroundColor:(UIImage *)backgroundColor frame:(CGRect)frame;
@end

NS_ASSUME_NONNULL_END
