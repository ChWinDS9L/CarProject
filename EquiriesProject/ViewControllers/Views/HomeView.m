//
//  HomeView.m
//  违章查询助手
//
//  Created by qianfeng on 15/10/24.
//  Copyright (c) 2015年 LY. All rights reserved.
//

#import "HomeView.h"
#import "home.h"
#import "twohome.h"
#import "Threehome.h"
#import "LiycRequest.h"
#import "CarLife.h"
#import "BreakRulesVC.h"
#import "CarInsurance.h"
#import "CarPrice.h"
@interface HomeView ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation HomeView
{
    UITableView * _tabView;
    NSArray * array;

}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"违章查询";
    self.automaticallyAdjustsScrollViewInsets=NO;
    self.view.backgroundColor=[UIColor whiteColor];
    [self CreateData];
    [self creatNav];
    [self creatNavBar];
    [self creatTabView];
}

-(void)CreateData
{
    [LiycRequest getWetherWithBlock:^(id obj, NSError *error) {
        if (!error) {
            NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:obj options:NSJSONReadingMutableContainers error:nil];
            NSDictionary * dic1 = dic[@"result"];
            array = dic1[@"items"];
            [self creatHeadView];
        }
    }];

}

-(void)creatTabView
{
    _tabView=[[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height-64) style:UITableViewStyleGrouped];
    _tabView.delegate=self;
    _tabView.dataSource=self;
    _tabView.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tabView];
    
    [self creatHeadView];

}
-(void)creatHeadView
{
    UIView * view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 200) ];
    view.backgroundColor=[UIColor whiteColor];
    
   home * headView=[[[NSBundle mainBundle] loadNibNamed:@"home" owner:nil options:nil] lastObject];

    if (array == nil) {
        
    }else{
        Wether * model = [[Wether alloc]initWithDict:array[0]];
        headView.WashCar.text = model.xiche;
        headView.temperature.text = [NSString stringWithFormat:@"%@C~%@C",model.lowtemperature,model.hightemperature];
        headView.Time.text = model.date;
        headView.Weather.text = model.weathertext;
    }
    
    [headView.Drive addTarget:self action:@selector(oneBtn) forControlEvents:UIControlEventTouchUpInside];
    [headView.CityBtn addTarget:self action:@selector(twoBtn) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:headView];
    _tabView.tableHeaderView=view;
    
}
#pragma mark----UITableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;

}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        return 200;
        
    }else if (section==2)
    {
        return 100;

    }
    return 0;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section==1) {
        UIView * view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 200) ];
        view.backgroundColor=[UIColor whiteColor];
        
        NSArray * nameArr=@[@"违章高发地",@"实时路况",@"加油充值",@"低价车险",@"汽车报价",@"行车生活"];
        NSArray * imageArr=@[@"ic_li_menu_pm_bad.png",@"ic_li_menu_traffic.png",@"ic_near_jiayouzhan.png",@"identifity_icon_v.png",@"ic_wzprice.png",@"ic_nearby.png"];
        
        for (int i=0; i<nameArr.count; i++) {
            
            twohome * headView=[[[NSBundle mainBundle] loadNibNamed:@"twohome" owner:nil options:nil] lastObject];
            
            headView.frame=CGRectMake(i%3*125, i/3*100, 125, 100);
            headView.Image.image=[UIImage imageNamed:imageArr[i]];
            headView.active.text=nameArr[i];
            headView.Btn.tag=10+i;
            [headView.Btn addTarget:self action:@selector(TwoBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            [view addSubview:headView];
        }
        return view;
        
    }else if(section==2)
    {
        UIView * view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 100) ];
        view.backgroundColor=[UIColor whiteColor];
        
        Threehome * headView=[[[NSBundle mainBundle] loadNibNamed:@"Threehome" owner:nil options:nil] lastObject];
      
        [headView.Btn addTarget:self action:@selector(ThreeBtn) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:headView];

        return view;
    }

    return nil;
}

#pragma mark-----Button
-(void)oneBtn
{


}

-(void)twoBtn
{
    
    
}

-(void)TwoBtnClick:(UIButton *)btn
{
    switch (btn.tag) {
        case 10:
        {
            BreakRulesVC * vc = [[BreakRulesVC alloc]init];
            UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:vc];
            [self presentViewController:nav animated:YES completion:nil];
        }
            
            break;
        case 11:
            
            
            break;
        case 12:
            
            
            break;
        case 13:
        {
            CarInsurance * insurance=[[CarInsurance alloc]init];
            UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:insurance];
            [self presentViewController:nav animated:YES completion:nil];
            
        }
            
            break;
        case 14:
        {
            CarPrice * price=[[CarPrice alloc]init];
            UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:price];
            [self presentViewController:nav animated:YES completion:nil];
            
            
        }
            
            break;
        case 15:
        {
            CarLife * carlife=[[CarLife alloc]init];
            UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:carlife];
            [self presentViewController:nav animated:YES completion:nil];
        }
            
            break;
        default:
            break;
    }

}

-(void)ThreeBtn
{

    NSLog(@"点击了");

}
#pragma mark-------creatNavigation
-(void)creatNav
{
    UINavigationBar * bar=self.navigationController.navigationBar;
    [bar setBackgroundImage:[UIImage imageNamed:@"custom_dialog_btn_bg"] forBarMetrics:UIBarMetricsDefault];
    [self.view addSubview:bar];
    
}

-(void)creatNavBar
{
    
    UIButton * left=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    
    [left setBackgroundImage:[UIImage imageNamed:@"btn_more"] forState:UIControlStateNormal];
    UIButton * right=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    [right setBackgroundImage:[UIImage imageNamed:@"btn_add"] forState:UIControlStateNormal];
    
    UIBarButtonItem * leftItem=[[UIBarButtonItem alloc]initWithCustomView:left];
    UIBarButtonItem * rightItem=[[UIBarButtonItem alloc]initWithCustomView:right];
    self.navigationItem.leftBarButtonItem=leftItem;
    self.navigationItem.rightBarButtonItem=rightItem;
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
