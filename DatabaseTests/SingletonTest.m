//
//  SingletonTest.m
//  Database
//
//  Created by Abby Schlageter on 15/05/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//  Thanks to http://iosunittesting.com/ for help on this class
//

#import <XCTest/XCTest.h>
#import "Singleton.h"

@interface SingletonTest : XCTestCase

@end

@implementation SingletonTest

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

#pragma mark - helper methods

- (Singleton*)createUniqueInstance
{
    return [[Singleton alloc] init];
}

- (Singleton*)getSharedInstance
{
    return [Singleton sharedInstance];
}

#pragma mark - tests

- (void)testSingletonSharedInstanceCreated
{
    XCTAssertNotNil([self getSharedInstance]);
}

- (void)testSingletonUniqueInstanceCreated
{
    XCTAssertNotNil([self createUniqueInstance]);
}

- (void)testSingletonReturnsSameSharedInstanceTwice
{
    Singleton *s1 = [self getSharedInstance];
    Singleton *s2 = [self getSharedInstance];
    XCTAssertEqual(s1, s2);
}

- (void)testSingletonSharedInstanceSeparateFromUniqueInstance
{
    Singleton *s1 = [self getSharedInstance];
    XCTAssertNotEqual(s1, [self createUniqueInstance]);
}

- (void)testSingletonReturnsSeparateUniqueInstances
{
    Singleton *s1 = [self createUniqueInstance];
    XCTAssertNotEqual(s1, [self createUniqueInstance]);
}

/*- (void)testSingletonDatabaseVariableNotNil
{
    Singleton *s1 = [self getSharedInstance];
   // NSLog(@"mainDB = %@", s1.mainDB);
    XCTAssertEqualObjects(s1.mainDB, nil, @"sqlite3 DB property has not been initialised");
}*/





@end
