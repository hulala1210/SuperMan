//
//  SCYLoanHTMLCache.m
//  ProvidentFund
//
//  Created by 9188 on 2016/12/9.
//  Copyright © 2016年 9188. All rights reserved.
//

#import "SCYLoanHTMLCache.h"
#import "AppInfoHelper.h"

@implementation SCYLoanHTMLCache
+ (instancetype)defaultcache{
    static SCYLoanHTMLCache *cache = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
//        cache = [[SCYLoanHTMLCache alloc] initWithName:cacheName];
        cache = [[SCYLoanHTMLCache alloc] initWithPath:[[AppInfoHelper getDocumentsPath] stringByAppendingPathComponent:cacheName]];
    });
    return cache;
}

@end
