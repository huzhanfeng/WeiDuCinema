//
//  RLWebViewController.h
//  MyThrid
//
//  Created by 耿荣林 on 2019/1/3.
//  Copyright © 2019年 耿荣林. All rights reserved.
//

#import "RLBaseViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>

NS_ASSUME_NONNULL_BEGIN

@interface RLWebViewController : RLBaseViewController<UIWebViewDelegate>
//webView
@property (strong, nonatomic) UIWebView *webView;

//url
@property (copy, nonatomic) NSString *url;
//context
@property (strong, nonatomic) JSContext *context;
@end

NS_ASSUME_NONNULL_END
