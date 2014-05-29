//
//  WorkerQueriesTest.m
//  Database
//
//  Created by Abby Schlageter on 29/05/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Worker.h"
#import "TestUtility.h"
#import "QuerySqlite.h"
#import "WorkerQueries.h"

@interface WorkerQueriesTest : XCTestCase
@property (nonatomic) sqlite3 *testDB;
@property (nonatomic, retain) NSString *getQuery;
@property (nonatomic, retain) Worker *worker;
@end

@implementation WorkerQueriesTest

- (void)setUp
{
    [super setUp];
    self.testDB = [TestUtility getDummyDB];
    self.getQuery = [NSString stringWithFormat:@"SELECT first_name, mother_name, father_name, rut, transport, photo FROM worker"];
    self.worker = [TestUtility getDummyWorker];
}

- (void)tearDown
{
    NSString *deleteQuery = [NSString stringWithFormat:@"DELETE FROM worker"];
    [QuerySqlite runQuery:deleteQuery on:self.testDB];
    [TestUtility closeTestDB:self.testDB];
    [super tearDown];
}

- (void)testWorkerInstantiatedCorrectly
{
    //given
    
    //when
    //NSData *photo = [TestUtility create2kbRandomNSData];
    
    //then
    XCTAssertEqualObjects([self.worker firstname], @"foo", @"worker name not instantiated correctly");
    XCTAssertEqualObjects([self.worker rut], @"fooRut", @"worker rut not instantiated correctly");
   // XCTAssertEqualObjects([self.worker photo], photo, @"photo data not instantiated correctly");
 }

- (void)testAddWorkerQueryOutcomeAsExpected
{
    //given
    
    //when
    [WorkerQueries addWorker:self.worker toDatabase:self.testDB];
    
    //then
    NSMutableArray *outcomes = [[NSMutableArray alloc] init];
    outcomes = [QuerySqlite outcomesWhenRunQuery:self.getQuery on:self.testDB using:[[WorkerResultProcessor alloc] init]];
    
    XCTAssertEqualObjects([[outcomes lastObject] firstname], @"foo", @"worker not added to sqlite table properly");
    XCTAssertEqualObjects([[outcomes lastObject] rut], @"fooRut", @"worker not added to sqlite table properly");
    //XCTAssertEqualObjects([[outcomes lastObject] photo], [self.worker photo], @"worker not added to sqlite table properly");
}

-(void)testTwoWorkersAddedSuccesfully
{
    //given
    Worker *worker1 = [TestUtility getDummyWorker];
    Worker *worker2 = [TestUtility getDummyWorker];

    
    //when
    [WorkerQueries addWorker:worker1 toDatabase:self.testDB];
    [WorkerQueries addWorker:worker2 toDatabase:self.testDB];
    
    //then
    NSMutableArray *outcomes = [[NSMutableArray alloc] init];
    outcomes = [QuerySqlite outcomesWhenRunQuery:self.getQuery on:self.testDB using:[[WorkerResultProcessor alloc] init]];
    
    XCTAssertEqual([outcomes count], 2, @"two workers not added to database succesfully");
}

-(void)testGetWorkerQueryOutcomesAsExpected
{
    //given
    Worker *workerTest = [TestUtility getDummyWorker];
    Worker *workerOutcome = [[Worker alloc] init];
    [WorkerQueries addWorker:workerTest toDatabase:self.testDB];
    
    //when
    workerOutcome = [[WorkerQueries getWorkersFromDatabase:self.testDB] objectAtIndex:0];
    
    //then
    XCTAssertEqualObjects([workerTest firstname], [workerOutcome firstname], @"worker not retrieved from sqlite table correctly");
    XCTAssertEqualObjects([workerTest fathername], [workerOutcome fathername], @"worker not retrieved from sqlite table correctly");
}

-(void)testTwoWorkersGotFromDatabaseSuccesfully
{
    //given
    Worker *worker1 = [TestUtility getDummyWorker];
    Worker *worker2 = [TestUtility getDummyWorker];
    
    //when
    [WorkerQueries addWorker:worker1 toDatabase:self.testDB];
    [WorkerQueries addWorker:worker2 toDatabase:self.testDB];
    
    //then
    NSArray *outcomes = [WorkerQueries getWorkersFromDatabase:self.testDB];
    XCTAssertEqual([outcomes count], 2, @"workers not retrieved from sqlite table correctly");
}



@end
