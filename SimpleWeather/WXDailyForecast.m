//
//  WXDailyForecast.m
//  SimpleWeather
//
//  Created by suisho on 2014/08/12.
//  Copyright (c) 2014年 suisho. All rights reserved.
//

#import "WXDailyForecast.h"

@implementation WXDailyForecast

+ (NSDictionary *)JSONKeyPathsByPropertyKey{
    NSMutableDictionary *paths = [[super JSONKeyPathsByPropertyKey] mutableCopy];
    
    paths[@"tempHigh"] = @"temp.max";
    paths[@"tempLow"] = @"temp.min";
    
    return paths;
}

@end
