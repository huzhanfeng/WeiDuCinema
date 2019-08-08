//
//  UIButton+Count.m
//  Message
//
//  Created by 耿荣林 on 17/9/12.
//  Copyright © 2017年 耿荣林. All rights reserved.
//

#import "UIButton+Count.h"
#import <objc/runtime.h>


@interface UIButton ()

@property (nonatomic, strong) CADisplayLink *displayLink;

@property (nonatomic, assign) NSTimeInterval leaveTime;
@end
@implementation UIButton (Count)
static NSString *displayLinkKey;
static NSString *leaveTimeKey;
static NSString *countDownFormatKey;

-(void)setDisplayLink:(CADisplayLink *)displayLink{
    //源对象、关键字、关联的对象、关联策略
    objc_setAssociatedObject(self, &displayLinkKey, displayLink, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(CADisplayLink *)displayLink{
    return  objc_getAssociatedObject(self, &displayLinkKey);
}

-(void)setLeaveTime:(NSTimeInterval)leaveTime{
    objc_setAssociatedObject(self, &leaveTimeKey, @(leaveTime), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSTimeInterval)leaveTime{
    return  [objc_getAssociatedObject(self, &leaveTimeKey) doubleValue];
}


-(void)setCountDownFormat:(NSString *)countDownFormat{
    objc_setAssociatedObject(self, &countDownFormatKey, countDownFormat, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSString *)countDownFormat{
    return objc_getAssociatedObject(self, &countDownFormatKey);
}

-(void)countDownWithTimeInterval:(NSTimeInterval) duration{
    
    self.leaveTime = duration;
    
    self.enabled=NO;
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(countDown)];
    self.displayLink.frameInterval=60;
    
    [self.displayLink  addToRunLoop: [NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}

-(void)countDown{
    self.leaveTime--;
    
    if (!self.countDownFormat) {
        self.countDownFormat=@"剩余%d秒";
    }
    
    [self setTitle:[NSString stringWithFormat:self.countDownFormat,(int)self.leaveTime] forState:UIControlStateDisabled];
    if (self.leaveTime == 0) {
        [self.displayLink invalidate];
        self.displayLink=nil;
        self.enabled=YES;
    }
}

@end
