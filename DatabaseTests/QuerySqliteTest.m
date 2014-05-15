//
//  QuerySqliteTest.m
//  Database
//
//  Created by Abby Schlageter on 15/05/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "QuerySqlite.h"

@interface QuerySqliteTest : XCTestCase
@property (nonatomic, retain) QuerySqlite *querySqlite;
@end

@implementation QuerySqliteTest

- (void)setUp
{
    [super setUp];
    self.querySqlite = [[QuerySqlite alloc] init];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    self.querySqlite = nil;
    [super tearDown];
}

-(void)testSqliteQueryRun
{
    //given
    NSString *theQuery = @"thequery";
    sqlite3 *database;
    
    //when
    int i = [self.querySqlite runQuery:theQuery on:database];
    
    //then
    XCTAssertEqual(i, 101, @"query not run properly");
    
}



@end
