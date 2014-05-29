//
//  ActionQueriesTest.m
//  Database
//
//  Created by Abby Schlageter on 28/05/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "QuerySqlite.h"
#import <sqlite3.h>
#import "ActionQueries.h"
#import "TestUtility.h"

@interface ActionQueriesTest : XCTestCase
@property (nonatomic) sqlite3 *testDB;
@end

@implementation ActionQueriesTest

- (void)setUp
{
    [super setUp];
    self.testDB = [TestUtility getDummyDB];
}

- (void)tearDown
{
    //clear out table afterwards
    NSString *deleteQuery = [NSString stringWithFormat:@"DELETE FROM action"];
    [QuerySqlite runQuery:deleteQuery on:self.testDB];
    [TestUtility closeTestDB:self.testDB];
    [super tearDown];
}


#pragma mark - test methods
- (void)testAddActionQueryOutcomeAsExpected
{
    //given
    Action *action = [TestUtility getDummyAction];

     //when
    [ActionQueries addAction:action toDatabase:self.testDB];
    
    //then
    NSString *getQuery = [NSString stringWithFormat:@"SELECT type FROM action"];
    NSMutableArray *outcomes = [[NSMutableArray alloc] init];
    outcomes = [QuerySqlite outcomesWhenRunQuery:getQuery on:self.testDB];

    XCTAssertEqualObjects([outcomes lastObject], @"foo", @"action not added to sqlite table properly");
}


@end
