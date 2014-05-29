//
//  TestUtility.m
//  Database
//
//  Created by Abby Schlageter on 29/05/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import "TestUtility.h"


@implementation TestUtility

+ (sqlite3*)getDummyDB
{
    sqlite3 *database;
    NSString *testDbPath = [self.class loadFixture:@"testDB" ofType:@"sqlite"];
    const char *dbPath = [testDbPath UTF8String];
    sqlite3_open(dbPath, &database);
    
    return database;
}

+(void)closeTestDB:(sqlite3*)testDB
{
    sqlite3_close(testDB);
}


+(Action*)getDummyAction
{
    Action *action = [[Action alloc] initType:@"foo" Timestamp:@"fooTime" WorkerID:@"fooWorker" SupervisorID:@"fooSupervisor"];
    
    return action;
}



+(NSString*)loadFixture:(NSString *)name ofType:(NSString*)filetype
{
    NSBundle *unitTestBundle = [NSBundle bundleForClass:[self class]];
    NSString *pathForFile    = [unitTestBundle pathForResource:name ofType:filetype];
    
    return pathForFile;
}

@end
