//
//  SucShowView.h
//  违章查询助手
//
//  Created by qianfeng on 15/10/26.
//  Copyright (c) 2015年 LY. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol sucShowViewDelegate <NSObject>

-(void)disappear;//定义一个消失方法（代理方法）

@end



@interface SucShowView : UIView

@property (nonatomic,weak) id<sucShowViewDelegate>delegate;

@property (nonatomic,assign) int num;
-(void)looklookView;//展示提示框方法
-(void)disappearView;
-(void)tap;

@end
