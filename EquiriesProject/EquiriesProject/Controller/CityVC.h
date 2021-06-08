//
//  CityVC.h
//  违章查询助手
//
//  Created by qianfeng on 15/10/26.
//  Copyright (c) 2015年 LY. All rights reserved.
//

#import "baseController.h"

@protocol CityVCDelegate <NSObject>

-(void)sendString:(NSString*)string;

@end

@interface CityVC : baseController<UIAccelerometerDelegate>

@property (nonatomic,assign) id<CityVCDelegate>delegate;

@end
