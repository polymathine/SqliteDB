//
//  ActionQueries.m
//  Database
//
//  Created by Abby Schlageter on 28/05/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import "ActionQueries.h"

@implementation ActionResultProcessor

-(Action*)processResult:(sqlite3_stmt*)statement
{
    NSString *type = [NSString stringWithCString:(const char *)sqlite3_column_text(statement, 0) encoding:NSUTF8StringEncoding];
    NSString *timestamp = [NSString stringWithCString:(const char *)sqlite3_column_text(statement, 1) encoding:NSUTF8StringEncoding];
    NSString *worker_id = [NSString stringWithCString:(const char *)sqlite3_column_text(statement, 2) encoding:NSUTF8StringEncoding];
    NSString *supervisor_id = [NSString stringWithCString:(const char *)sqlite3_column_text(statement, 3) encoding:NSUTF8StringEncoding];
    
    Action *action = [[Action alloc] initType:type Timestamp:timestamp WorkerID:worker_id SupervisorID:supervisor_id];

    return action;
}
@end


@implementation ActionQueries

+(void)addAction:(Action*)action toDatabase:(sqlite3*)database
{
    NSString *insertQuery = [NSString stringWithFormat:@"INSERT INTO action (type, timestamp, worker_rut, supervisor_rut) VALUES ('%@','%@','%@','%@' )", action.type_act, action.timestamp_act, action.worker_id, action.supervisor_id];
    
    [QuerySqlite runQuery:insertQuery on:database];
}

+(NSArray*)getActionsFromDatabase:(sqlite3*)database
{
    NSString *selectQuery = [NSString stringWithFormat:@"SELECT type, timestamp, worker_rut, supervisor_rut FROM action"];
    
    NSMutableArray *outcomes = [[NSMutableArray alloc] init];
    outcomes = [QuerySqlite outcomesWhenRunQuery:selectQuery on:database using: [[ActionResultProcessor alloc] init]];
    
    NSArray *actions = outcomes;
    return  actions;
}

@end

