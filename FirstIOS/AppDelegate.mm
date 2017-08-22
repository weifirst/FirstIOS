//
//  AppDelegate.m
//  FirstIOS
//
//  Created by weizhenguan on 2017/8/16.
//  Copyright © 2017年 weisoft. All rights reserved.
//

#import "AppDelegate.h"
#import "DataListViewController.h"
#import "ViewController.h"
#import "TabVC.h"

#import <vector>
using namespace std;

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    TabVC *tab = [[TabVC alloc] init];
    tab.view.backgroundColor = [UIColor colorWithRed:0 green:200/255.0 blue:0 alpha:1.0];
    self.window.rootViewController = tab;
    [self.window makeKeyAndVisible ];
    
    NSString *home = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    NSString *path = [home stringByAppendingString:@"/my.db"];
    if( sqlite3_open(path.UTF8String, &_db)==SQLITE_OK ){
        NSLog(@"打开数据库成功");
        NSLog(@"%@", path);
    }
    else{
        NSLog(@"打开数据库失败");
        return nil;
    }
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(BOOL)exeSql:(NSString*)sql
{
    char *errmsg;
    if( sqlite3_exec(_db, sql.UTF8String, nil, nil, &errmsg)!=SQLITE_OK ){
        return NO;
    }
    else{
        return YES;
    }
}

-(void)GetDBData:(NSString*)sql ToVVector:(vector<vector<NSString*>>&)vvData
{
    char *sErrMsg = 0;
    char **dbResult;
    int nRow=0;
    int nColumn=0;
    if( sqlite3_get_table(_db, sql.UTF8String, &dbResult, &nRow, &nColumn, &sErrMsg)==SQLITE_OK ){
        for( int i=0; i<nRow; i++ ){
            vector<NSString*> vValue;
            for( int j=0; j<nColumn; j++ ){
                NSString *sValue = [NSString stringWithUTF8String:dbResult[nColumn*i+nColumn+j]];
                vValue.push_back( sValue );
            }
            vvData.push_back( vValue );
        }
    }
}

-(void)GetDBDataSingleRow:(NSString*)sql ToVector:(vector<NSString*>&)vData
{
    char *sErrMsg = 0;
    char **dbResult;
    int nRow=0;
    int nColumn=0;
    if( sqlite3_get_table(_db, sql.UTF8String, &dbResult, &nRow, &nColumn, &sErrMsg)==SQLITE_OK ){
        if( nRow>0 ){
            assert( nRow==1 );
            
            for( int j=0; j<nColumn; j++ ){
                NSString *sValue = [NSString stringWithUTF8String:dbResult[nColumn+j]];
                vData.push_back( sValue );
            }
        }
    }
}

-(void)GetDBDataSingleCol:(NSString*)sql ToVector:(vector<NSString*>&)vData
{
    char *sErrMsg = 0;
    char **dbResult;
    int nRow=0;
    int nColumn=0;
    if( sqlite3_get_table(_db, sql.UTF8String, &dbResult, &nRow, &nColumn, &sErrMsg)==SQLITE_OK ){
        for( int i=0; i<nRow; i++ ){
            NSString *sValue = [NSString stringWithUTF8String:dbResult[nColumn*i+nColumn]];
            vData.push_back( sValue );
        }
    }
}

-(NSString*)GetDBDataSingleValue:(NSString*)sql
{
    char *sErrMsg = 0;
    char **dbResult;
    int nRow=0;
    int nColumn=0;
    if( sqlite3_get_table(_db, sql.UTF8String, &dbResult, &nRow, &nColumn, &sErrMsg)==SQLITE_OK ){
        if( nRow>0 ){
            assert( nRow==1 );
            assert( nColumn==1 );
            return [NSString stringWithUTF8String:dbResult[nColumn]];
        }
    }
    
    return nil;
}


@end
