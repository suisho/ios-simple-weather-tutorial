//
//  WXManager.m
//  SimpleWeather
//
//  Created by suisho on 2014/08/12.
//  Copyright (c) 2014年 suisho. All rights reserved.
//

#import "WXManager.h"

@implementation WXManager

+ (instancetype)sharedManager {
    static id _sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [[self alloc]init];
    });
    return _sharedManager;
}
- (void)findCurrentLocation{
    self.isFirstUpdate = YES;
    [self.locatioManager startUpdatingLocation];
}
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    if(self.isFirstUpdate){
        self.isFirstUpdate = NO;
        return;
    }
    CLLocation *location = [locations lastObject];
    
    if(location.horizontalAccuracy > 0){
        self.currentLocation = location;
        [self.locatioManager stopUpdatingLocation];
    }
}
- (RACSignal *)updateCurrentConditions{
    return [[self.client fetchCurrentConditionsForLocation:self.currentLocation.coordinate] doNext:^(WXCondition *condition){
        self.currentCondition = condition;
    }];
}
- (RACSignal *)updateDailyForecast{
    return [[self.client fetchHourlyForecastForLocation:self.currentLocation.coordinate] doNext:^(NSArray *conditions){
        self.hourlyForecast = conditions;
    }];
}
- (RACSignal *)updateHourlyForecast{
    return [[self.client fetchDailyForecastForLocation:self.currentLocation.coordinate] doNext:^(NSArray *conditions){
        self.dailyForecast = conditions;
    }];
}

- (id)init {
    if(self = [super init]){
        _locatioManager = [[CLLocationManager alloc] init];
        _locatioManager.delegate = self;
        _client = [[WXClient alloc] init];
    
        [[[[RACObserve(self, currentLocation)
            ignore:nil]
            flattenMap:^(CLLocation *newLocation){
                return [RACSignal merge:@[
                        [self updateCurrentConditions],
                        [self updateDailyForecast],
                        [self updateHourlyForecast],
                        ]];
            }] deliverOn:RACScheduler.mainThreadScheduler]
          
              subscribeError:^(NSError *error){
                [TSMessage showNotificationWithTitle:@"Error"
                                            subtitle:@"There was a problem fetching the latest weather."
                                                type:TSMessageNotificationTypeError];
              }];
         }
         return self;

}

           
@end
