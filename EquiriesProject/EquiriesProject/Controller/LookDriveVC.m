//
//  LookDriveVC.m
//  违章查询助手
//
//  Created by qianfeng on 15/10/26.
//  Copyright (c) 2015年 LY. All rights reserved.
//

//
//  *************** 驾驶证查询 ********************
//


#import "LookDriveVC.h"
#import "AddDriveVC.h"

@interface LookDriveVC ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation LookDriveVC
{
    NSMutableArray * _dataArray;
    UITableView * _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self CreateTitleView];
    _dataArray = [NSMutableArray array];
    [self getData];
}

//获取数据
-(void)getData
{
    if (_dataArray.count == 0) {
        [self createView];
    }else{
        [self createTableView];
    }
}

-(void)createView
{
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 64, Width, 300)];
    [self.view addSubview:view];
    UIImageView * imageView1 = [[UIImageView alloc]init];
    imageView1.image = [UIImage imageNamed:@"no_driving_licence_list_arrows.png"];
    [view addSubview:imageView1];
    [imageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view.mas_top).offset(0);
        make.right.equalTo(view.mas_right).offset(-23);
        make.width.equalTo(@150);
        make.height.equalTo(@80);
    }];
    UIImageView * imageView2 = [[UIImageView alloc]init];
    imageView2.image = [UIImage imageNamed:@"no_driving_licence_list_icon.png"];
    [view addSubview:imageView2];
    [imageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imageView1.mas_bottom).offset(0);
        make.left.equalTo(view.mas_left).offset(50);
        make.right.equalTo(view.mas_right).offset(-50);
        make.height.equalTo(@220);
    }];

}

//创建TableView
-(void)createTableView
{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, Width, 150*_dataArray.count) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [_tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    return cell;
}

//创建导航栏
-(void)CreateTitleView
{
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 150, 40)];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:22];
    label.text = @"驾驶证查询";
    [self.view addSubview:label];
    self.navigationItem.titleView = label;
    
    UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 30)];
    [button setBackgroundImage:[UIImage imageNamed:@"btn_add"] forState:UIControlStateNormal];
    [self.view addSubview:button];
    UIBarButtonItem * item = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = item;
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
}

-(void)buttonClick
{
    AddDriveVC * addvc = [[AddDriveVC alloc]init];
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:addvc];
    [self presentViewController:nav animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
