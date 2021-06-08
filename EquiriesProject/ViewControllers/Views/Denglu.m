
//
//  Denglu.m
//  违章查询助手
//
//  Created by qianfeng on 15/10/24.
//  Copyright (c) 2015年 LY. All rights reserved.
//

#import "Denglu.h"
#import "oneDLCell.h"
#import "twoDLCell.h"

@interface Denglu ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation Denglu
{
    UITableView * _tabView;
    NSArray * _imageArr;
    NSArray * _activeArr;

}
- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.frame=CGRectMake(0, 20, self.view.bounds.size.width, self.view.bounds.size.height);
    
    self.view.backgroundColor=[UIColor blackColor];
    [self creatTabView];
    
    _imageArr=[NSArray array];
    _activeArr=[NSArray array];
    
 _imageArr=@[@"menu_0",@"menu_search",@"menu_order",@"menu_coupon",@"menu_message",@"menu_manager",@"menu_setting"];
    _activeArr=@[@"登录",@"查驾驶证",@"我的订单",@"优惠券",@"消息中心",@"车辆管理",@"设置中心"];
    
}

-(void)creatTabView
{
    _tabView=[[UITableView alloc]initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, 410) style:UITableViewStylePlain];
    _tabView.backgroundColor=[UIColor blackColor];
    _tabView.delegate=self;
    _tabView.dataSource=self;
    [self.view addSubview:_tabView];
}

#pragma mark----UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _imageArr.count;

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0) {
        return 70;
    }
    
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    oneDLCell * cell1=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell1) {
        cell1=[[[NSBundle mainBundle] loadNibNamed:@"oneDLCell" owner:nil options:nil] lastObject];
    }
    twoDLCell * cell2=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell2) {
        cell2=[[[NSBundle mainBundle] loadNibNamed:@"twoDLCell" owner:nil options:nil] lastObject];
    }

    
    if (indexPath.row==0) {
        
        cell1.Image.image=[UIImage imageNamed:_imageArr[indexPath.row]];
        
        cell1.Desc.text=_activeArr[indexPath.row];
    }
    
    cell2.Image.image=[UIImage imageNamed:_imageArr[indexPath.row]];
    cell2.Desc.text=_activeArr[indexPath.row];
    
    
    return cell2;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            LoginVC *  vc = [[LoginVC alloc]init];
            UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:vc];
            [self presentViewController:nav animated:YES completion:nil];
        }
            break;
        case 1:
        {
            LookDriveVC *  vc = [[LookDriveVC alloc]init];
            UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:vc];
            [self presentViewController:nav animated:YES completion:nil];
        }
            break;
        case 2:
        {
            OrderVC *  vc = [[OrderVC alloc]init];
            UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:vc];
            [self presentViewController:nav animated:YES completion:nil];
        }
            break;
        case 3:
        {
            PreferentialVC *  vc = [[PreferentialVC alloc]init];
            UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:vc];
            [self presentViewController:nav animated:YES completion:nil];
        }
            break;
        case 4:
        {
            MessageVC *  vc = [[MessageVC alloc]init];
            UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:vc];
            [self presentViewController:nav animated:YES completion:nil];        }
            break;
        case 5:
        {
            CarManagerVC *  vc = [[CarManagerVC alloc]init];
            UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:vc];
            [self presentViewController:nav animated:YES completion:nil];
        }
            break;
        case 6:
        {
            SettingVC *  vc = [[SettingVC alloc]init];
            UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:vc];
            [self presentViewController:nav animated:YES completion:nil];
        }
            break;

            
        default:
            break;
    }
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
