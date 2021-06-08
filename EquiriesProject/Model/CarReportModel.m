//
//  CarReportModel.m
//  违章查询助手
//
//  Created by qianfeng on 15/10/26.
//  Copyright (c) 2015年 LY. All rights reserved.
//

#import "CarReportModel.h"

@implementation CarReportModel
-(instancetype)initWithDict:(NSDictionary*)dic
{
    if (self=[super init]) {
        
        _newsurl=dic[@"newsurl"];
        _smallpic=dic[@"smallpic"];
        _title=dic[@"title"];
        _lasttime=dic[@"lasttime"];
    }
    
    return self;
}

@end
