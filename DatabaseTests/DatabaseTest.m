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
    sqlite3 *databaseSQ;
    NSString *targetPath = [LibraryPath getTargetPathTo:@"boo.sqlite"];
    
    //when
    int outcome = [self.database openSqliteDB:databaseSQ at:targetPath];
    
    //then
    XCTAssertEqual(0, outcome, @"sqlite database not opened correctly");
}


-(void)testSqliteDatabaseCreatedAtPath
{
    //given
    sqlite3 *databaseSQ;
    NSString *targetPath = [LibraryPath getTargetPathTo:@"boo.sqlite"];
    
    //when
    [self.database openSqliteDB:databaseSQ at:targetPath];
    BOOL file = [[NSFileManager defaultManager] fileExistsAtPath:targetPath];
    
    //then
    XCTAssertEqual(1, file, @"sqlite database not created at target path");
}

/*-(void)testSqliteDatabaseClosed
{
    //given
    NSString *targetPath = [LibraryPath getTargetPathTo:@"boo.sqlite"];
    sqlite3 *databaseSQ;
    int open = [self.database openSqliteDB:databaseSQ at:targetPath];

    NSLog(@"open = %d", open);
    //when
    int outcome = [self.database closeSqliteDB:self.mainDB];
    
    
    //then
    XCTAssertEqual(0, outcome, @"sqlite database not closed correctly");
    
}
*/


@end
