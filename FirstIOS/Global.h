//
//  GlobalVar.h
//  FirstIOS
//
//  Created by weizhenguan on 2017/8/23.
//  Copyright © 2017年 weisoft. All rights reserved.
//

#ifndef GlobalVar_h
#define GlobalVar_h

#import <UIKit/UIKit.h>
#include  "sqlite3.h"
#include <vector>
using namespace std;
extern sqlite3 *g_db;

BOOL exeSql(NSString* sql);
void GetDBData(NSString* sql, vector<vector<NSString*>>& vvData);
void GetDBDataSingleRow(NSString* sql, vector<NSString*>& vData);
void GetDBDataSingleCol(NSString* sql, vector<NSString*>& vData);
NSString* GetDBDataSingleValue(NSString* sql);

#endif /* GlobalVar_h */
