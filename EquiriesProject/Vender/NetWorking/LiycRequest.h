//
//  LiycRequest.h
//  003AFN二次封装
//
//  Created by qianfeng on 15/10/22.
//  Copyright (c) 2015年 HXH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFAppDotNetAPIClient.h"

#define urlString @"http://wz.qichecdn.com/ashx/GetWeather.ashx?&cityid=110100&token=2&platform=2&version=3.2.0&qd=kqzs_cpa_test_w"

#define addressUrlStr @"http://wz.qichecdn.com/ashx/UpdateAllCityNew.ashx?&token=2&platform=2&version=3.2.0&qd=kqzs_cpa_test_w"

@interface LiycRequest : NSObject

////通过get获取天气预报的数据
+(NSURLSessionDataTask*)getWetherWithBlock:(void(^)(id obj,NSError * error))block;

//获取地址
+(NSURLSessionDataTask*)getAddressWithBlock:(void(^)(id obj,NSError * error))block;

//品牌找车
+(NSURLSessionDataTask*)getBrandCarWithBlock:(void(^)(id obj,NSError * error))block;

//行车生活
+(NSURLSessionDataTask*)getDriveLifeWithBlock:(void(^)(id obj,NSError * error))block;

//用车日报
+(NSURLSessionDataTask*)getdailyCarDataWithPage:(int)page andBlock:(void(^)(id obj,NSError * error))block;

//用车日报详情
+(NSURLSessionDataTask*)getdailyDeatilesWith:(NSNumber*)getId andBlock:(void(^)(id obj,NSError * error))block;

@end



































