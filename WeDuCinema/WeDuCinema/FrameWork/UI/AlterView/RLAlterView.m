//
//  RLAlterView.m
//  MyThrid
//
//  Created by 耿荣林 on 2018/12/19.
//  Copyright © 2018年 耿荣林. All rights reserved.
//

#import "RLAlterView.h"

@interface RLAlterView(){
    UIView *_bacgroundView;
    UIView *_alterView;
    UILabel *_titleLab;
    UILabel *_messageLab;
    UIButton *_quitBtn;
}
@end

@implementation RLAlterView

- (void)initAlterViewWithTitle:(NSString *)title withmessage:(NSString *)message withCancelTitle:(NSString *)cancelTitle withSureTitle:(NSString *)sureTitle{
    _bacgroundView = [[UIView alloc]initWithFrame:self.frame];
    [self addSubview:_bacgroundView];
    _bacgroundView.backgroundColor = [UIColor blackColor];
    _bacgroundView.alpha = 0.4;
    
    _alterView = [[UIView alloc]initWithFrame:CGRectMake(20, self.frame.size.height / 3.0, self.frame.size.width - 40, self.frame.size.height / 3.0)];
    _alterView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_alterView];
    
    _titleLab = [[UILabel alloc]initWithFrame:CGRectMake(70 , 0, _alterView.frame.size.width - 140, _alterView.frame.size.height / 5)];
    _titleLab.textColor = [UIColor blackColor];
    _titleLab.text = title;
    _titleLab.backgroundColor = [UIColor orangeColor];
    _titleLab.font = [UIFont systemFontOfSize:15];
    _titleLab.textAlignment = NSTextAlignmentCenter;
    [_alterView addSubview:_titleLab];
    
    
    _messageLab = [[UILabel alloc]initWithFrame:CGRectMake(20, self.frame.size.height / 3 * 1 / 5 + 20, _alterView.frame.size.width - 40, _alterView.frame.size.height * 3 / 5)];
    // 测试颜色
    _messageLab.backgroundColor = [UIColor redColor];
    _messageLab.text = message;
    _messageLab.textColor = [UIColor lightGrayColor];
    _messageLab.font = [UIFont systemFontOfSize:15];
    [_alterView addSubview:_messageLab];
    
    _quitBtn = [[UIButton alloc]initWithFrame:CGRectMake(_alterView.frame.size.width - 50, 15, 30, 30)];
    [_quitBtn setImage:[UIImage imageNamed:@""] forState:(UIControlStateNormal)];
    [_quitBtn addTarget:self action:@selector(dismissClick:) forControlEvents:UIControlEventTouchUpInside];
    _quitBtn.layer.cornerRadius = 15;
    _quitBtn.clipsToBounds = YES;
    _quitBtn.backgroundColor = [UIColor blueColor];
    [_alterView addSubview:_quitBtn];
    
    _cancelBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, _alterView.frame.size.height * 4 / 5 + 20, _alterView.frame.size.width / 2, _alterView.frame.size.height / 5 - 20)];
    // 测试颜色
    _cancelBtn.backgroundColor = [UIColor grayColor];
    [_cancelBtn setTitle:cancelTitle forState:(UIControlStateNormal)];
    [_cancelBtn setTitleColor:[UIColor lightGrayColor] forState:(UIControlStateNormal)];
    _cancelBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    [_alterView addSubview:_cancelBtn];
    
    
    _sureBtn = [[UIButton alloc]initWithFrame:CGRectMake(_alterView.frame.size.width / 2, _alterView.frame.size.height * 4 / 5 + 20, _alterView.frame.size.width / 2, _alterView.frame.size.height / 5 - 20)];
    [_sureBtn setTitle:sureTitle forState:(UIControlStateNormal)];
    [_sureBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    _sureBtn.backgroundColor = [UIColor blueColor];
    _sureBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    [_alterView addSubview:_sureBtn];
}

- (void)dismissClick:(UIButton *)btn{
    [self.dalegate sendMenuValue:@"dismiss"];
}

@end
