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
@property (nonatomic, retain) NSString *getQuery;
@end

@implementation ActionQueriesTest

- (void)setUp
{
    [super setUp];
    self.testDB = [TestUtility getDummyDB];
    self.getQuery = [NSString stringWithFormat:@"SELECT type, timestamp, worker_id, supervisor_id FROM action"];
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
    NSMutableArray *outcomes = [[NSMutableArray alloc] init];
    outcomes = [QuerySqlite outcomesWhenRunQuery:self.getQuery on:self.testDB using:[[ActionResultProcessor alloc] init]];

    XCTAssertEqualObjects([[outcomes lastObject] type_act], @"foo", @"action not added to sqlite table properly");
    XCTAssertEqualObjects([[outcomes lastObject] timestamp_act], @"fooTime", @"action not added to sqlite table properly");
    XCTAssertEqualObjects([[outcomes lastObject] worker_id], @"fooWorker", @"action not added to sqlite table properly");
    XCTAssertEqualObjects([[outcomes lastObject] supervisor_id], @"fooSupervisor", @"action not added to sqlite table properly");
}

-(void)testTwoActionsAddedSuccesfully
{
    //given
    Action *action1 = [TestUtility getDummyAction];
    Action *action2 = [TestUtility getDummyAction];
    
    //when
    [ActionQueries addAction:action1 toDatabase:self.testDB];
    [ActionQueries addAction:action2 toDatabase:self.testDB];
    
    //then
    NSMutableArray *outcomes = [[NSMutableArray alloc] init];
    outcomes = [QuerySqlite outcomesWhenRunQuery:self.getQuery on:self.testDB using:[[ActionResultProcessor alloc] init]];
    
    XCTAssertEqual([outcomes count], 2, @"two actions not added to database succesfully");
}

-(void)testGetActionQueryOutcomesAsExpected
{
    //given
    Action *actionTest = [TestUtility getDummyAction];
    Action *actionOutcome = [[Action alloc] init];
    [ActionQueries addAction:actionTest toDatabase:self.testDB];
    
    //when
    actionOutcome = [ActionQueries getActionFromDatabase:self.testDB];
    
    //then
    XCTAssertEqualObjects([actionTest worker_id], [actionOutcome worker_id], @"action not retrieved from sqlite table correctly");
    XCTAssertEqualObjects([actionTest type_act], [actionOutcome type_act], @"action not retrieved from sqlite table correctly");
    XCTAssertEqualObjects([actionTest timestamp_act], [actionOutcome timestamp_act], @"action not retrieved from sqlite table correctly");
    
}


@end
