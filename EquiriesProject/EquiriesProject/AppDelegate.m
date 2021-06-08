//
//  AppDelegate.m
//  EquiriesProject
//
//  Created by qianfeng on 15/10/28.
//  Copyright (c) 2015年 HXH. All rights reserved.
//

#import "AppDelegate.h"
#import "YRSideViewController.h"
#import "HomeView.h"
#import "Denglu.h"
#import <BaiduMapAPI/BMapKit.h>

@interface AppDelegate ()

@end

@implementation AppDelegate
{
    YRSideViewController * _sideVC;
    BMKMapManager * _manager;
    
}



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    _sideVC=[[YRSideViewController alloc]init];
    HomeView * home=[[HomeView alloc]init];
    UINavigationController * nav=[[UINavigationController alloc]initWithRootViewController:home];
    
    _sideVC.rootViewController=nav;
    //_sideVC.showBoundsShadow=NO;
    _sideVC.leftViewController=[[Denglu alloc]init];
    [_sideVC showLeftViewController:YES];
    _sideVC.leftViewShowWidth=260;
    [_sideVC hideSideViewController:NO];
    
    self.window.rootViewController=_sideVC;
    [self.window makeKeyAndVisible];
    
    //初始化
    _manager = [[BMKMapManager alloc]init];
    BOOL success = [_manager start:@"3YHDTNOxZrU45tf5ou2eetSzR" generalDelegate:nil];
    if (success) {
        NSLog(@"启动成功");
    }else{
        NSLog(@"启动失败");
    }
    //搭建上下文环境
    //参数 数据库文件名
    [MagicalRecord setupCoreDataStackWithStoreNamed:@"data.db"];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
