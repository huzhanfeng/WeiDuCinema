//
//  BaseModel.m
//  MyThrid
//
//  Created by 耿荣林 on 2018/12/28.
//  Copyright © 2018年 耿荣林. All rights reserved.
//
#import "BaseModel.h"

@implementation BaseModel
//是KVC的纠错方法：字典中没有对应的属性
//{"id":12}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        self.ID = value;
    }
}

@end
