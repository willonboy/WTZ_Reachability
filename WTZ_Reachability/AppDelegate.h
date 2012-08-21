//
//  AppDelegate.h
//  WTZ_Reachability
//
//  Created by willonboy zhang on 12-8-16.
//  Copyright (c) 2012年 willonboy.tk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reachability.h"
#import "MainViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


- (void)useBlockDemo;

- (void)useDelegateDemo;


@end
