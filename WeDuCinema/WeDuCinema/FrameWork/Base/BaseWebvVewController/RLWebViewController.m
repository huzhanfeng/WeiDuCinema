//
//  RLWebViewController.m
//  MyThrid
//
//  Created by 耿荣林 on 2019/1/3.
//  Copyright © 2019年 耿荣林. All rights reserved.
//

#import "RLWebViewController.h"

@interface RLWebViewController ()

@end

@implementation RLWebViewController

#pragma mark - ---------- Lazy Loading（懒加载） ----------
- (UIWebView *)webView {
    if (!_webView) {
        _webView = [[UIWebView alloc] init];
    }
    return _webView;
}
#pragma mark - ----------   Lifecycle（生命周期） ----------
//
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configBaseWebViewControllerUI];
}
//
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - ---------- Private Methods（私有方法） ----------

#pragma mark initliaze data(初始化数据)

#pragma mark config control（布局控件）
- (void)configBaseWebViewControllerUI {
    //webView
    [self.view addSubview:self.webView];
//    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(UIEdgeInsetsZero);
//    }];
    self.webView.frame = self.view.frame;
    self.webView.delegate = self;
    [self.webView scalesPageToFit];
    self.context = [self.webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
}

#pragma mark setter （重写set方法）
- (void)setUrlStr:(NSString *)url {
    _url = url;
    [self.webView loadRequest:[[NSURLRequest alloc] initWithURL:[NSURL URLWithString:url]]];
}
#pragma mark - ---------- Protocol Methods（代理方法） ----------
#pragma mark UIWebViewDelegate
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    self.title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
}
@end
