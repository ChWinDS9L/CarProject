//
//  addressModel.m
//  违章查询助手
//
//  Created by qianfeng on 15/10/26.
//  Copyright (c) 2015年 LY. All rights reserved.
//

#import "addressModel.h"

@implementation addressModel

-(instancetype)initWithDict:(NSDictionary*)dict
{
    if (self = [super init]) {
        _fl = dict[@"fl"];
        _pid = dict[@"pid"];
        _pn = dict[@"pn"];
    }
    return self;
}

@end
