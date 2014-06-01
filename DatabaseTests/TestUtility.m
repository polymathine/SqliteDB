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


+(UIImage*)getDummyImage
{
    NSString *imagePath = [self.class loadFixture:@"MayaAngelou" ofType:@"jpg"];
    UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
    
    return image;
}

+(NSData*)getDummyPhotoData
{
    UIImage *image = [TestUtility getDummyImage];
    NSData *reducedImage = [Photo getReducedDataForImage:image];
    
    return reducedImage;
}


+(CheckInOut*)getDummyCheckIO
{
    CheckInOut *checkio = [[CheckInOut alloc] initType:@"foo" Timestamp:@"fooTime" WorkerID:@"fooWorker" SupervisorID:@"fooSupervisor"];
    
    return checkio;
}

+(Action*)getDummyAction
{
    Action *action = [[Action alloc] initType:@"foo" Timestamp:@"fooTime" WorkerID:@"fooWorker" SupervisorID:@"fooSupervisor"];
    
    return action;
}

+(Worker*)getDummyWorker
{
    Worker *worker = [[Worker alloc] initWorkerNameFirst:@"foo" Mother:@"fooMom" Father:@"fooDad" RUT:@"fooRut" Transport:@"fooTrans" andPhoto:[self.class getDummyPhotoData]];
    
    return worker;
}

+(NSString*)loadFixture:(NSString *)name ofType:(NSString*)filetype
{
    NSBundle *unitTestBundle = [NSBundle bundleForClass:[self class]];
    NSString *pathForFile    = [unitTestBundle pathForResource:name ofType:filetype];
    
    return pathForFile;
}

@end
