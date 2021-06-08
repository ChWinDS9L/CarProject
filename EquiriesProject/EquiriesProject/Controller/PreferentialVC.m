//
//  PreferentialVC.m
//  违章查询助手
//
//  Created by qianfeng on 15/10/26.
//  Copyright (c) 2015年 LY. All rights reserved.
//

//
//  *************** 优惠劵 ********************
//  **************** 注册 **********************
//


#import "PreferentialVC.h"
#import "User.h"
#import "CoreData+MagicalRecord.h"
#import <CoreData/CoreData.h>

@interface PreferentialVC ()<UIAlertViewDelegate>

@end

@implementation PreferentialVC
{
    UITextField * userTextField;
    UITextField * passwordTextField;
    UITextField * valityTextField;
    NSString * verifyStr;
    BOOL _isResigeter;
    BOOL _isPress;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"路径:%@",NSHomeDirectory());
    [self CreateTitleView];
    [self createTextField];
}

//创建导航栏
-(void)CreateTitleView
{
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 150, 40)];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:22];
    label.text = @"注册";
    [self.view addSubview:label];
    self.navigationItem.titleView = label;
    
    UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 30)];
    [button setTitle:@"登录" forState:UIControlStateNormal];
    [self.view addSubview:button];
    UIBarButtonItem * item = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = item;
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
}


-(void)createTextField
{
    NSArray * imageNameArr = @[@"login_phone_icon",@"login_yzm_icon",@"txt_pwd_bg"];
    NSArray * placeholdertext = @[@"請輸入手機號",@"請輸入验证码",@"請輸入至少六位密码"];
    for (int i=0; i<3; i++) {
        UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 84+50*i, Width, 50)];
        view.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:view];
        UIImageView * imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 30, 30)];
        imageView1.image = [UIImage imageNamed:imageNameArr[i]];
        view.layer.borderColor = [UIColor grayColor].CGColor;
        view.layer.borderWidth = 1;
        [view addSubview:imageView1];
        if (i == 0) {
            userTextField = [[UITextField alloc]initWithFrame:CGRectMake(50, 10, Width-120, 30)];
        }else{
            userTextField = [[UITextField alloc]initWithFrame:CGRectMake(50, 10, Width-50, 30)];
        }
        userTextField.tag = 10+i;
        userTextField.borderStyle = UITextBorderStyleNone;
        userTextField.placeholder = placeholdertext[i];
        userTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        [view addSubview:userTextField];
        
        if (i == 0) {
            UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(Width-70, 10, 65, 30)];
            button.backgroundColor = [UIColor grayColor];
            button.alpha = 0.5;
            [button setTitle:@"发送验证码" forState:UIControlStateNormal];
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont systemFontOfSize:12];
            button.layer.cornerRadius = 5;
            button.layer.masksToBounds = YES;
            [view addSubview:button];
            [button addTarget:self action:@selector(sendClick) forControlEvents:UIControlEventTouchUpInside];
        }
        
    }
    
    passwordTextField = (id)[self.view viewWithTag:12];
    
    UIButton * resigtersBtn = [[UIButton alloc]init];
    resigtersBtn.backgroundColor = [UIColor grayColor];
    resigtersBtn.alpha = 0.5;
    [resigtersBtn setTitle:@"注册" forState:UIControlStateNormal];
    [resigtersBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    resigtersBtn.layer.cornerRadius = 10;
    resigtersBtn.layer.masksToBounds = YES;
    [self.view addSubview:resigtersBtn];
    [resigtersBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(10);
        make.right.equalTo(self.view.mas_right).offset(-10);
        make.top.equalTo(passwordTextField.mas_bottom).offset(25);
        make.height.equalTo(@50);
    }];
    [resigtersBtn addTarget:self action:@selector(resigtersClick) forControlEvents:UIControlEventTouchUpInside];
    
}

//发送验证码
-(void)sendClick
{
    UITextField * userText = (id)[self.view viewWithTag:10];
    NSArray * array = [User MR_findAll];
    if([self isPhoneNumber]){
        
        if (array.count != 0) {
            for (User * user in array) {
                if ([user.username isEqualToString:userText.text]) {
                    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:nil message:@"该用户已存在" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
                    [alert show];
                    userText.text = @"";
                    break;
                }
            }
            if (userText.text.length != 0) {
                verifyStr = [NSString stringWithFormat:@"%c%c%d",arc4random()%26+'A',arc4random()%26+'a',arc4random()%10];
                UITextField * verifytextField = (id)[self.view viewWithTag:11];
                verifytextField.text = verifyStr;
            }
        }
        
    }else{
        
        UITextField * userText = (id)[self.view viewWithTag:10];
        userText.text = @"";
      
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:nil message:@"请输入正确的手机号" delegate:self cancelButtonTitle:@"好的" otherButtonTitles: nil];
        
        [alert show];
    }
    _isPress = YES;

}


//注册
-(void)resigtersClick
{
    UITextField * text1 = (id)[self.view viewWithTag:10];
    UITextField * text = (id)[self.view viewWithTag:11];
    UITextField * text2 = (id)[self.view viewWithTag:12];
    if (text1.text.length == 0 || text.text.length == 0 || text2.text.length == 0) {
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:nil message:@"请输入完整用户信息" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alert show];
    }else{
        if (text2.text.length <6 || text2.text.length >16) {
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:nil message:@"请输入6~16位的密码" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
            [alert show];
        }else{
            if (_isPress == YES) {
                User * user = [User MR_createEntity];
                user.username = text1.text;
                user.password = text2.text;
                [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
                NSLog(@"路径:%@",NSHomeDirectory());
                UIAlertView * alert = [[UIAlertView alloc] initWithTitle:nil message:@"注册成功" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:@"去登录", nil];
                [alert show];
                text1.text = @"";
                text.text = @"";
                text2.text = @"";
            }else{
                UIAlertView * alert = [[UIAlertView alloc]initWithTitle:nil message:@"请获取验证码" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
                text.text = @"";
                [alert show];
            }
        }
    }
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        
        [self buttonClick];
    }
}

//判断是否是手机号
-(BOOL)isPhoneNumber
{
    UITextField * userText = (id)[self.view viewWithTag:10];
    BOOL isPhone = [self checkWhetherCellNumberLegal:userText.text];
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


//点击空白键盘消失
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (int i=0; i<3; i++) {
        UITextField * textField = (id)[self.view viewWithTag:10+i];
        [textField resignFirstResponder];
    }
}

//导航栏右侧控件
-(void)buttonClick
{
    LoginVC * vc = [[LoginVC alloc]init];
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:vc];
    [self presentViewController:nav animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
