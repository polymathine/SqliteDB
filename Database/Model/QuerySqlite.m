//
//  QuerySqlite.m
//  Database
//
//  Created by Abby Schlageter on 15/05/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import "QuerySqlite.h"


@implementation QuerySqlite

+(int)runQuery:(NSString*)query on:(sqlite3*)database
{
    sqlite3_stmt *statementAdd;
    const char *update_stmt = [query UTF8String];
    
    int outcome = (sqlite3_prepare_v2(database, update_stmt, -1, &statementAdd, NULL));
    
    if(outcome == SQLITE_OK)
    {
        outcome = (sqlite3_step(statementAdd));
        
    }
    else
    {
        NSLog(@"failed to add info to database, prepare stament did not work '%s'.", sqlite3_errmsg(database));
    }
    sqlite3_finalize(statementAdd);

    return outcome;
}

+(NSMutableArray*)outcomesWhenRunQuery:(NSString*)query on:(sqlite3*)theDatabase using:(id<SqliteResultProcessor>)resultProcessor
{
    sqlite3_stmt    *statement;
    NSMutableArray *selectedRecords = [NSMutableArray array];
    
    if (sqlite3_prepare_v2(theDatabase, [query UTF8String], -1, &statement, NULL) == SQLITE_OK)
    {
        while (sqlite3_step(statement) == SQLITE_ROW)
        {
            NSObject *value = [resultProcessor processResult:statement];
//            NSString *value = [NSString stringWithCString:(const char *)sqlite3_column_text(statement, 0) encoding:NSUTF8StringEncoding];
//            NSLog(@"value = %@", value);
            [selectedRecords addObject:value];
        }
        sqlite3_finalize(statement);
    }
    else NSLog(@"sqlite query not implemented because %s", sqlite3_errmsg(theDatabase));
    
    return selectedRecords;
}

@end
