
//
//  SDCardHelpers.m
//  VF
//
//  Created by Shiki on 15/11/12.
//  Copyright © 2015年 Accentrix. All rights reserved.
//

#import "AppInfoHelper.h"
#include <sys/socket.h> // Per msqr
#include <sys/sysctl.h>
#include <net/if.h>
#include <net/if_dl.h>
@implementation AppInfoHelper
+ (NSString*)getDocumentsPath
{
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* docDir = [paths objectAtIndex:0];
    return docDir;
}
+ (NSString*)getCachesPath
{
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString* cachesDir = [paths objectAtIndex:0];
    return cachesDir;
}
+ (NSString*)getTmpPath
{
    return NSTemporaryDirectory();
}
+ (NSString*)getAppHomePath
{
    return NSHomeDirectory();
}
+ (NSString*)getResPathWithName:(NSString*)name ofType:(NSString*)ext {
return [[NSBundle mainBundle] pathForResource:name ofType:ext];
}
+( NSString*)getAppVersion {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    return version;
}

+ (NSString *)getLastReleaseDate {
    return @"2016-08-15";
}

+ (NSString *)getAppId {
    return @"1198129363";
}

+ (BOOL)hasNewVersionWithAppStoreVersion:(NSString *)appStoreVersion {
    
    if ([[appStoreVersion componentsSeparatedByString:@"."] count] != 3) {
        return NO;
    }
    
    NSString *currentVersion = [self getAppVersion];
    NSArray *appStoreArr = [appStoreVersion componentsSeparatedByString:@"."];
    NSArray *currentArr = [currentVersion componentsSeparatedByString:@"."];
    
    __block BOOL has = NO;
    
    [appStoreArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj integerValue] > [[currentArr objectAtIndex:idx] integerValue]) {
            has = YES;
            *stop = YES;
        }
    }];
    
    return has;
}

@end
