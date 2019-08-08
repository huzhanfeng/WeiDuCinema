//
//  RLBannerCell.m
//  MyThrid
//
//  Created by 耿荣林 on 2018/12/14.
//  Copyright © 2018年 耿荣林. All rights reserved.
//

#import "RLBannerCell.h"
@interface RLBannerCell () {
    UILabel *_textLabel;
}
@end
@implementation RLBannerCell
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self buildUI];
    }
    return self;
}

- (void)buildUI {
    _textLabel = [[UILabel alloc] initWithFrame:self.bounds];
    _textLabel.textAlignment = NSTextAlignmentCenter;
    _textLabel.font = [UIFont fontWithName:@"AmericanTypewriter" size:50];
    [self addSubview:_textLabel];
}

- (void)setTitle:(NSString *)title {
    _title = title;
    _textLabel.text = title;
}

@end
