//
//  AddCarVC.m
//  违章查询助手
//
//  Created by qianfeng on 15/10/27.
//  Copyright (c) 2015年 LY. All rights reserved.
//

#import "AddCarVC.h"


extern NSInteger a;

@interface AddCarVC ()<UITableViewDataSource,UITableViewDelegate,sucShowViewDelegate>
{
    SucShowView * LookShowView;
}


@end

@implementation AddCarVC
{
    UITableView * _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createTableView];
}

//创建tableView
-(void)createTableView
{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, Width, 380)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.scrollEnabled = NO;
    [self.view addSubview:_tableView];
    
    UIButton * button = [[UIButton alloc]init];
    [button setTitle:@"开始查询" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor colorWithRed:1 green:0.5 blue:0.6 alpha:1]];
    button.layer.cornerRadius = 10;
    button.layer.masksToBounds = YES;
    [self.view addSubview:button];
    [button addTarget:self action:@selector(equiriesClick) forControlEvents:UIControlEventTouchUpInside];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_tableView.mas_bottom).offset(30);
        make.left.equalTo(self.view.mas_left).offset(10);
        make.right.equalTo(self.view.mas_right).offset(-10);
        make.height.equalTo(@40);
    }];

}

-(void)equiriesClick
{
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 6;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{

    return 20;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray * textArray = @[@"",@"请选择车系(选填)",@"请选择城市",@"请输入车牌号",@"请输入全部的发动机号",@"请输入爱车昵称(选填)"];
    NSArray * titleArray = @[@"号牌类型",@"车 系",@"查询城市",@"车牌号码",@"发动机号",@"备注"];
    NSArray * imageName = @[@"publish_ask",@"jiantou2.png",@"jiantou2.png",@"",@"publish_ask",@""];
    TableViewCell * oneCell = [_tableView dequeueReusableCellWithIdentifier:@"oneCell"];
    AddCarTwocell * twoCell = [_tableView dequeueReusableCellWithIdentifier:@"twoCell"];
    addCarThreeCell * threeCell = [_tableView dequeueReusableCellWithIdentifier:@"threeCell"];
    if (!oneCell) {
        oneCell = [[[NSBundle mainBundle]loadNibNamed:@"TableViewCell" owner:nil options:nil]lastObject];
    }
    if (!twoCell) {
        twoCell = [[[NSBundle mainBundle]loadNibNamed:@"AddCarTwocell" owner:nil options:nil]lastObject];
    }
    if (!threeCell) {
        threeCell = [[[NSBundle mainBundle]loadNibNamed:@"addCarThreeCell" owner:nil options:nil]lastObject];
    }
    if (indexPath.section == 0) {
        threeCell.carType.tag = 5;
        threeCell.imageButton.tag = indexPath.section;
        [threeCell.carType addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [threeCell.imageButton addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        threeCell.titleLabel.text = titleArray[indexPath.section];
        return threeCell;
    }else if (indexPath.section == 3 || indexPath.section == 6)
    {
        twoCell.titleLabel.text = titleArray[indexPath.section];
        twoCell.textField.placeholder = textArray[indexPath.section];
        return twoCell;
    }else{
        oneCell.titleLabel.text = titleArray[indexPath.section];
        [oneCell.rightButton setBackgroundImage:[UIImage imageNamed:imageName[indexPath.section]] forState:UIControlStateNormal];
        oneCell.rightButton.tag = indexPath.section;
        [oneCell.rightButton addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        oneCell.textField.placeholder = textArray[indexPath.section];
        return oneCell;
    }
}

-(void)btnClick:(UIButton*)button
{
    switch (button.tag) {
        case 0:
        {
            //号牌类型
            a = 3;
            [self createLookView];
        }
            break;
        case 1:
        {
            //车系
        }
            break;
        case 2:
        {
            //查询城市
        }
            break;
        case 4:
        {
            //发动机号
            a = 4;
            [self createLookView];
        }
            break;
        case 5:
        {
            //选择车类型
        }
            break;
        default:
            break;
    }
}

-(void)createLookView
{
    LookShowView  = [[SucShowView alloc] initWithFrame:CGRectMake(100, 200, 200, 160)];
    LookShowView.delegate = self;
    [LookShowView looklookView];
}

-(void)disappear
{
    [LookShowView disappearView];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
