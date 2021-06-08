//
//  AddDriveVC.m
//  违章查询助手
//
//  Created by qianfeng on 15/10/26.
//  Copyright (c) 2015年 LY. All rights reserved.
//

#import "AddDriveVC.h"
#import "SucShowView.h"

NSInteger a;
@interface AddDriveVC ()<sucShowViewDelegate>
{
    SucShowView * LookShowView;
}

@end

@implementation AddDriveVC
{
    UITableView * _tableView;
    UIView * view;
    int num;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self CreateTitleView];
    [self createView];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    UITextField * textField = (id)[self.view viewWithTag:20];
    textField.text = _cityName;
}

//创建导航栏
-(void)CreateTitleView
{
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 150, 40)];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:22];
    label.text = @"添加驾驶证";
    [self.view addSubview:label];
    self.navigationItem.titleView = label;
}

//创建View
-(void)createView
{
    NSArray * array = @[@"发证城市",@"驾驶证号",@"档案编号",@"证件姓名",@"初次领证日期"];
    NSArray * array1 = @[@"请选择城市",@"请输入完整驾驶证号",@"请输入完整档案编号",@"请输入正确的姓名",@"请选择初次领证日期"];
    NSArray * imageName = @[@"jiantou",@"publish_ask",@"publish_ask",@"",@"jiantou"];
    for (int i=0; i<array.count; i++) {
        view = [[UIView alloc]initWithFrame:CGRectMake(0, 84+70*i, Width, 40)];
        view.userInteractionEnabled = YES;
        view.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:view];
        UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(5, 10, 120, 20)];
        label.tag = 10+i;
        label.text = array[i];
        [view addSubview:label];
        UITextField * textField = [[UITextField alloc]initWithFrame:CGRectMake(125, 10, 220, 20)];
        textField.borderStyle = UITextBorderStyleNone;
        textField.placeholder = array1[i];
        textField.tag = 20+i;
        if (i == 0) {
            textField.text = _cityName;
        }
        [view addSubview:textField];
        UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(345, 10, 20, 20)];
        button.tag = 30+i;
        num = i;
        [button setBackgroundImage:[UIImage imageNamed:imageName[i]] forState:UIControlStateNormal];
        [view addSubview:button];
        [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    UIButton * button = [[UIButton alloc]init];
    [button setTitle:@"开始查询" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor colorWithRed:1 green:0.5 blue:0.6 alpha:1]];
    button.layer.cornerRadius = 10;
    button.layer.masksToBounds = YES;
    [self.view addSubview:button];
    [button addTarget:self action:@selector(equiriesClick) forControlEvents:UIControlEventTouchUpInside];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view.mas_bottom).offset(30);
        make.left.equalTo(self.view.mas_left).offset(10);
        make.right.equalTo(self.view.mas_right).offset(-10);
        make.height.equalTo(@40);
    }];
}

//查询按钮
-(void)equiriesClick
{
    NSMutableDictionary * dic = [NSMutableDictionary dictionary];
    for (int i=0; i<5; i++) {
        UITextField * textField = (id)[self.view viewWithTag:20+i];
        NSString * key = [NSString stringWithFormat:@"item%d",i];
        [dic setObject:textField.text forKey:key];
    }
}

//view上的button点击事件
-(void)btnClick:(UIButton*)button
{
    switch (button.tag) {
        case 30:
        {
            CityVC * vc = [[CityVC alloc]init];
            vc.delegate = self;
            UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:vc];
            [self presentViewController:nav animated:YES completion:nil];
        }
            break;
        case 31:
        {
            a = 0;
            [self createLookView];
        }
            break;
        case 32:
        {
            a = 1;
            [self createLookView];
        }
            break;
        case 33:
        {
            
        }
            break;
        case 34:
        {
            NSDate * date = [NSDate dateWithTimeIntervalSinceNow:9000];
            _pickview = [[ZHPickView alloc]initDatePickWithDate:date datePickerMode:UIDatePickerModeDate isHaveNavControler:NO];
            _pickview.delegate = self;
            [_pickview show];
        }
            break;
        default:
            break;
    }
}

-(void)sendString:(NSString *)string
{
    _cityName = string;
}


#pragma mark ZhpickVIewDelegate,sucShowViewDelegate

-(void)toobarDonBtnHaveClick:(ZHPickView *)pickView resultString:(NSString *)resultString{
    NSString * str = [resultString substringToIndex:10];
    UITextField * textField = (id)[self.view viewWithTag:24];
    textField.text = str;
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

//点击空白键盘消失
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (int i=0; i<5; i++) {
        UITextField * text1 = (id)[self.view viewWithTag:20+i];
        [text1 resignFirstResponder];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
