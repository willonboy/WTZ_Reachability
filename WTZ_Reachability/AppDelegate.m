//
//  AppDelegate.m
//  WTZ_Reachability
//
//  Created by willonboy zhang on 12-8-16.
//  Copyright (c) 2012年 willonboy.tk. All rights reserved.
//

#import "AppDelegate.h"


@implementation AppDelegate

@synthesize window = _window;

- (void)dealloc
{
    [Reachability removeObserver:self];
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    [Reachability startDefaultMonitor];
        //[self useBlockDemo];
    [self useDelegateDemo];
    
    
    MainViewController *mainVC = [MainViewController new];
    self.window.rootViewController = mainVC;
    [mainVC release];
    
    return YES;
}





- (void)useBlockDemo;
{
    [Reachability addObserver:^(NetworkStatus status){
        NSString *msg = nil;
        if (status == NotReachable)
        {
            msg = @"AppDelegate-无网络";
        }
        else if (status == ReachableViaWiFi)
        {
            msg = @"AppDelegate-WIFI网络";
        }
        else
        {
            msg = @"AppDelegate-2G/3G网络";
        }
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:msg delegate:nil cancelButtonTitle:@"sure" otherButtonTitles: nil];
        [alert performSelectorOnMainThread:@selector(show) withObject:nil waitUntilDone:NO];
        [alert release];
        alert = nil;
    }];
    
    [Reachability addObserver:nil haveNetworkCallbackBlock:^(NetworkStatus status){
        NSString *msg = nil;
        if (status == NotReachable)
        {
            msg = @"AppDelegate-无网络";
        }
        else if (status == ReachableViaWiFi)
        {
            msg = @"AppDelegate-WIFI网络";
        }
        else
        {
            msg = @"AppDelegate-2G/3G网络";
        }
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:msg delegate:nil cancelButtonTitle:@"sure" otherButtonTitles: nil];
        [alert performSelectorOnMainThread:@selector(show) withObject:nil waitUntilDone:NO];
        [alert release];
        alert = nil;
    } isIgnoreWWAN:NO];
    
    
    [Reachability addObserver:^{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"AppDelegate-无网络" delegate:nil cancelButtonTitle:@"sure" otherButtonTitles: nil];
        [alert performSelectorOnMainThread:@selector(show) withObject:nil waitUntilDone:NO];
        [alert release];
        alert = nil;
    } wifiCallbackBlock:^{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message: @"AppDelegate-WIFI网络" delegate:nil cancelButtonTitle:@"sure" otherButtonTitles: nil];
        [alert performSelectorOnMainThread:@selector(show) withObject:nil waitUntilDone:NO];
        [alert release];
        alert = nil;
    } wwanCallbackBlock:^{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"AppDelegate-2G/3G网络" delegate:nil cancelButtonTitle:@"sure" otherButtonTitles: nil];
        [alert performSelectorOnMainThread:@selector(show) withObject:nil waitUntilDone:NO];
        [alert release];
        alert = nil;
    }];
    
}






- (void)noNetwork
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"AppDelegate-无网络" delegate:nil cancelButtonTitle:@"sure" otherButtonTitles: nil];
    [alert performSelectorOnMainThread:@selector(show) withObject:nil waitUntilDone:NO];
    [alert release];
    alert = nil;
}

- (void)wifiNetwork
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message: @"AppDelegate-WIFI网络" delegate:nil cancelButtonTitle:@"sure" otherButtonTitles: nil];
    [alert performSelectorOnMainThread:@selector(show) withObject:nil waitUntilDone:NO];
    [alert release];
    alert = nil;
}

- (void)wwanNetwork
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"AppDelegate-2G/3G网络" delegate:nil cancelButtonTitle:@"sure" otherButtonTitles: nil];
    [alert performSelectorOnMainThread:@selector(show) withObject:nil waitUntilDone:NO];
    [alert release];
    alert = nil;
}

- (void)haveNetwork:(NSNumber *) info
{
    NetworkStatus status = (NetworkStatus)[info intValue];
    
    if (ReachableViaWiFi == status)
    {
        [self wifiNetwork];
    }
    else if(ReachableViaWWAN == status)
    {
        [self wwanNetwork];
    }
    else
    {
        [self noNetwork];
    }
}

- (void)useDelegateDemo;
{
//    [Reachability addObserver:self callback:@selector(haveNetwork:)];
//    [Reachability addObserver:self noNetworkCallback:@selector(noNetwork) haveNetworkCallback:@selector(haveNetwork:) isIgnoreWWAN:NO];
    [Reachability addObserver:self noNetworkCallback:@selector(noNetwork) wifiCallback:@selector(wifiNetwork) wwanCallback:@selector(wwanNetwork)];
}

@end
