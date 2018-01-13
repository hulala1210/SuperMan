//
//  WebConfigHelper.m
//  HollyGame
//
//  Created by Kevin Chen on 2017/7/8.
//  Copyright © 2017年 ZF. All rights reserved.
//

#import "WebConfigHelper.h"
//#import <Easy_Runtime.h>
#import <AVFoundation/AVFoundation.h>
#import "AppInfoHelper.h"
#import "Tools/LoanCacheTool/SCYLoanHTMLCache.h"
#import <objc/runtime.h>

@implementation WebConfigHelper

typedef void (*CallFuc)(id, SEL, BOOL);
typedef BOOL (*GetFuc)(id, SEL);
+ (BOOL)webView:(UIWebView*)view enableGL:(BOOL)bEnable {
    BOOL bRet = NO;
    do
    {
        Ivar internalVar = class_getInstanceVariable([view class], "_internal");
        if (!internalVar)
        {
            NSLog(@"enable GL _internal invalid!");
            break;
        }
        
        UIWebViewInternal* internalObj = object_getIvar(view, internalVar);
        Ivar browserVar = class_getInstanceVariable(object_getClass(internalObj), "browserView");
        if (!browserVar)
        {
            NSLog(@"enable GL browserView invalid!");
            break;
        }
        
        id webbrowser = object_getIvar(internalObj, browserVar);
        Ivar webViewVar = class_getInstanceVariable(object_getClass(webbrowser), "_webView");
        if (!webViewVar)
        {
            NSLog(@"enable GL _webView invalid!");
            break;
        }
        
        id webView = object_getIvar(webbrowser, webViewVar);
        if (!webView)
        {
            NSLog(@"enable GL webView obj nil!");
        }
        
        if(object_getClass(webView) != NSClassFromString(@"WebView"))
        {
            NSLog(@"enable GL webView not WebView!");
            break;
        }
        
        SEL selector = NSSelectorFromString(@"_setWebGLEnabled:");
        IMP impSet = [webView methodForSelector:selector];
        CallFuc func = (CallFuc)impSet;
        func(webView, selector, bEnable);
        
        SEL selectorGet = NSSelectorFromString(@"_webGLEnabled");
        IMP impGet = [webView methodForSelector:selectorGet];
        GetFuc funcGet = (GetFuc)impGet;
        BOOL val = funcGet(webView, selector);
        
        bRet = (val == bEnable);
        
    }while(NO);
    
    return bRet;
}

+ (BOOL)configAudioAction {
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    BOOL ok;
    NSError *setCategoryError = nil;
    ok = [audioSession setCategory:AVAudioSessionCategoryAmbient error:&setCategoryError];
    if (!ok) {
        NSLog(@"%s setCategoryError=%@", __PRETTY_FUNCTION__, setCategoryError);
    }
    
    if (setCategoryError) {
        NSLog(@"setCategoryError = %@",setCategoryError);
    }
    
    return ok;
}

+ (void)prepareCacheAction {
    NSString *documentCachePath = [AppInfoHelper getDocumentsPath];
    NSString *sourceFilePath = [[NSBundle mainBundle] pathForResource:cacheName ofType:nil];
    NSString *destinationPath = [documentCachePath stringByAppendingPathComponent:cacheName];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:destinationPath]) {
        ;
    }
    else {
        NSError *error = nil;
        [[NSFileManager defaultManager] copyItemAtPath:sourceFilePath toPath:destinationPath error:&error];
        if (error) {
            NSLog(@"%@",error);
        }
    }
}

+ (void)clearCacheActon {
    NSString *documentCachePath = [AppInfoHelper getDocumentsPath];
    NSString *destinationPath = [documentCachePath stringByAppendingPathComponent:cacheName];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:destinationPath]) {
        NSError *error = nil;
        [[NSFileManager defaultManager] removeItemAtPath:destinationPath error:&error];
    }
}

+ (void)webView:(UIWebView *)webView removeElementById:(NSString *)elementedId {
    NSString *jsToGetHTMLSource = @"document.getElementsByTagName('html')[0].innerHTML";
    
    NSString *HTMLSource = [webView stringByEvaluatingJavaScriptFromString:jsToGetHTMLSource];
    
    NSLog(@"HTMLSource=%@",HTMLSource);
        
    NSString *string = [NSString stringWithFormat:@"var zzz = document.getElementById('%@');zzz.remove();",elementedId];
    
    [webView stringByEvaluatingJavaScriptFromString:string];
}

+ (void)webView:(UIWebView *)webView removeElementByName:(NSString *)elementedName {
    NSString *jsToGetHTMLSource = @"document.getElementsByTagName('html')[0].innerHTML";
    
    NSString *HTMLSource = [webView stringByEvaluatingJavaScriptFromString:jsToGetHTMLSource];
    
    NSLog(@"HTMLSource=%@",HTMLSource);
    
    NSString *string = [NSString stringWithFormat:@"var yyy = document.getElementsByName('%@');yyy.remove();",elementedName];
    
    [webView stringByEvaluatingJavaScriptFromString:string];
    
}

+ (void)webView:(UIWebView *)webView removeElementByClassName:(NSString *)className {
    NSString *jsToGetHTMLSource = @"document.getElementsByTagName('html')[0].innerHTML";
    
    NSString *HTMLSource = [webView stringByEvaluatingJavaScriptFromString:jsToGetHTMLSource];
    
    NSLog(@"HTMLSource=%@",HTMLSource);
    
    NSString *string = [NSString stringWithFormat:@"var yyy = document.getElementsByClassName('%@');yyy.remove();",className];
    
    [webView stringByEvaluatingJavaScriptFromString:string];
    
}

@end
