//
//  home.h
//  违章查询助手
//
//  Created by qianfeng on 15/10/25.
//  Copyright (c) 2015年 LY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface home : UIView
@property (weak, nonatomic) IBOutlet UIImageView *Sun;
@property (weak, nonatomic) IBOutlet UILabel *temperature;
@property (weak, nonatomic) IBOutlet UILabel *PM;
@property (weak, nonatomic) IBOutlet UILabel *WashCar;
@property (weak, nonatomic) IBOutlet UILabel *Time;
@property (weak, nonatomic) IBOutlet UILabel *Weather;
@property (weak, nonatomic) IBOutlet UIButton *Drive;
@property (weak, nonatomic) IBOutlet UILabel *Limit;
@property (weak, nonatomic) IBOutlet UIButton *CityBtn;
@property (weak, nonatomic) IBOutlet UILabel *city;

@end
