//
//  UIView+RLView.m
//  MyThrid
//
//  Created by 耿荣林 on 2018/12/25.
//  Copyright © 2018年 耿荣林. All rights reserved.
//

#import "UIView+RLView.h"

@implementation UIView (RLView)
+ (UIView *)createRLViewWithFrame:(CGRect)frame withBackgroundColor:(UIColor *)backGroundColor{
    UIView *RLView = [[UIView alloc]initWithFrame:frame];
    RLView.backgroundColor = backGroundColor;
    return RLView;
}

- (void)clibBoundsWithRadius:(CGFloat)radius corner:(UIRectCorner)corner{
    if (@available(iOS 11.0,*)) {
        self.layer.cornerRadius = radius;
        self.layer.maskedCorners = (CACornerMask)corner;
    }else{
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corner cornerRadii:CGSizeMake(radius, radius)];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
        maskLayer.frame = self.bounds;
        maskLayer.path = path.CGPath;
        self.layer.mask = maskLayer;
    }
}

@end
