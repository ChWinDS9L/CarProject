//
//  CarManagerVC.m
//  违章查询助手
//
//  Created by qianfeng on 15/10/26.
//  Copyright (c) 2015年 LY. All rights reserved.
//

//
//  *************** 车辆管理 ********************
//


#import "CarManagerVC.h"
#import "AddCarVC.h"

@interface CarManagerVC ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation CarManagerVC
{
    UITableView * _tableView;
    NSMutableArray * _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self CreateTitleView];
    [self createTableView];
    [self CreateButton];
}

//创建TableView
-(void)createTableView
{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, Width, _dataArray.count*150) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tableView];
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

//创建ImageView
-(void)CreateButton
{
    UIButton * button = [[UIButton alloc]init];
    [button setBackgroundImage:[UIImage imageNamed:@"ic_list_footer_addcar_no"] forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(150);
        make.top.equalTo(_tableView.mas_bottom).offset(10);
        make.right.equalTo(self.view.mas_right).offset(-150);
        make.height.equalTo(@100);
    }];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    UILabel * label = [[UILabel alloc]init];
    label.text = @"点击添加车辆";
    label.font = [UIFont systemFontOfSize:12];
    label.textColor = [UIColor grayColor];
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(150);
        make.top.equalTo(button.mas_bottom).offset(10);
        make.right.equalTo(self.view.mas_right).offset(-150);
        make.height.equalTo(@20);
    }];

}


//创建导航栏
-(void)CreateTitleView
{
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 150, 40)];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:22];
    label.text = @"车辆管理";
    [self.view addSubview:label];
    self.navigationItem.titleView = label;
    
    UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 30)];
    [button setBackgroundImage:[UIImage imageNamed:@"btn_add"] forState:UIControlStateNormal];
    [self.view addSubview:button];
    UIBarButtonItem * item = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = item;
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
}

//车辆添加(导航栏有按钮以及添加的按钮监听)
-(void)buttonClick
{
    AddCarVC * add = [[AddCarVC alloc]init];
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:add];
    [self presentViewController:nav animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
