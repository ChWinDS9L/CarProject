//
//  CarReportDefail.h
//  违章查询助手
//
//  Created by qianfeng on 15/10/27.
//  Copyright (c) 2015年 LY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CarReportModel.h"
@interface CarReportDefail : UIViewController
{
    UIWebView * webView;

}

@property(nonatomic,strong)CarReportModel * model;

@end
