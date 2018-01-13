//
//  WebConfigHelper.h
//  HollyGame
//
//  Created by Kevin Chen on 2017/7/8.
//  Copyright © 2017年 ZF. All rights reserved.
//

#import <UIKit/UIWebView.h>

@interface WebConfigHelper : NSObject

//解决WebView后台调用OpenGL导致崩溃的问题，此方法在WebView LoadRequest前调用
+ (BOOL)webView:(UIWebView*)view enableGL:(BOOL)bEnable;

//配置声音不会影响其他应用声音
+ (BOOL)configAudioAction;

+ (void)prepareCacheAction;

//不会清除游戏记录缓存
+ (void)clearCacheActon;

+ (void)webView:(UIWebView*)webView removeElementById:(NSString *)elementedId;

+ (void)webView:(UIWebView *)webView removeElementByName:(NSString *)elementedName;

+ (void)webView:(UIWebView *)webView removeElementByClassName:(NSString *)className;

@end
