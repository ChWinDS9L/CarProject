//
//  Wether.m
//  AFN数据获取练习
//
//  Created by qianfeng on 15/10/25.
//  Copyright (c) 2015年 HXH. All rights reserved.
//

#import "Wether.h"

@implementation Wether

-(id)valueForUndefinedKey:(NSString *)key
{
    return nil;
}

-(instancetype)initWithDict:(NSDictionary*)dic
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

+(Wether*)applicationWithDic:(NSDictionary *)dic
{
    Wether * app = [[Wether alloc] initWithDict:dic];
    return app;
}


@end
