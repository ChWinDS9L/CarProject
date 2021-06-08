//
//  SucShowView.m
//  违章查询助手
//
//  Created by qianfeng on 15/10/26.
//  Copyright (c) 2015年 LY. All rights reserved.
//

#import "SucShowView.h"

extern NSInteger a;



@implementation SucShowView

{
    UIView * bgGroundView;
    UIView * showView;
}

-(id)initWithFrame:(CGRect)rect
{
    self = [super initWithFrame:rect];
    if (self) {
        //在这里创建，提示View
        //获取window，只有一个window
        
        NSArray * array = @[@"driving_licence_show",@"file_no_show.png",@"expiry_date_show.png",@"cartypeinfo.png",@"carengine.png"];
        UIWindow * window = [[UIApplication sharedApplication] keyWindow];
        bgGroundView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        bgGroundView.backgroundColor = [UIColor blackColor];
        bgGroundView.alpha = 0.5;
        UITapGestureRecognizer * tap0 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap)];
        tap0.numberOfTapsRequired = 1;
        //添加一个手势到某个视图上
        [bgGroundView addGestureRecognizer:tap0];
        [window addSubview:bgGroundView];
        bgGroundView.hidden = YES;
        
        showView = [[UIView alloc] initWithFrame:rect];
        showView.backgroundColor = [UIColor clearColor];
        showView.userInteractionEnabled = YES;
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap)];
        tap.numberOfTapsRequired = 1;
        //添加一个手势到某个视图上
        [showView addGestureRecognizer:tap];
        [window addSubview:showView];
        UILabel * label = [[UILabel alloc]init];
        _num = [label.text intValue];
        [showView addSubview:label];
        
        showView.hidden = YES;
        
        UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, rect.size.width, rect.size.height)];
        imageView.image = [UIImage imageNamed:array[a]];
        imageView.userInteractionEnabled = YES;
        UITapGestureRecognizer * tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap)];
        tap1.numberOfTapsRequired = 1;
        //添加一个手势到某个视图上
        [imageView addGestureRecognizer:tap1];
        [showView addSubview:imageView];
        
        

    }
    return self;
}

-(void)tap
{
    if ([self.delegate respondsToSelector:@selector(disappear)]) {
        [self.delegate disappear];
    }
}

-(void)showButtonClick
{
    if ([self.delegate respondsToSelector:@selector(disappear)]) {
        [self.delegate disappear];
    }
}

-(void)disappearView
{
    bgGroundView.hidden = YES;
    showView.hidden = YES;
}

-(void)looklookView
{
    bgGroundView.hidden = NO;
    showView.hidden = NO;
}

@end
