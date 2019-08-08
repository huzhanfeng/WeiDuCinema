//
//  UIImageView+RLImageView.m
//  MyThrid
//
//  Created by 耿荣林 on 2018/12/20.
//  Copyright © 2018年 耿荣林. All rights reserved.
//

#import "UIImageView+RLImageView.h"

@implementation UIImageView (RLImageView)
+ (UIImageView *)createImageViewWithImgName:(NSString *)ImgName cornerRaduis:(CGFloat)raduis backgroundColor:(UIColor *)backgroundColor frame:(CGRect)frame{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:frame];
    imageView.image = [UIImage imageNamed:ImgName];
    imageView.backgroundColor = backgroundColor;
    imageView.layer.cornerRadius = raduis;
    return imageView;
}

@end
