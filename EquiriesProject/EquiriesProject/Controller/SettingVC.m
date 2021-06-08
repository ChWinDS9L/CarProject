//
//  SettingVC.m
//  违章查询助手
//
//  Created by qianfeng on 15/10/26.
//  Copyright (c) 2015年 LY. All rights reserved.
//


//
//  *************** 设置中心********************
//

#import "SettingVC.h"

@interface SettingVC ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation SettingVC
{
    UITableView * _tableView;
    NSMutableArray * _dataArray;
    NSArray * a1;
    NSArray * a2;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置中心";
    [self getData];
    [self CreateTitleView];
    [self CreateTableView];
}

//获取数据
-(void)getData
{
    a1 = @[@"推送设置",@"意见反馈",@"鼓励一下",@"精品应用",@"检查更新"];
    a2 = @[@"关于我们"];
    _dataArray = [NSMutableArray array];
    [_dataArray addObject:a1];
    [_dataArray addObject:a2];
}

//创建tableView
-(void)CreateTableView
{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, Width, 320) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.scrollEnabled = NO;
    _tableView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tableView];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataArray[section] count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{

    return 30;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataArray.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SettinfCell * cell = [_tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"SettinfCell" owner:nil options:nil]lastObject];
    }
    cell.Label.text = _dataArray[indexPath.section][indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:
            {
                
            }
                break;
            case 1:
            {
                
            }
                break;
            case 2:
            {
                
            }
                break;
            case 3:
            {
                
            }
                break;
            case 4:
            {
                UIAlertView * alert = [[UIAlertView alloc]initWithTitle:nil message:@"暂无更新,敬请期待" delegate:self cancelButtonTitle:@"好的" otherButtonTitles: nil];
                [alert show];
            }
                break;
                
            default:
                break;
        }
    }
    
    if (indexPath.section == 1) {
        switch (indexPath.row) {
            case 0:
            {
                
            }
                break;
                
            default:
                break;
        }
    }
}

//创建导航栏
-(void)CreateTitleView
{
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 150, 40)];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:22];
    label.text = @"设置中心";
    [self.view addSubview:label];
    self.navigationItem.titleView = label;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
