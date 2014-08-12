//
//  WXController.h
//  SimpleWeather
//
//  Created by suisho on 2014/08/12.
//  Copyright (c) 2014年 suisho. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WXController : UIViewController <UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate>
@property (nonatomic, strong) UIImageView *backgroundImageView;
@property (nonatomic, strong) UIImageView *blurredImageView;
@property (nonatomic, strong) UIImageView *tableView;
@property (nonatomic, assign) CGFloat screenHeight;

@end
