//
//  CarLifeModel.m
//  违章查询助手
//
//  Created by qianfeng on 15/10/25.
//  Copyright (c) 2015年 LY. All rights reserved.
//

#import "CarLifeModel.h"

@implementation CarLifeModel
-(instancetype)initWithDict:(NSDictionary*)dic
{
    if (self=[super init]) {
        
        /*
         newsurl
         picurl;
         title;
         
         */
        _newsurl=dic[@"newsurl"];
        _picurl=dic[@"picurl"];
        _title=dic[@"title"];
        _introduction=dic[@"introduction"];
    }

    return self;
}

@end
