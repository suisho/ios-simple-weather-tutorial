//
//  WXManager.h
//  SimpleWeather
//
//  Created by suisho on 2014/08/12.
//  Copyright (c) 2014年 suisho. All rights reserved.
//
@import Foundation;
@import CoreLocation;
#import <ReactiveCocoa/ReactiveCocoa/ReactiveCocoa.h>
#import "WXCondition.h"

#import "WXClient.h"
#import <TSMessages/TSMessage.h>

@interface WXManager : NSObject <CLLocationManagerDelegate>

+ (instancetype)sharedManager;

@property (nonatomic, strong, readwrite) CLLocation *currentLocation;
@property (nonatomic, strong, readwrite) WXCondition *currentCondition;
@property (nonatomic, strong, readwrite) NSArray *hourlyForecast;
@property (nonatomic, strong, readwrite) NSArray *dailyForecast;

@property (nonatomic, strong) CLLocationManager *locatioManager;
@property (nonatomic, assign) BOOL isFirstUpdate;
@property (nonatomic, strong) WXClient *client;


@end
