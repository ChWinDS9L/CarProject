//
//  DesDriving.m
//  违章查询助手
//
//  Created by qianfeng on 15/10/28.
//  Copyright (c) 2015年 LY. All rights reserved.
//

#import "DesDriving.h"

@interface DesDriving ()

@end

@implementation DesDriving

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"e代驾";
    [self creatNav];
    [self creatNavBar];
    _webView=[[UIWebView alloc]initWithFrame:CGRectMake(0, 64, WIDTH, HEIGHT-64)];
    NSURLRequest * request=[NSURLRequest requestWithURL:[NSURL URLWithString:DesDrivingURL]];
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [self.view addSubview:_webView];
    [_webView loadRequest:request];
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
}

-(void)creatNav
{
    UINavigationBar * bar=self.navigationController.navigationBar;
    [bar setBackgroundImage:[UIImage imageNamed:@"custom_dialog_btn_bg"] forBarMetrics:UIBarMetricsDefault];
    [self.view addSubview:bar];
}

-(void)creatNavBar
{
    UIButton * left=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
    
    [left setBackgroundImage:[UIImage imageNamed:@"back_normal"] forState:UIControlStateNormal];
    [left addTarget:self action:@selector(leftButton) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem * leftItem=[[UIBarButtonItem alloc]initWithCustomView:left];
    self.navigationItem.leftBarButtonItem=leftItem;
    
}

-(void)leftButton
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
