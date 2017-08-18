//
//  PolylineView.m
//  FirstIOS
//
//  Created by weizhenguan on 2017/8/16.
//  Copyright © 2017年 weisoft. All rights reserved.
//

#import "PolylineView.h"
#import "sqlite3.h"
#import <vector>
using namespace std;
@interface PolylineView()
@property (nonatomic,assign) sqlite3 *db;
@end

@implementation PolylineView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    //self.backgroundColor = [UIColor clearColor];
    //[super drawRect:rect];
    
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetRGBFillColor(context, 255, 255, 255, 1);
    CGContextFillRect(context, rect);
    
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineWidth(context, 3);
    CGContextSetAllowsAntialiasing(context, true);
    CGContextSetRGBStrokeColor(context, 70.0/255.0, 241.0/255.0, 241.0/255.0, 1.0);
    CGContextBeginPath(context);
    
     CGRect rcStatusBar = [[UIApplication sharedApplication] statusBarFrame];
    CGContextMoveToPoint(context, 0, rcStatusBar.size.height);
    CGContextAddLineToPoint(context, self.frame.size.width, self.frame.size.height);
    
    CGContextStrokePath(context);
    
    //CGContextAddRect(context, CGRectMake(0, 0, 100, 100));
//    CGContextSetRGBFillColor(context, 1, 1, 111, 1.0);
//    UIFont *font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:15.0f];
//    UIColor *redColor = [UIColor redColor];
//    
//    [self drawInRect]
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
//    vector<vector<NSString*>> vvData;
//    NSString *s1 = @"test";
//    [self GetDBData:s1 ToVector:vvData];
    
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
    
    NSString *sqlCreatTable = @"CREATE TABLE IF NOT EXISTS FundInfo(ID integer primary key autoincrement not null, count integer not null, date dateime not null)";
    [self exeSql:sqlCreatTable];
    
    return self;
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

-(void)GetDBData:(NSString*)sql ToVector:(vector<vector<NSString*>>&)vvData
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
            
        }
    }
}


@end
