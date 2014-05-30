//
//  CheckInOutQueriesTest.m
//  Database
//
//  Created by Abby Schlageter on 30/05/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <sqlite3.h>
#import "TestUtility.h"
#import "QuerySqlite.h"
#import "CheckInOut.h"
#import "CheckInOutQueries.h"

@interface CheckInOutQueriesTest : XCTestCase
@property (nonatomic) sqlite3 *testDB;
@property (nonatomic, retain) NSString *getQuery;

@end

@implementation CheckInOutQueriesTest

- (void)setUp
{
    [super setUp];
    self.testDB = [TestUtility getDummyDB];
    self.getQuery = [NSString stringWithFormat:@"SELECT type, timestamp, worker_rut, supervisor_rut FROM check_in_out"];
}

- (void)tearDown
{
    NSString *deleteQuery = [NSString stringWithFormat:@"DELETE FROM check_in_out"];
    [QuerySqlite runQuery:deleteQuery on:self.testDB];
    [TestUtility closeTestDB:self.testDB];
    [super tearDown];
}

#pragma mark - test methods

-(void)testCheckInOutInstantiatedSuccesfully
{
    CheckInOut *checkio = [TestUtility getDummyCheckIO];
    
    XCTAssertEqualObjects([checkio type_ch], @"foo", @"Check in/out type not instantiated correctly");
    
    XCTAssertEqualObjects([checkio worker_id], @"fooWorker", @"Check in/out worker id not instantiated correctly");
}

- (void)testAddCheckInOutQueryOutcomeAsExpected
{
    //given
    CheckInOut *checkio = [TestUtility getDummyCheckIO];
    
    //when
    [CheckInOutQueries addCheckInOut:checkio toDatabase:self.testDB];
    
    //then
    NSMutableArray *outcomes = [[NSMutableArray alloc] init];
    outcomes = [QuerySqlite outcomesWhenRunQuery:self.getQuery on:self.testDB using:[[CheckInOutResultProcessor alloc] init]];
    
    XCTAssertEqualObjects([[outcomes lastObject] type_ch], @"foo", @"checkinout not added to sqlite table properly");
    XCTAssertEqualObjects([[outcomes lastObject] timestamp_ch], @"fooTime", @"checkinout not added to sqlite table properly");
    XCTAssertEqualObjects([[outcomes lastObject] worker_id], @"fooWorker", @"checkinout not added to sqlite table properly");
    XCTAssertEqualObjects([[outcomes lastObject] supervisor_id], @"fooSupervisor", @"checkinout not added to sqlite table properly");
}

-(void)testTwoCheckInOutAddedSuccesfully
{
    //given
    CheckInOut *checkio1 = [TestUtility getDummyCheckIO];
    CheckInOut *checkio2 = [TestUtility getDummyCheckIO];
    
    //when
    [CheckInOutQueries addCheckInOut:checkio1 toDatabase:self.testDB];
    [CheckInOutQueries addCheckInOut:checkio2 toDatabase:self.testDB];
    
    //then
    NSMutableArray *outcomes = [[NSMutableArray alloc] init];
    outcomes = [QuerySqlite outcomesWhenRunQuery:self.getQuery on:self.testDB using:[[CheckInOutResultProcessor alloc] init]];
    
    XCTAssertEqual([outcomes count], 2, @"two checkinouts not added to database succesfully");
}

-(void)testGetCheckInOutQueryOutcomesAsExpected
{
    //given
    CheckInOut *checkioTest = [TestUtility getDummyCheckIO];
    CheckInOut *checkioOutcome = [[CheckInOut alloc] init];
    [CheckInOutQueries addCheckInOut:checkioTest toDatabase:self.testDB];
    
    //when
    checkioOutcome = [[CheckInOutQueries getCheckInOutFromDatabase:self.testDB] objectAtIndex:0];
    
    //then
    XCTAssertEqualObjects([checkioTest worker_id], [checkioOutcome worker_id], @"checkinout not retrieved from sqlite table correctly");
    XCTAssertEqualObjects([checkioTest type_ch], [checkioOutcome type_ch], @"checkinout not retrieved from sqlite table correctly");
    XCTAssertEqualObjects([checkioTest timestamp_ch], [checkioOutcome timestamp_ch], @"checkinout not retrieved from sqlite table correctly");
}

-(void)testTwoCheckInOutsGotFromDatabaseSuccesfully
{
    //given
    CheckInOut *checkio1 = [TestUtility getDummyCheckIO];
    CheckInOut *checkio2 = [TestUtility getDummyCheckIO];
    [CheckInOutQueries addCheckInOut:checkio1 toDatabase:self.testDB];
    [CheckInOutQueries addCheckInOut:checkio2 toDatabase:self.testDB];
    
    //when
    NSArray *outcomes = [CheckInOutQueries getCheckInOutFromDatabase:self.testDB];
    
    //then
    XCTAssertEqual([outcomes count], 2, @"checkinouts not retrieved from sqlite table correctly");
    
}

@end
