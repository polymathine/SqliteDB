//
//  CheckInOutQueries.m
//  Database
//
//  Created by Abby Schlageter on 30/05/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import "CheckInOutQueries.h"

@implementation CheckInOutResultProcessor

-(CheckInOut*)processResult:(sqlite3_stmt*)statement
{
    NSString *type = [NSString stringWithCString:(const char *)sqlite3_column_text(statement, 0) encoding:NSUTF8StringEncoding];
    NSString *timestamp = [NSString stringWithCString:(const char *)sqlite3_column_text(statement, 1) encoding:NSUTF8StringEncoding];
    NSString *worker_id = [NSString stringWithCString:(const char *)sqlite3_column_text(statement, 2) encoding:NSUTF8StringEncoding];
    NSString *supervisor_id = [NSString stringWithCString:(const char *)sqlite3_column_text(statement, 3) encoding:NSUTF8StringEncoding];
    
   CheckInOut *checkio = [[CheckInOut alloc] initType:type Timestamp:timestamp WorkerID:worker_id SupervisorID:supervisor_id];
    
    return checkio;
}
@end

@implementation CheckInOutQueries

+(void)addCheckInOut:(CheckInOut*)checkinout toDatabase:(sqlite3*)database
{
    NSString *insertQuery = [NSString stringWithFormat:@"INSERT INTO check_in_out (type, timestamp, worker_rut, supervisor_rut) VALUES ('%@','%@','%@','%@' )", checkinout.type_ch, checkinout.timestamp_ch, checkinout.worker_id, checkinout.supervisor_id];
    
    [QuerySqlite runQuery:insertQuery on:database];
}

+(NSArray*)getCheckInOutFromDatabase:(sqlite3*)database
{
    NSString *selectQuery = [NSString stringWithFormat:@"SELECT type, timestamp, worker_rut, supervisor_rut FROM check_in_out"];
    
    NSMutableArray *outcomes = [[NSMutableArray alloc] init];
    outcomes = [QuerySqlite outcomesWhenRunQuery:selectQuery on:database using: [[CheckInOutResultProcessor alloc] init]];
    
    NSArray *checkinouts = outcomes;
    return  checkinouts;
}

@end
