//
//  ExploreService.h
//  SuperMan
//
//  Created by Kevin Chen on 2018/1/7.
//  Copyright © 2018年 Kevin Chen. All rights reserved.
//

#import "BaseService.h"

static NSString * const exploreQueryApi = @"/exploration/query";
static NSString * const exploreApi = @"/exploration/explore";

@interface ExploreService : BaseService

+ (void)autoExplore;

@end
