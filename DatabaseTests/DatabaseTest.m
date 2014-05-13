//
//  DatabaseTest.m
//  Database
//
//  Created by Abby Schlageter on 13/05/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Database.h"

@interface DatabaseTest : XCTestCase
@property (nonatomic, retain) NSString *libraryPath;
@property (nonatomic, retain) Database *database;

@end

@implementation DatabaseTest

- (void)setUp
{
    [super setUp];
    self.database = [[Database alloc] init];
}

- (void)tearDown
{
    self.libraryPath = nil;
    self.database = nil;
    [super tearDown];
}

-(void)testDatabaseNotNil
{
    XCTAssertNotNil(self.database, @"Database object not initialised");
}



@end
