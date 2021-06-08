//
//  Fundction.h
//  违章查询
//
//  Created by qianfeng on 15/10/24.
//  Copyright (c) 2015年 LY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Fundction : NSObject

typedef void(^AFSuccessCall)(id responseObject);
typedef void(^AFFailureCall)(id error);

+(void)getWithUrl:(NSString*)url success:(AFSuccessCall)success failure:(AFFailureCall)failure;

@end
