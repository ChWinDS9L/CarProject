//
//  baseController.m
//  违章查询助手
//
//  Created by qianfeng on 15/10/26.
//  Copyright (c) 2015年 LY. All rights reserved.
//

#import "baseController.h"

@interface baseController ()

@end

@implementation baseController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1];
    [self creatNav];
}

-(void)creatNav
{
    UINavigationBar * bar=self.navigationController.navigationBar;
    [bar setBackgroundImage:[UIImage imageNamed:@"custom_dialog_btn_bg"] forBarMetrics:UIBarMetricsDefault];
    [self.view addSubview:bar];
    
    UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 30)];
    [button setImage:[UIImage imageNamed:@"back_press"] forState:UIControlStateNormal];
    [self.view addSubview:button];
    UIBarButtonItem * item = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = item;
    
    [button addTarget:self action:@selector(ReturnClick) forControlEvents:UIControlEventTouchUpInside];
}

-(void)ReturnClick
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
