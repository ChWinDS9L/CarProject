//
//  addressModel.h
//  违章查询助手
//
//  Created by qianfeng on 15/10/26.
//  Copyright (c) 2015年 LY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface addressModel : NSObject

@property (nonatomic,strong) NSString * fl;
@property (nonatomic,strong) NSNumber * pid;
@property (nonatomic,strong) NSString * pn;

-(instancetype)initWithDict:(NSDictionary*)dict;

@end
