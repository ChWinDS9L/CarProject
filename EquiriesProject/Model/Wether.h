//
//  Wether.h
//  AFN数据获取练习
//
//  Created by qianfeng on 15/10/25.
//  Copyright (c) 2015年 HXH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Wether : NSObject

@property (nonatomic,strong) NSString * air;
@property (nonatomic,strong) NSString * airtext;
@property (nonatomic,strong) NSString * date;
@property (nonatomic,strong) NSString * hightemperature;
@property (nonatomic,strong) NSString * index;
@property (nonatomic,strong) NSString * lowtemperature;
@property (nonatomic,strong) NSString * weathertext;
@property (nonatomic,strong) NSString * weathertype;
@property (nonatomic,strong) NSString * xiche;

-(instancetype)initWithDict:(NSDictionary*)dic;

@end
