//
//  UIView+RLFrame.h
//  MyThrid
//
//  Created by 耿荣林 on 2018/12/20.
//  Copyright © 2018年 耿荣林. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (RLFrame)
@property (assign, nonatomic) CGFloat X;
@property (assign, nonatomic) CGFloat Y;
@property (assign, nonatomic) CGFloat Width;
@property (assign, nonatomic) CGFloat Height;

@property (assign, nonatomic) CGFloat Left;
@property (assign, nonatomic) CGFloat Top;
@property (assign, nonatomic) CGFloat Right;
@property (assign, nonatomic) CGFloat Bottom;

@property (assign, nonatomic) CGSize Size;
@property (assign, nonatomic) CGFloat CenterX;
@property (assign, nonatomic) CGFloat CenterY;

@end

NS_ASSUME_NONNULL_END
