//
//  BreakRulesVC.m
//  违章查询助手
//
//  Created by qianfeng on 15/10/27.
//  Copyright (c) 2015年 LY. All rights reserved.
//

#import "BreakRulesVC.h"

@interface BreakRulesVC ()<BMKMapViewDelegate,BMKLocationServiceDelegate>

@end

@implementation BreakRulesVC
{
    BMKMapView * _mapView;
    BMKAnnotationView * _annotionView;
    BMKLocationService * _locationDervice;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self makeMap];
}

-(void)makeMap
{
    _mapView = [[BMKMapView alloc]initWithFrame:CGRectMake(0, 64, Width, Height)];
    _mapView.delegate = self;
    _mapView.mapType = 0;
    //显示位置
    _mapView.showsUserLocation = YES;
    
    //跟着模式
    _mapView.userTrackingMode = BMKUserTrackingModeFollowWithHeading;
    [self.view addSubview:_mapView];
    
    BMKPointAnnotation * pointAnnotation = [[BMKPointAnnotation alloc]init];
    pointAnnotation.coordinate = CLLocationCoordinate2DMake(39.905,116.44);
    pointAnnotation.title = @"北京";
    [_mapView addAnnotation:pointAnnotation];
    
    for (int i=0; i<3; i++) {
        NSArray * a0 = @[@"39.905",@"40.130762053452",@"40.132016329827"];
        NSArray * a2 = @[@"116.44",@"116.27784197194",@"116.27534213863"];
        BMKPointAnnotation * pointAnnotation = [[BMKPointAnnotation alloc]init];
        pointAnnotation.coordinate = CLLocationCoordinate2DMake([a0[i] intValue],[a2[i] intValue]);
        pointAnnotation.title = @"北京";
        [_mapView addAnnotation:pointAnnotation];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
















































