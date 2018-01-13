//
//  TimeHelper.m
//  SuperMan
//
//  Created by Kevin Chen on 2018/1/6.
//  Copyright © 2018年 Kevin Chen. All rights reserved.
//

#import "TimeHelper.h"

@implementation TimeHelper

+ (NSDate *)convertToDateWithTimestamp:(id)timestamp {
    NSTimeInterval timeInterval = [timestamp doubleValue] / 1000;
    NSDate *detailDate = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    return detailDate;
}

+ (NSString *)convertToTimeStampWithDate:(NSDate *)date {
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate:date];
    NSDate *localeDate = [date  dateByAddingTimeInterval: interval];
    NSString *timeSp = [NSString stringWithFormat:@"%ld",(long)([localeDate timeIntervalSince1970] * 1000)];
    return timeSp;
}

@end
