//
//  GlobalVar.c
//  FirstIOS
//
//  Created by weizhenguan on 2017/8/23.
//  Copyright © 2017年 weisoft. All rights reserved.
//

#import "Global.h"

sqlite3 *g_db;

BOOL exeSql(NSString* sql)
{
    char *errmsg;
    if( sqlite3_exec(g_db, sql.UTF8String, nil, nil, &errmsg)!=SQLITE_OK ){
        return FALSE;
    }
    else{
        return TRUE;
    }
}

void GetDBData(NSString* sql, vector<vector<NSString*>>& vvData)
{
    char *sErrMsg = 0;
    char **dbResult;
    int nRow=0;
    int nColumn=0;
    if( sqlite3_get_table(g_db, sql.UTF8String, &dbResult, &nRow, &nColumn, &sErrMsg)==SQLITE_OK ){
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

void GetDBDataSingleRow(NSString* sql, vector<NSString*>& vData)
{
    char *sErrMsg = 0;
    char **dbResult;
    int nRow=0;
    int nColumn=0;
    if( sqlite3_get_table(g_db, sql.UTF8String, &dbResult, &nRow, &nColumn, &sErrMsg)==SQLITE_OK ){
        if( nRow>0 ){
            assert( nRow==1 );

            for( int j=0; j<nColumn; j++ ){
                NSString *sValue = [NSString stringWithUTF8String:dbResult[nColumn+j]];
                vData.push_back( sValue );
            }
        }
    }
}

void GetDBDataSingleCol(NSString* sql, vector<NSString*>& vData)
{
    char *sErrMsg = 0;
    char **dbResult;
    int nRow=0;
    int nColumn=0;
    if( sqlite3_get_table(g_db, sql.UTF8String, &dbResult, &nRow, &nColumn, &sErrMsg)==SQLITE_OK ){
        for( int i=0; i<nRow; i++ ){
            NSString *sValue = [NSString stringWithUTF8String:dbResult[nColumn*i+nColumn]];
            vData.push_back( sValue );
        }
    }
}

NSString* GetDBDataSingleValue(NSString* sql)
{
    char *sErrMsg = 0;
    char **dbResult;
    int nRow=0;
    int nColumn=0;
    if( sqlite3_get_table(g_db, sql.UTF8String, &dbResult, &nRow, &nColumn, &sErrMsg)==SQLITE_OK ){
        if( nRow>0 ){
            assert( nRow==1 );
            assert( nColumn==1 );
            return [NSString stringWithUTF8String:dbResult[nColumn]];
        }
    }

    return nil;
}
