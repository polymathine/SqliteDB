//
//  ActionQueries.m
//  Database
//
//  Created by Abby Schlageter on 28/05/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import "ActionQueries.h"
#import "QuerySqlite.h"

@implementation ActionQueries

+(void)addAction:(Action*)action toDatabase:(sqlite3*)database
{
    NSString *insertQuery = [NSString stringWithFormat:@"INSERT INTO action (type, timestamp, worker_id, supervisor_id) VALUES ('%@','%@','%@','%@' )", action.type, action.timestamp, action.worker_id, action.supervisor_id];
    
    [QuerySqlite runQuery:insertQuery on:database];
}

@end
