//
//  MainViewController.m
//  WTZ_Reachability
//
//  Created by willonboy zhang on 12-8-21.
//  Copyright (c) 2012年 willonboy.tk. All rights reserved.
//

#import "MainViewController.h"

@implementation MainViewController
@synthesize btn_1th;
@synthesize btn_2th;
@synthesize btn_3th;
@synthesize btn_4th;
@synthesize btn_5th;
@synthesize btn_6th;
@synthesize btn_7th;
@synthesize btn_8th;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc 
{
    [Reachability removeObserver:self];
    [super dealloc];
}

- (IBAction)handleBtnClicked:(id)sender
{
    UIButton *btn = sender;
    switch (btn.tag)
    {
        case 1:
            [Reachability removeObserver:self];
            break;
            
        case 2:
            NSLog(@" [Reachability currentNetworkStatus] %d", [Reachability currentNetworkStatus]);
            break;
            
        default:
            break;
    }
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
        //[self useBlockDemo];
    [self useDelegateDemo];
    
}


- (void)useBlockDemo;
{
    [Reachability addObserver:^(NetworkStatus status){
        NSString *msg = nil;
        if (status == NotReachable)
        {
            msg = @"Main-无网络";
        }
        else if (status == ReachableViaWiFi)
        {
            msg = @"Main-WIFI网络";
        }
        else
        {
            msg = @"Main-2G/3G网络";
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
            msg = @"Main-无网络";
        }
        else if (status == ReachableViaWiFi)
        {
            msg = @"Main-WIFI网络";
        }
        else
        {
            msg = @"Main-2G/3G网络";
        }
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:msg delegate:nil cancelButtonTitle:@"sure" otherButtonTitles: nil];
        [alert performSelectorOnMainThread:@selector(show) withObject:nil waitUntilDone:NO];
        [alert release];
        alert = nil;
    } isIgnoreWWAN:NO];
    
    
    [Reachability addObserver:^{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Main-无网络" delegate:nil cancelButtonTitle:@"sure" otherButtonTitles: nil];
        [alert performSelectorOnMainThread:@selector(show) withObject:nil waitUntilDone:NO];
        [alert release];
        alert = nil;
    } wifiCallbackBlock:^{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message: @"Main-WIFI网络" delegate:nil cancelButtonTitle:@"sure" otherButtonTitles: nil];
        [alert performSelectorOnMainThread:@selector(show) withObject:nil waitUntilDone:NO];
        [alert release];
        alert = nil;
    } wwanCallbackBlock:^{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Main-2G/3G网络" delegate:nil cancelButtonTitle:@"sure" otherButtonTitles: nil];
        [alert performSelectorOnMainThread:@selector(show) withObject:nil waitUntilDone:NO];
        [alert release];
        alert = nil;
    }];
    
}






- (void)noNetwork
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Main-无网络" delegate:nil cancelButtonTitle:@"sure" otherButtonTitles: nil];
    [alert performSelectorOnMainThread:@selector(show) withObject:nil waitUntilDone:NO];
    [alert release];
    alert = nil;
}

- (void)wifiNetwork
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message: @"Main-WIFI网络" delegate:nil cancelButtonTitle:@"sure" otherButtonTitles: nil];
    [alert performSelectorOnMainThread:@selector(show) withObject:nil waitUntilDone:NO];
    [alert release];
    alert = nil;
}

- (void)wwanNetwork
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Main-2G/3G网络" delegate:nil cancelButtonTitle:@"sure" otherButtonTitles: nil];
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
