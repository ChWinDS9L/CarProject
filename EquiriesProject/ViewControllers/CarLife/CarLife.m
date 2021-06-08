//
//  CarLife.m
//  违章查询助手
//
//  Created by qianfeng on 15/10/25.
//  Copyright (c) 2015年 LY. All rights reserved.
//

#import "CarLife.h"
#import "OneCar.h"
#import "twoCar.h"
#import "three.h"
#import "FourCar.h"
#import "FiveCar.h"
#import "UIImageView+AFNetworking.h"
#import "CarReport.h"
#import "Accident.h"
#import "Rumour.h"
#import "DesDriving.h"
@interface CarLife ()<SDCycleScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>

@end

@implementation CarLife
{
    NSMutableArray * _Headimage;
    NSMutableArray * _Headtitle;

    NSMutableArray * _Cellimage;
     NSMutableArray * _Celltitle;
     NSMutableArray * _Celldesc;
    UITableView * _tabView;
    
}

-(void)creatData
{
    _Headimage=[NSMutableArray array];
    _Headtitle=[NSMutableArray array];
    _Celldesc=[NSMutableArray array];
    _Cellimage=[NSMutableArray array];
    _Celltitle=[NSMutableArray array];
    
    [Fundction getWithUrl:DriveLifeUrlStr success:^(id responseObject) {
        NSDictionary * dict=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSDictionary * result=dict[@"result"];
        NSArray * items=result[@"items"];
        NSArray * section=result[@"section"];
        for(NSDictionary * item in items)
        {
            CarLifeModel * model=[[CarLifeModel alloc]initWithDict:item];
            [_Headimage addObject:model.picurl];
            [_Headtitle addObject:model.title];
        }
        [self creatView];
        NSDictionary * first=section.firstObject;
        NSDictionary * last=section.lastObject;
        NSArray * FirArt=first[@"articles"];
        NSArray * LastArt=last[@"articles"];
        for(NSDictionary * item in FirArt)
        {
            CarLifeModel * model=[[CarLifeModel alloc]initWithDict:item];
            [_Celldesc addObject:model.introduction];
            [_Cellimage addObject:model.picurl];
            [_Celltitle addObject:model.title];
        }
        for(NSDictionary * item in LastArt)
        {
            CarLifeModel * model=[[CarLifeModel alloc]initWithDict:item];
            [_Celldesc addObject:model.introduction];
            [_Cellimage addObject:model.picurl];
            [_Celltitle addObject:model.title];
        }
        NSLog(@"%ld",_Celltitle.count);
        [self creatTabView];
        
    } failure:^(id error) {
        
        NSLog(@"失败%@",error);
        
    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"行车生活";
    self.view.backgroundColor=[UIColor whiteColor];
     [self creatData];
     [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [self creatNav];
    [self creatNavBar];
}

-(void)creatTabView
{
    _tabView=[[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height-64) style:UITableViewStyleGrouped];
    _tabView.delegate=self;
    _tabView.dataSource=self;
    _tabView.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tabView];
    [self creatView];
}

-(void)creatView
{
    SDCycleScrollView * scrollView=[[SDCycleScrollView alloc]initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, 150)];
    
    [scrollView setImageURLStringsGroup:_Headimage];
    scrollView.pageControlAliment=SDCycleScrollViewPageContolAlimentRight;
    scrollView.pageControlStyle=SDCycleScrollViewPageContolStyleAnimated;
    scrollView.delegate=self;
    scrollView.dotColor=[UIColor lightTextColor];
    scrollView.titleLabelTextFont=[UIFont systemFontOfSize:15];
    scrollView.autoScrollTimeInterval=2.0;
    _tabView.tableHeaderView=scrollView;

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

#pragma mark---SDCycleScrollViewDelegate
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    
}

#pragma mark---UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 6;
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
    if (section == 1 ||section==2) {
        return 200;
        
    }else if (section==3)
    {
        return 50;
        
    }else if (section==4 || section==5)
    {
        return 80;
        
    }
    return 0;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    NSLog(@"%ld",_Celltitle.count);
    if (section==1) {
        UIView * view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 200) ];
        view.backgroundColor=[UIColor whiteColor];
        
        OneCar * headView1=[[[NSBundle mainBundle] loadNibNamed:@"OneCar" owner:nil options:nil] lastObject];
        headView1.frame=CGRectMake(0, 0,  self.view.bounds.size.width/2, 200);
        headView1.Title.text=_Celltitle.firstObject;
        headView1.Desc.text=_Celldesc.firstObject;
        [headView1.pic setImageWithURL:[NSURL URLWithString:_Cellimage.firstObject]];
        
        [headView1.Btn addTarget:self action:@selector(Btn1) forControlEvents:UIControlEventTouchUpInside];
        
         [view addSubview:headView1];
        
        for (int i=1; i<3; i++) {
            
            twoCar * headView2=[[[NSBundle mainBundle] loadNibNamed:@"twoCar" owner:nil options:nil] lastObject];
            
            headView2.frame=CGRectMake(self.view.bounds.size.width/2, 100*(i-1), self.view.bounds.size.width/2,100);
            headView2.Title.text=[_Celltitle objectAtIndex:i];
            headView2.Desc.text=[_Celldesc objectAtIndex:i];
            [headView2.Pic setImageWithURL:[NSURL URLWithString:[_Cellimage objectAtIndex:i]]];
            headView2.Btn.tag=10+i;
             [headView2.Btn addTarget:self action:@selector(Btn2:) forControlEvents:UIControlEventTouchUpInside];
            [view addSubview:headView2];
            
        }
        
        return view;
    }else if (section==2)
    {
        UIView * view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 200) ];
        view.backgroundColor=[UIColor whiteColor];

        for (int i=0; i<4; i++) {
            
            twoCar * headView2=[[[NSBundle mainBundle] loadNibNamed:@"twoCar" owner:nil options:nil] lastObject];
            
            headView2.frame=CGRectMake(i%2*self.view.bounds.size.width/2, i/2*100, self.view.bounds.size.width/2,100);
            headView2.Title.text=[_Celltitle objectAtIndex:i+3];
            headView2.Desc.text=[_Celldesc objectAtIndex:i+3];
            [headView2.Pic setImageWithURL:[NSURL URLWithString:[_Cellimage objectAtIndex:i+3]]];
            headView2.Btn.tag=13+i;
            
            [headView2.Btn addTarget:self action:@selector(OneBtn:) forControlEvents:UIControlEventTouchUpInside];
            [view addSubview:headView2];

        
        }
    
        return view;
    }else if (section==3)
    {
        UIView * view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 50) ];
        view.backgroundColor=[UIColor whiteColor];
        three* headView3=[[[NSBundle mainBundle] loadNibNamed:@"three" owner:nil options:nil] lastObject];
        [view addSubview:headView3];
        return view;
    }else if (section==4)
    {
        UIView * view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 70) ];
        view.backgroundColor=[UIColor whiteColor];
        
        NSArray * nameArr=@[@"加油站",@"4S 店",@"交通队",@"汽车维修"];
        NSArray * imageArr=@[@"zhoubian_jiayou_icon.png",@"zhoubian_fs_icon.png",@"zhoubian_jiaotongdui_icon.png",@"zhoubian_weixiu_icon.png"];
        
        for (int i=0; i<nameArr.count; i++) {
            
            FourCar* headView4=[[[NSBundle mainBundle] loadNibNamed:@"FourCar" owner:nil options:nil] lastObject];
            
            headView4.frame=CGRectMake(i%4*94, 0, 94, 70);
            
            headView4.Image.image=[UIImage imageNamed:imageArr[i]];
            
            headView4.Title.text=nameArr[i];
            headView4.Btn.tag=10+i;
            [headView4.Btn addTarget:self action:@selector(TwoBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            [view addSubview:headView4];
        }
        return view;
    
    }else if (section==5)
    {
        UIView * view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 70) ];
        view.backgroundColor=[UIColor whiteColor];
        
        NSArray * nameArr=@[@".洗车",@".银行",@".汽车装饰",@".汽车改装",@".停车场",@".酒店",@".汽车美容"];
        for (int i=0; i<nameArr.count; i++) {
            
            FiveCar* headView5=[[[NSBundle mainBundle] loadNibNamed:@"FiveCar" owner:nil options:nil] lastObject];
            
            headView5.frame=CGRectMake(i%4*94, i/4*35, 94, 35);
            headView5.Label.text=nameArr[i];

            [view addSubview:headView5];
        }
        return view;
    }
    
    return nil;
}
#pragma mark----Btn
-(void)Btn1
{
    CarReport * report=[[ CarReport alloc]init];
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:report];
    [self presentViewController:nav animated:YES completion:nil];


}

-(void)Btn2:(UIButton *)btn
{
    if (btn.tag==11) {
        
        Accident * accident=[[ Accident alloc]init];
        UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:accident];
        [self presentViewController:nav animated:YES completion:nil];
        
    }else
    {
        Rumour * rumour=[[Rumour alloc]init];
        UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:rumour];
        [self presentViewController:nav animated:YES completion:nil];
        
    }
    
}

-(void)OneBtn:(UIButton *)btn
{
    switch (btn.tag) {
        case 13:
            
            break;
        case 14:
        {
            DesDriving * driving=[[DesDriving alloc]init];
            UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:driving];
            [self presentViewController:nav animated:YES completion:nil];
            
        }
            break;
        case 15:
            
            break;
        case 16:
            
            break;
        default:
            break;
    }
    
    
}



-(void)TwoBtnClick:(UIButton *)btn
{
    

}

#pragma mark----
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
