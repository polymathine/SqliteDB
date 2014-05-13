//
//  DatabaseTest.m
//  Database
//
//  Created by Abby Schlageter on 13/05/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Database.h"
#import <sqlite3.h>
#import "LibraryPath.h"

@interface DatabaseTest : XCTestCase
@property (nonatomic, retain) NSString *targetPath;
@property (nonatomic, retain) Database *database;

@end

@implementation DatabaseTest

- (void)setUp
{
    [super setUp];
    self.database = [[Database alloc] init];
    self.targetPath = [LibraryPath getTargetPathTo:@"boo"];
}

- (void)tearDown
{
    self.targetPath = nil;
    self.database = nil;
    [super tearDown];
}

-(void)testDatabaseNotNil
{
    XCTAssertNotNil(self.database, @"Database object not initialised");
}

-(void)testSqliteDatabaseOpened
{
    //given
    
    //when
    int outcome = [self.database openSqliteDB];
    
    //then
    XCTAssertEqual(0, outcome, @"sqlite database not opened correctly");
}



@end
