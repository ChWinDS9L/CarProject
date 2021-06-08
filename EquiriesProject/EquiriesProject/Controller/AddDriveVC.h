//
//  AddDriveVC.h
//  违章查询助手
//
//  Created by qianfeng on 15/10/26.
//  Copyright (c) 2015年 LY. All rights reserved.
//

#import "baseController.h"
#import "ZHPickView.h"

@interface AddDriveVC : baseController<ZHPickViewDelegate,CityVCDelegate>

@property(nonatomic,strong)ZHPickView *pickview;
@property (nonatomic,strong) NSString * cityName;

@end
