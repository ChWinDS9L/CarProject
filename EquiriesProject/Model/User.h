//
//  User.h
//  违章查询助手
//
//  Created by qianfeng on 15/10/28.
//  Copyright (c) 2015年 LY. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface User : NSManagedObject

@property (nonatomic,strong) NSString * username;

@property (nonatomic,strong) NSString * password;

@end
