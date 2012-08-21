//
//  MainViewController.h
//  WTZ_Reachability
//
//  Created by willonboy zhang on 12-8-21.
//  Copyright (c) 2012年 willonboy.tk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reachability.h"

@interface MainViewController : UIViewController

@property(nonatomic, retain) IBOutlet UIButton *btn_1th;
@property(nonatomic, retain) IBOutlet UIButton *btn_2th;
@property(nonatomic, retain) IBOutlet UIButton *btn_3th;
@property(nonatomic, retain) IBOutlet UIButton *btn_4th;
@property(nonatomic, retain) IBOutlet UIButton *btn_5th;
@property(nonatomic, retain) IBOutlet UIButton *btn_6th;
@property(nonatomic, retain) IBOutlet UIButton *btn_7th;
@property(nonatomic, retain) IBOutlet UIButton *btn_8th;



- (void)useBlockDemo;

- (void)useDelegateDemo;


@end
