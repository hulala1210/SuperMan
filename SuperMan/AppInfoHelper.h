//
//  SDCardHelpers.h
//  VF
//
//  Created by Shiki on 15/11/12.
//  Copyright © 2015年 Accentrix. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppInfoHelper : NSObject
+ (NSString*)getDocumentsPath;
+ (NSString*)getCachesPath;
+ (NSString*)getTmpPath;
+ (NSString*)getAppHomePath;
+ (NSString*)getResPathWithName:(NSString*)name ofType:(NSString*)ext;
+ (NSString*)getAppVersion;
+ (NSString *)getLastReleaseDate;
+ (NSString *)getAppId;

+ (BOOL)hasNewVersionWithAppStoreVersion:(NSString *)appStoreVersion;

@end
