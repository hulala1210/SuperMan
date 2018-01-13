//
//  TimeHelper.h
//  SuperMan
//
//  Created by Kevin Chen on 2018/1/6.
//  Copyright © 2018年 Kevin Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimeHelper : NSObject

+ (NSDate *)convertToDateWithTimestamp:(id)timestamp ;
+ (NSString *)convertToTimeStampWithDate:(NSDate *)date;

@end
