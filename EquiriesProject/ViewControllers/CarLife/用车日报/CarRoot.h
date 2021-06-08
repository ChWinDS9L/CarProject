//
//  CarRoot.h
//  违章查询助手
//
//  Created by qianfeng on 15/10/26.
//  Copyright (c) 2015年 LY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CarRoot : UIViewController
<UITableViewDelegate,UITableViewDataSource>

{
    UITableView * _tableView;
}

//接收源数据
@property(nonatomic,strong)NSMutableArray * dataArray ;

//下拉回调block
@property(nonatomic,copy) void (^headerRefresh)(void);
//上拉回调block
@property(nonatomic,copy) void (^footerRefresh)(void);

//设置当前页数
@property(nonatomic,assign) int pageIndex;


//返回 tableview(get 方法)
-(UITableView *)ListTableView;

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end
