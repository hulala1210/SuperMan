//
//  GameDateService.m
//  SuperMan
//
//  Created by Kevin Chen on 2018/1/6.
//  Copyright © 2018年 Kevin Chen. All rights reserved.
//

#import "GameDateService.h"
#import "TimeHelper.h"
#import "ExploreResult.h"

@implementation GameDateService

+ (void)captureData:(NSData *)data url:(NSURL *)url {

    NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"%@",string);
    
    if ([[url absoluteString] containsString:@"/domain-game/exploration/explore"]) {
        ExploreResult *result = [ExploreResult mj_objectWithKeyValues:string];
        NSLog(@"%@",result.timestamp);
        
        NSDate *date = [TimeHelper convertToDateWithTimestamp:result.timestamp];
        NSDate *nowDate = [NSDate date];
        NSString *stamp = [TimeHelper convertToTimeStampWithDate:date];
        
        
        NSLog(@"%@ \n%@",date,stamp);
    }
}

@end
