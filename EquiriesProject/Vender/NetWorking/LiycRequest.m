//
//  LiycRequest.m
//  003AFN二次封装
//
//  Created by qianfeng on 15/10/22.
//  Copyright (c) 2015年 HXH. All rights reserved.
//

#import "LiycRequest.h"
#import "Header.h"

@implementation LiycRequest

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"%@",key);
    
}

-(id)valueForUndefinedKey:(NSString *)key
{
    return nil;
}


////通过get获取天气预报的数据
+(NSURLSessionDataTask*)getWetherWithBlock:(void(^)(id obj,NSError * error))block
{
    //NSString * path = @"http://wz.qichecdn.com/ashx/GetWeather.ashx?&cityid=110100&token=2&platform=2&version=3.2.0&qd=kqzs_cpa_test_w";
    return [[AFAppDotNetAPIClient sharedClient]GET:urlString parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        //data类型数据,可通过JSON解析
        NSLog(@"responseObject class == %@",[responseObject class]);
        if (block) {
            block(responseObject,nil);
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        block(nil,error);
        NSLog(@"error = %@",error);
    }];
}

//获取地址
+(NSURLSessionDataTask*)getAddressWithBlock:(void(^)(id obj,NSError * error))block
{
    return [[AFAppDotNetAPIClient sharedClient]GET:addressUrlStr parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        if (block) {
            block(responseObject,nil);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"error = %@",error.localizedDescription);
        block(nil,error);
    }];
}

//品牌找车
+(NSURLSessionDataTask*)getBrandCarWithBlock:(void(^)(id obj,NSError * error))block
{
    return [[AFAppDotNetAPIClient sharedClient]GET:BrandUrl parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        if (block) {
            block(responseObject,nil);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"error = %@",error.localizedDescription);
        block(nil,error);
    }];

}

//行车生活
+(NSURLSessionDataTask*)getDriveLifeWithBlock:(void(^)(id obj,NSError * error))block
{
    return [[AFAppDotNetAPIClient sharedClient]GET:DriveLifeUrlStr parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"class = %@",[responseObject class]);
        if (block) {
            block(responseObject,nil);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"error = %@",error.localizedDescription);
        block(nil,error);
    }];
}

//用车日报
+(NSURLSessionDataTask*)getdailyCarDataWithPage:(int)page andBlock:(void(^)(id obj,NSError * error))block
{
    NSString * path = [NSString stringWithFormat:DailyCarUrl,page];
    return [[AFAppDotNetAPIClient sharedClient]GET:path parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        if (block) {
            block(responseObject,nil);
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"error = %@",error.localizedDescription);
        block(nil,error);
    }];
}

+(NSURLSessionDataTask*)getdailyDeatilesWith:(NSNumber*)getId andBlock:(void(^)(id obj,NSError * error))block
{
    NSString * path = [NSString stringWithFormat:dailyDeatilesUrl,getId];
    return [[AFAppDotNetAPIClient sharedClient]GET:path parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        if (block) {
            block(responseObject,nil);
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"error = %@",error.localizedDescription);
        block(nil,error);
    }];
    
}



@end






































































