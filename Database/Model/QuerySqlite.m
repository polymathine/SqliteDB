//
//  QuerySqlite.m
//  Database
//
//  Created by Abby Schlageter on 15/05/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import "QuerySqlite.h"
#import "Database.h"

@interface QuerySqlite ()
@property (nonatomic, retain) Database *dbObject;

@end

@implementation QuerySqlite

-(int)runQuery:(NSString*)query on:(sqlite3*)database
{
    sqlite3_stmt *statementAdd;
    const char *update_stmt = [query UTF8String];
    
    int outcome = (sqlite3_prepare_v2(database, update_stmt, -1, &statementAdd, NULL));
    
    if(outcome == SQLITE_OK)
    {
        outcome = (sqlite3_step(statementAdd));
        sqlite3_finalize(statementAdd);
    }
    else
    {
        NSLog(@"failed to add info to database, prepare stament did not work '%s'.", sqlite3_errmsg(database));
    }

    return outcome;
}

@end
