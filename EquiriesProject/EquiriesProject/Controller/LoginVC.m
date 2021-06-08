//
//  LoginVC.m
//  违章查询助手
//
//  Created by qianfeng on 15/10/26.
//  Copyright (c) 2015年 LY. All rights reserved.
//

//
//  *************** 登录 ********************
//


#import "LoginVC.h"

@interface LoginVC ()<UITextFieldDelegate>

@end

@implementation LoginVC
{
    UITextField * userTextField;
    UITextField * passwordTextField;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1];
    [self creatNav];
    [self createTextField];
}

-(void)createTextField
{
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 84, Width, 100)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    UIImageView * imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 30, 30)];
    imageView1.image = [UIImage imageNamed:@"login_phone_icon"];
    view.layer.borderColor = [UIColor grayColor].CGColor;
    view.layer.borderWidth = 1;
    [view addSubview:imageView1];
    userTextField = [[UITextField alloc]initWithFrame:CGRectMake(50, 10, Width-50, 30)];
    userTextField.borderStyle = UITextBorderStyleNone;
    userTextField.placeholder = @"請輸入手機號";
    userTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [view addSubview:userTextField];
    
    UIImageView * imageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(10, 60, 30, 30)];
    imageView2.image = [UIImage imageNamed:@"txt_pwd_bg"];
    [view addSubview:imageView2];
    passwordTextField = [[UITextField alloc]initWithFrame:CGRectMake(50, 60, Width-50, 30)];
    passwordTextField.borderStyle = UITextBorderStyleNone;
    passwordTextField.placeholder = @"請輸入密碼";
    passwordTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [view addSubview:passwordTextField];
    
    UIButton * forgetPass = [[UIButton alloc]init];
    [forgetPass setTitle:@"忘记密码?" forState:UIControlStateNormal];
    [forgetPass setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    forgetPass.titleLabel.textAlignment = NSTextAlignmentRight;
    forgetPass.titleLabel.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:forgetPass];
    [forgetPass addTarget:self action:@selector(forgetClick) forControlEvents:UIControlEventTouchUpInside];
    [forgetPass mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view.mas_bottom).offset(15);
        make.right.equalTo(self.view.mas_right).offset(10);
        make.width.equalTo(@150);
        make.height.equalTo(@40);
        
    }];
    
    UIButton * loginBtn = [[UIButton alloc] init];
    [loginBtn setBackgroundColor:[UIColor grayColor]];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    loginBtn.layer.cornerRadius = 10;
    loginBtn.layer.masksToBounds = YES;
    [self.view addSubview:loginBtn];
    [loginBtn addTarget:self action:@selector(loginClick) forControlEvents:UIControlEventTouchUpInside];
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(forgetPass.mas_bottom).offset(20);
        make.left.equalTo(self.view.mas_left).offset(10);
        make.right.equalTo(self.view.mas_right).offset(-10);
        make.height.equalTo(@50);
    }];
    
    UIButton * ThirdlogBtn = [[UIButton alloc]init];
    [ThirdlogBtn setTitle:@"第三方登录" forState:UIControlStateNormal];
    [ThirdlogBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    ThirdlogBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:ThirdlogBtn];
    [ThirdlogBtn addTarget:self action:@selector(thirdloginClick) forControlEvents:UIControlEventTouchUpInside];
    [ThirdlogBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(loginBtn.mas_bottom).offset(10);
        make.left.equalTo(self.view.mas_left).offset(0);
        make.width.equalTo(@150);
        make.height.equalTo(@30);
    }];
}

//第三方登录
-(void)thirdloginClick
{
    
}

//登录
-(void)loginClick
{
    if([self isPhoneNumber]){
        
        NSLog(@"是手机号");
        
    }else{
        
        userTextField.text = @"";
        
        [self shake];
        
    }
    
}
-(BOOL)isPhoneNumber
{
    BOOL isPhone = [self checkWhetherCellNumberLegal:userTextField.text];
    if (isPhone) {
        return YES;//是手机号返回yes
    }else{
        return NO;
    }
}
//判断手机号📱
-(BOOL) checkWhetherCellNumberLegal:(NSString *)phone
{
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:phone];
}

//晃动方法
- (void)shake
{
    CAKeyframeAnimation *keyAn = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    [keyAn setDuration:0.6f];//晃动时间
    float offset= 5;//晃动幅度
    NSArray *array = [[NSArray alloc] initWithObjects:
                      [NSValue valueWithCGPoint:CGPointMake(self.view.center.x, self.view.center.y)],
                      [NSValue valueWithCGPoint:CGPointMake(self.view.center.x-offset, self.view.center.y)],
                      [NSValue valueWithCGPoint:CGPointMake(self.view.center.x+offset, self.view.center.y)],
                      [NSValue valueWithCGPoint:CGPointMake(self.view.center.x, self.view.center.y)],
                      [NSValue valueWithCGPoint:CGPointMake(self.view.center.x-offset, self.view.center.y)],
                      [NSValue valueWithCGPoint:CGPointMake(self.view.center.x+offset, self.view.center.y)],
                      [NSValue valueWithCGPoint:CGPointMake(self.view.center.x, self.view.center.y)],
                      [NSValue valueWithCGPoint:CGPointMake(self.view.center.x-offset, self.view.center.y)],
                      [NSValue valueWithCGPoint:CGPointMake(self.view.center.x+offset, self.view.center.y)],
                      [NSValue valueWithCGPoint:CGPointMake(self.view.center.x, self.view.center.y)],
                      nil];
    [keyAn setValues:array];
    NSArray *times = [[NSArray alloc] initWithObjects:
                      [NSNumber numberWithFloat:0.1f],
                      [NSNumber numberWithFloat:0.2f],
                      [NSNumber numberWithFloat:0.3f],
                      [NSNumber numberWithFloat:0.4f],
                      [NSNumber numberWithFloat:0.5f],
                      [NSNumber numberWithFloat:0.6f],
                      [NSNumber numberWithFloat:0.7f],
                      [NSNumber numberWithFloat:0.8f],
                      [NSNumber numberWithFloat:0.9f],
                      [NSNumber numberWithFloat:1.0f],
                      nil];
    [keyAn setKeyTimes:times];
    [self.view.layer addAnimation:keyAn forKey:@"TextAnim"];
}


//忘记密码
-(void)forgetClick
{
    
}

//点击空白键盘消失
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [userTextField resignFirstResponder];
    [passwordTextField resignFirstResponder];
}

//创建导航栏
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
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 150, 40)];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:22];
    label.text = @"登录";
    [self.view addSubview:label];
    self.navigationItem.titleView = label;
    
    UIButton * button1 = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 30)];
    [button1 setTitle:@"注册" forState:UIControlStateNormal];
    [self.view addSubview:button1];
    UIBarButtonItem * item1 = [[UIBarButtonItem alloc]initWithCustomView:button1];
    self.navigationItem.rightBarButtonItem = item1;
    [button1 addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
}

-(void)buttonClick
{
    PreferentialVC * vc = [[PreferentialVC alloc]init];
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:vc];
    [self presentViewController:nav animated:YES completion:nil];
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
