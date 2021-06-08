//
//  Fundction.m
//  违章查询
//
//  Created by qianfeng on 15/10/24.
//  Copyright (c) 2015年 LY. All rights reserved.
//

#import "Fundction.h"
#import "AFHTTPRequestOperationManager.h"

@implementation Fundction : NSObject 

+(void)getWithUrl:(NSString*)url success:(AFSuccessCall)success failure:(AFFailureCall)failure
{
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFCompoundResponseSerializer serializer];
    //[MMProgressHUD showWithTitle:nil status:@"加载中..."];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //[MMProgressHUD dismissWithSuccess:@"加载成功"];
        success(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //[MMProgressHUD dismissWithError:@"加载失败"];
        failure(error);
    }];

}

@end
