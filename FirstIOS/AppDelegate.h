//
//  AppDelegate.h
//  FirstIOS
//
//  Created by weizhenguan on 2017/8/16.
//  Copyright © 2017年 weisoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "sqlite3.h"
//#include <vector>
//using namespace std;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic) sqlite3 *db;

//-(void)GetDBData:(NSString*)sql ToVVector:(vector<vector<NSString*>>&)vvData;

@end

