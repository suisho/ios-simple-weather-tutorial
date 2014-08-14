//
//  WXClient.h
//  SimpleWeather
//
//  Created by suisho on 2014/08/12.
//  Copyright (c) 2014年 suisho. All rights reserved.
//

#import <Foundation/Foundation.h>

@import CoreLocation;
#import <ReactiveCocoa/ReactiveCocoa/ReactiveCocoa.h>
@import Foundation;

@interface WXClient : NSObject

@property (nonatomic, strong) NSURLSession *session;

- (RACSignal *)fetchJSONFromURL:(NSURL *)url;
- (RACSignal *)fetchCurrentConditionsForLocation:(CLLocationCoordinate2D)coordinate;
- (RACSignal *)fetchHourlyForecastForLocation:(CLLocationCoordinate2D)coordinate;
- (RACSignal *)fetchDailyForecastForLocation:(CLLocationCoordinate2D)coordinate;

@end
