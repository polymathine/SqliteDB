//
//  WorkerQueries.m
//  Database
//
//  Created by Abby Schlageter on 29/05/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import "WorkerQueries.h"

@implementation WorkerResultProcessor

-(Worker*)processResult:(sqlite3_stmt*)statement
{
    //extract each component of Worker object from worker table in sqlite file
    NSString *firstname = [NSString stringWithCString:(const char *)sqlite3_column_text(statement, 0) encoding:NSUTF8StringEncoding];
    NSString *mothername = [NSString stringWithCString:(const char *)sqlite3_column_text(statement, 1) encoding:NSUTF8StringEncoding];
    NSString *fathername = [NSString stringWithCString:(const char *)sqlite3_column_text(statement, 2) encoding:NSUTF8StringEncoding];
    NSString *rut = [NSString stringWithCString:(const char *)sqlite3_column_text(statement, 3) encoding:NSUTF8StringEncoding];
    NSString *transport = [NSString stringWithCString:(const char *)sqlite3_column_text(statement, 4) encoding:NSUTF8StringEncoding];
    NSData *photo = [[NSData alloc] initWithBytes:sqlite3_column_blob(statement, 5) length:sqlite3_column_bytes(statement, 5)];
    
    Worker *worker = [[Worker alloc] initWorkerNameFirst:firstname Mother:mothername Father:fathername RUT:rut Transport:transport andPhoto:photo];
    
    return worker;
}
@end

@implementation WorkerQueries

+(void)addWorker:(Worker*)worker toDatabase:(sqlite3*)database
{
    NSString *insertQuery = [NSString stringWithFormat:@"INSERT INTO worker (first_name, mother_name, father_name, rut, transport, photo) VALUES ('%@','%@','%@','%@', '%@', '%@' )", worker.firstname, worker.mothername, worker.fathername, worker.rut, worker.transport, worker.photo];
    
    [QuerySqlite runQuery:insertQuery on:database];
}

+(NSArray*)getWorkersFromDatabase:(sqlite3*)database
{
    NSString *selectQuery = [NSString stringWithFormat:@"SELECT first_name, mother_name, father_name, rut, transport, photo FROM worker"];
    
    NSMutableArray *outcomes = [[NSMutableArray alloc] init];
    outcomes = [QuerySqlite outcomesWhenRunQuery:selectQuery on:database using: [[WorkerResultProcessor alloc] init]];
    
    NSArray *workers = outcomes;
    return  workers;
}

@end
