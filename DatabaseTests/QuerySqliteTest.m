//
//  QuerySqliteTest.m
//  Database
//
//  Created by Abby Schlageter on 15/05/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "QuerySqlite.h"
#import "TestUtility.h"

@interface QuerySqliteTest : XCTestCase
@property (nonatomic) sqlite3 *testDB;
@end

@implementation QuerySqliteTest
- (void)setUp
{
    [super setUp];
    self.testDB = [TestUtility getDummyDB];
}

- (void)tearDown
{
    [TestUtility closeTestDB:self.testDB];
    [super tearDown];
}


#pragma mark - test methods
-(void)testSqliteQueryFinishedExecuting
{
    //given
     NSString *theQuery =[NSString stringWithFormat: @"SELECT name FROM sqlite_master WHERE type = \'table\'"];
    
    //when
    int i = [QuerySqlite runQuery:theQuery on:self.testDB];
    
    //then
    XCTAssertEqual(i, 100, @"query not run properly");
}

-(void)testExpectedOutcomesWhenRunTableNamesQuery
{
    //given
    NSString *theQuery =[NSString stringWithFormat: @"SELECT name FROM sqlite_master WHERE type = \'table\'"];
    NSMutableArray *outcomes = [[NSMutableArray alloc] init];
    
    //when
    outcomes = [QuerySqlite outcomesWhenRunQuery:theQuery on:self.testDB];
    
    //then
    NSString *outcomeLast = [outcomes lastObject];
    XCTAssertEqualObjects(outcomeLast, @"db_admin", @"last table name not as expected");
}





@end
