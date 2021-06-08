//
//  CityVC.m
//  违章查询助手
//
//  Created by qianfeng on 15/10/26.
//  Copyright (c) 2015年 LY. All rights reserved.
//

#import "CityVC.h"
#import "ChineseToPinyin.h"
#import "AddDriveVC.h"
#import "LiycRequest.h"

@interface CityVC ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation CityVC
{
    UITableView * _tableView;
    NSMutableArray * arr;
    NSMutableArray * array;
    NSMutableArray * _dataArray;
    NSMutableArray * citynameArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    arr = [NSMutableArray array];
    citynameArray = [NSMutableArray array];
    for (int i=65; i<91; i++) {
        NSString * string = [NSString stringWithFormat:@"%C",(unichar)i];
        [arr addObject:string];
    }
    [self getData];
    [self createTableView];
}

//数据获取
-(void)getData
{
    [LiycRequest getAddressWithBlock:^(id obj, NSError *error) {
        NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:obj options:NSJSONReadingMutableContainers error:nil];
        NSDictionary * result = dic[@"result"];
        NSArray * items = result[@"items"];
        _dataArray = [NSMutableArray array];
        
        for (int i=0; i<26; i++) {
            array = [NSMutableArray array];
            for (NSDictionary * item in items) {
                addressModel * model = [[addressModel alloc]initWithDict:item];
                if ([model.fl isEqualToString:arr[i]]) {
                    [array addObject:model];
                }
            }
            [_dataArray addObject:array];
        }
        for (int i=0; i<_dataArray.count; i++) {
            if ([_dataArray[i] count] == 0) {
                [_dataArray removeObject:_dataArray[i]];
            }
        }
        for (int i = 0; i<_dataArray.count; i++) {
            addressModel * model = _dataArray[i][0];
            NSString * str = model.fl;
            [citynameArray addObject:str];
        }
        [_tableView reloadData];
    }];
}

//创建TableView
-(void)createTableView
{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, Width, Height-64) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataArray[section] count];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataArray.count;
}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return citynameArray[section];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [_tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    addressModel * model = _dataArray[indexPath.section][indexPath.row];
    cell.textLabel.text = model.pn;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    addressModel * model = _dataArray[indexPath.section][indexPath.row];
    [self.delegate sendString:model.pn];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
