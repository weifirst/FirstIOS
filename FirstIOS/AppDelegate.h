//
//  AppDelegate.h
//  FirstIOS
//
//  Created by weizhenguan on 2017/8/16.
//  Copyright © 2017年 weisoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "sqlite3.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic) sqlite3 *db;

@end

