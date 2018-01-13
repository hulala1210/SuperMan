//
//  GameViewController.m
//  SuperMan
//
//  Created by Kevin Chen on 2018/1/6.
//  Copyright © 2018年 Kevin Chen. All rights reserved.
//

#import "GameViewController.h"
#import "SCYCacheURLProtocol.h"
#import <UIView+Toast.h>
#import "WebConfigHelper.h"

#import <ReactiveObjC.h>

@interface GameViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation GameViewController

static NSString *mainUrlString = @"http://www.51h5.com/play/2316.html";

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

//- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
//    return UIInterfaceOrientationMaskLandscape;
//}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [NSURLProtocol registerClass:[SCYCacheURLProtocol class]];
    
    [WebConfigHelper configAudioAction];
    [WebConfigHelper webView:self.webView enableGL:NO];
    [self.webView setScalesPageToFit:YES];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:mainUrlString]]];
    
    
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

#pragma mark -UIWebViewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    NSString *requestStr = request.URL.absoluteString;
    return YES;
}

-(void)webViewDidStartLoad:(UIWebView *)webView
{
    NSLog(@"didStartLoad");
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"%@",webView.request.URL);
    if([error code] == NSURLErrorCancelled || [error code] == NSURLErrorTimedOut) {
        return;
    }
    
    
    [WebConfigHelper clearCacheActon];
    [WebConfigHelper prepareCacheAction];
    
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:mainUrlString]]];
    
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    //    [KVNProgress dismiss];
    NSLog(@"%@",webView.request.URL);
    NSString *requestStr = webView.request.URL.absoluteString;
    
    
    [WebConfigHelper webView:webView removeElementById:@"hw_splashscreen"];
    
    [WebConfigHelper webView:webView removeElementByClassName:@"inner"];
    [WebConfigHelper webView:webView removeElementById:@"hwtb-root"];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
