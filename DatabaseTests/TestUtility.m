//
//  TestUtility.m
//  Database
//
//  Created by Abby Schlageter on 29/05/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import "TestUtility.h"
#import <stdlib.h>

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


+(NSData*)create2kbRandomNSData
{
    int twoKb           = 2097;
    NSMutableData* theData = [NSMutableData dataWithCapacity:twoKb];
    for( unsigned int i = 0 ; i < twoKb/4 ; ++i )
    {
        u_int32_t randomBits = arc4random();
        [theData appendBytes:(void*)&randomBits length:4];
    }
    return theData;
}


+(Action*)getDummyAction
{
    Action *action = [[Action alloc] initType:@"foo" Timestamp:@"fooTime" WorkerID:@"fooWorker" SupervisorID:@"fooSupervisor"];
    
    return action;
}

+(Worker*)getDummyWorker
{
    Worker *worker = [[Worker alloc] initWorkerNameFirst:@"foo" Mother:@"fooMom" Father:@"fooDad" RUT:@"fooRut" Transport:@"fooTrans" andPhoto:[self.class create2kbRandomNSData]];
    
    return worker;
}

+(NSString*)loadFixture:(NSString *)name ofType:(NSString*)filetype
{
    NSBundle *unitTestBundle = [NSBundle bundleForClass:[self class]];
    NSString *pathForFile    = [unitTestBundle pathForResource:name ofType:filetype];
    
    return pathForFile;
}

@end
