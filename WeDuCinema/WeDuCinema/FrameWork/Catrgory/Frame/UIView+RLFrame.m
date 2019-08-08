//
//  UIView+RLFrame.m
//  MyThrid
//
//  Created by 耿荣林 on 2018/12/20.
//  Copyright © 2018年 耿荣林. All rights reserved.
//

#import "UIView+RLFrame.h"

@implementation UIView (RLFrame)

- (void)setX:(CGFloat)X{
    CGFloat y = self.frame.origin.y;
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    self.frame = CGRectMake(X, y, width, height);
}

- (CGFloat)X{
    return self.frame.origin.x;
}
- (void)setY:(CGFloat)Y{
    CGFloat x = self.frame.origin.x;
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    self.frame = CGRectMake(x, Y, width, height);
}
- (CGFloat)Y{
    return self.frame.origin.y;
}
-(void)setWidth:(CGFloat)Width{
    CGRect frame = self.frame;
    frame.size.width = Width;
    self.frame = frame;
}
- (CGFloat)Width{
    return self.frame.size.width;
}
- (void)setHeight:(CGFloat)Height{
    CGRect frame = self.frame;
    frame.size.height = Height;
    self.frame = frame;
}
- (CGFloat)Height{
    return self.frame.size.height;
}
- (void)setLeft:(CGFloat)Left{
    CGFloat y = self.frame.origin.y;
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    self.frame = CGRectMake(Left, y, width, height);
}
- (CGFloat)Left{
    return self.frame.origin.x;
}
- (void)setTop:(CGFloat)Top{
    CGFloat x = self.frame.origin.x;
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    self.frame = CGRectMake(x, Top, width, height);
}
- (CGFloat)Top{
    return self.frame.origin.y;
}
- (void)setRight:(CGFloat)Right{
    CGRect frame = self.frame;
    frame.origin.x = Right - frame.size.width;
    self.frame = frame;
}
- (CGFloat)Right{
    return self.frame.origin.x + self.frame.size.width;
}
- (void)setBottom:(CGFloat)Bottom{
    CGRect frame = self.frame;
    frame.origin.y = Bottom - frame.size.height;
    self.frame = frame;
}
- (CGFloat)Bottom{
    return self.frame.origin.y + self.frame.size.height;
}
- (CGSize)Size{
    return self.frame.size;
}
- (void)setSize:(CGSize)Size{
    CGRect frame = self.frame;
    frame.size = Size;
    self.frame = frame;
}
- (CGFloat)CenterX{
    return self.center.x;
}
- (void)setCenterX:(CGFloat)CenterX{
    self.center = CGPointMake(CenterX, self.center.y);
}
- (CGFloat)CenterY{
    return self.center.y;
}
-(void)setCenterY:(CGFloat)CenterY{
    self.center = CGPointMake(self.center.x, CenterY);
}

@end
