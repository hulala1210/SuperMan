//
//  Goods.h
//  SuperMan
//
//  Created by Kevin Chen on 2018/1/6.
//  Copyright © 2018年 Kevin Chen. All rights reserved.
//

#import "BaseModel.h"

@interface Good : BaseModel

@property (strong, nonatomic) NSString *goodsId;
@property (strong, nonatomic) NSString *num;
@property (strong, nonatomic) NSString *productId;

@end
