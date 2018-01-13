//
//  ExploreMessage.h
//  SuperMan
//
//  Created by Kevin Chen on 2018/1/6.
//  Copyright © 2018年 Kevin Chen. All rights reserved.
//

#import "BaseModel.h"
#import "Good.h"

@interface ExploreMessage : BaseModel

@property (strong, nonatomic) NSString *critical;
@property (strong, nonatomic) NSString *exp;
@property (strong, nonatomic) NSString *leftTime;
@property (strong, nonatomic) NSString *level;
@property (strong, nonatomic) NSString *maxTimes;
@property (strong, nonatomic) NSString *playTimes;
@property (strong, nonatomic) NSString *silver;
@property (strong, nonatomic) NSString *times;
@property (strong, nonatomic) NSArray <Good *> *goodsList;


@end
