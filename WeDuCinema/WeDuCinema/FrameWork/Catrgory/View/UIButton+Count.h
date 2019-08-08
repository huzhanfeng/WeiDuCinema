//
//  UIButton+Count.h
//  Message
//
//  Created by 耿荣林 on 17/9/12.
//  Copyright © 2017年 耿荣林. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Count)
@property (nonatomic, strong) NSString *countDownFormat;

-(void)countDownWithTimeInterval:(NSTimeInterval) duration;

@end
