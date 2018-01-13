//
//  ExploreResult.h
//  SuperMan
//
//  Created by Kevin Chen on 2018/1/6.
//  Copyright © 2018年 Kevin Chen. All rights reserved.
//

#import "BaseModel.h"
#import "ExploreMessage.h"

@interface ExploreResult : BaseModel

@property (strong, nonatomic) NSString *armyId;
@property (strong, nonatomic) NSString *result;
@property (strong, nonatomic) NSString *timestamp;
@property (strong, nonatomic) NSString *zodiacSignId;

@property (strong, nonatomic) ExploreMessage *message;

@end
