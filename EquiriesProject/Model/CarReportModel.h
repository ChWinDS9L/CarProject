//
//  CarReportModel.h
//  违章查询助手
//
//  Created by qianfeng on 15/10/26.
//  Copyright (c) 2015年 LY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CarReportModel : NSObject
@property(nonatomic,strong)NSString * newsurl;
@property(nonatomic,strong)NSString * smallpic;
@property(nonatomic,strong)NSString * title;
@property(nonatomic,strong)NSString * lasttime;
-(instancetype)initWithDict:(NSDictionary*)dic;

@end
