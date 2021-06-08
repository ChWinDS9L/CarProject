//
//  CarReport.m
//  违章查询助手
//
//  Created by qianfeng on 15/10/26.
//  Copyright (c) 2015年 LY. All rights reserved.
//

#import "CarReport.h"
#import "CarReportModel.h"
#import "ReportCell.h"
#import "LiycRequest.h"
#import "CarReportDefail.h"

@interface CarReport ()

@end

@implementation CarReport
{
     BOOL _isDownRefresh;
    NSMutableArray * _dataArray;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.pageIndex = 1;
    self.title=@"用车日报";
    self.view.backgroundColor=[UIColor whiteColor];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [self creatNavBar];
    [self creatNav];
    [self sendHttpRequestWithPageIndex:self.pageIndex];
    [self refreshView];
}


-(void)refreshView
{
    __weak CarReport* report=self;
    
    self.headerRefresh = ^{
        
        if (_dataArray.count>0) {

            [report.dataArray removeAllObjects];
            report.pageIndex = 1;
            _isDownRefresh = NO;
            [report sendHttpRequestWithPageIndex:report.pageIndex];
        }
    };
    self.footerRefresh = ^{
        _isDownRefresh = YES;
        [report sendHttpRequestWithPageIndex:++report.pageIndex];
    };
    
}

-(void)sendHttpRequestWithPageIndex:(int)index
{
    __weak CarReport * report=self;
    
    _dataArray=[NSMutableArray array];

    [Fundction getWithUrl:[[NSString stringWithFormat:DailyCarUrl,report.pageIndex] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] success:^(id responseObject) {
    
        //NSLog(@"%@",responseObject);
        
        [report.ListTableView headerEndRefreshing];
        [report.ListTableView footerEndRefreshing];
        
        NSDictionary * dict=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        
        NSDictionary * result=dict[@"result"];
        NSArray * newslist=result[@"newslist"];
        
        for(NSDictionary * item in newslist)
        {
            CarReportModel * model=[[CarReportModel alloc]initWithDict:item];
            [_dataArray addObject:model];
        
        }
        
        NSLog(@"%ld",_dataArray.count);
    
        [report.ListTableView reloadData];
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        
        if (!_isDownRefresh) {
            
            [[report ListTableView] headerEndRefreshing];
        }else{
            [[report ListTableView] footerEndRefreshing];
        }
        
    } failure:^(id error) {
        
        NSLog(@"失败%@",error);
        
        [[report ListTableView] headerEndRefreshing];
    }];
}


#pragma mark---UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ReportCell * cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell=[[[NSBundle mainBundle] loadNibNamed:@"ReportCell" owner:nil options:nil] lastObject];
    }

    CarReportModel * model;
    
    if (_dataArray.count==0) {
        
        model=[[CarReportModel alloc]init];
    }else{
        
        model=_dataArray[indexPath.row];
        
        [cell.Image setImageWithURL:[NSURL URLWithString:model.smallpic]];
        cell.Title.text=model.title;
        cell.Time.text=model.lasttime;
        
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"112211");
    CarReportDefail * defail=[[CarReportDefail alloc]init];
     UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:defail];
    defail.model=_dataArray[indexPath.row];
    [self presentViewController:nav animated:YES completion:nil];
    
    NSLog(@"112232");

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
