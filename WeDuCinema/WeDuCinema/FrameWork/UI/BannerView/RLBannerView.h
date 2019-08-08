//
//  RLBannerView.h
//  MyThrid
//
//  Created by 耿荣林 on 2018/12/14.
//  Copyright © 2018年 耿荣林. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol SendPageNameDelegate <NSObject>

- (void)sendPageNumber:(NSIndexPath *)indexPath;

@end
@interface RLBannerView : UIView
@property (nonatomic, strong) NSArray<NSString *> *data;
@property (nonatomic,weak) id<SendPageNameDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
