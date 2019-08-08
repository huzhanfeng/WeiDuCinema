//
//  AudioPlayerView.h
//  MyThrid
//
//  Created by 耿荣林 on 2018/12/25.
//  Copyright © 2018年 耿荣林. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MusicModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface AudioPlayerView : UIView
@property (nonatomic,strong) MusicModel *model;
@property (weak, nonatomic) IBOutlet UIImageView *coverImageView;
@property (weak, nonatomic) IBOutlet UISlider *progressView;
@property (weak, nonatomic) IBOutlet UILabel *progresslab;
@property (weak, nonatomic) IBOutlet UILabel *allTime;
@property (weak, nonatomic) IBOutlet UIButton *playBtn;
@property (weak, nonatomic) IBOutlet UIButton *lastBtn;
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;
@property (weak, nonatomic) IBOutlet UIButton *musicListBtn;
@property (weak, nonatomic) IBOutlet UIButton *playMusicBtn;
@property (weak, nonatomic) IBOutlet UIButton *loveBtn;
@property (weak, nonatomic) IBOutlet UIButton *downLoadBtn;
@property (weak, nonatomic) IBOutlet UIButton *shareBtn;
@property (weak, nonatomic) IBOutlet UIButton *messageBtn;

@end

NS_ASSUME_NONNULL_END
