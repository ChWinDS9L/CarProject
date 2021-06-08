//
//  CarReportDefail.m
//  违章查询助手
//
//  Created by qianfeng on 15/10/27.
//  Copyright (c) 2015年 LY. All rights reserved.
//

#import "CarReportDefail.h"
#import "LXActivity.h"

@interface CarReportDefail ()<LXActivityDelegate>

@end

@implementation CarReportDefail
//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        
//    }
//    return self;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatNav];
    [self creatNavBar];
    webView=[[UIWebView alloc]initWithFrame:CGRectMake(0, 64, WIDTH, HEIGHT-64)];
    NSURLRequest * request=[NSURLRequest requestWithURL:[NSURL URLWithString:_model.newsurl]];
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [self.view addSubview:webView];
    [webView loadRequest:request];
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
    
    UIButton * right=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];;
    
    [right setBackgroundImage:[UIImage imageNamed:@"btn_share"] forState:UIControlStateNormal];
    [right addTarget:self action:@selector(rightButton) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem * rightItem=[[UIBarButtonItem alloc]initWithCustomView:right];
    self.navigationItem.rightBarButtonItem=rightItem;

}

-(void)leftButton
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)rightButton
{
   // NSArray *shareButtonTitleArray = [[NSArray alloc] init];
   // NSArray *shareButtonImageNameArray = [[NSArray alloc] init];
    NSLog(@"2222222");
    NSArray * shareButtonTitleArray=@[@"微信",@"朋友圈",@"QQ空间",@"微博"];
 NSArray * shareButtonImageNameArray=@[@"ic_share_weixinmsg",@"ic_share_weixinfriend",@"ic_share_qzone",@"ic_share_weibo"];
    
    LXActivity * activity = [[LXActivity alloc]initWithTitle:@"分享" delegate:self cancelButtonTitle:@"取消" ShareButtonTitles:shareButtonTitleArray withShareButtonImagesName:shareButtonImageNameArray];
    [activity showInView:self.view];
    NSLog(@"1111111");

}

#pragma mark - LXActivityDelegate
- (void)didClickOnImageIndex:(NSInteger *)imageIndex
{
    NSLog(@"%d",(int)imageIndex);
}

- (void)didClickOnCancelButton
{
    NSLog(@"didClickOnCancelButton");
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
