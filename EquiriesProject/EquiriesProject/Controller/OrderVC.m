//
//  OrderVC.m
//  违章查询助手
//
//  Created by qianfeng on 15/10/26.
//  Copyright (c) 2015年 LY. All rights reserved.
//

//
//  *************** 我的订单 ********************
//


#import "OrderVC.h"

@interface OrderVC ()

@end

@implementation OrderVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self CreateTitleView];
}

//创建导航栏
-(void)CreateTitleView
{
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 150, 40)];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:22];
    label.text = @"我的订单";
    [self.view addSubview:label];
    self.navigationItem.titleView = label;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
