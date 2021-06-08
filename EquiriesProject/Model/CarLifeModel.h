//
//  CarLifeModel.h
//  违章查询助手
//
//  Created by qianfeng on 15/10/25.
//  Copyright (c) 2015年 LY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CarLifeModel : NSObject
@property(nonatomic,strong)NSString * newsurl;
@property(nonatomic,strong)NSString * picurl;
@property(nonatomic,strong)NSString * title;
@property(nonatomic,strong)NSString * introduction;
-(instancetype)initWithDict:(NSDictionary*)dic;

@end
