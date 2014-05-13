//
//  LibraryPathTest.m
//  Database
//
//  Created by Abby Schlageter on 13/05/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LibraryPath.h"

@interface LibraryPathTest : XCTestCase
@property (nonatomic, retain) NSString *libraryPath;

@end

@implementation LibraryPathTest

- (void)setUp
{
    [super setUp];
     self.libraryPath = nil;
}

- (void)tearDown
{
     self.libraryPath = nil;
    [super tearDown];
}

- (void)testLibraryPathNotNil
{
    //given
    self.libraryPath = nil;
    
    //when
    self.libraryPath = [LibraryPath getLibraryPath];
    
    //then
    XCTAssertNotNil(self.libraryPath, @"Library path was not created");
}

-(void)testLibraryPathEndsInLibrary
{
    //given
    self.libraryPath = [LibraryPath getLibraryPath];
    
    //when
    NSString *outcome = [self.libraryPath substringFromIndex:([self.libraryPath length]-7)];
    NSString *expected = @"Library";
    
    //then
    XCTAssertEqualObjects(outcome, expected, @"Path to library directory incorrect");
}

-(void)testTargetPathEndsInFilename
{
    //given
    NSString *filename = @"boo";
    
    //when
    NSString *targetPath = [LibraryPath getTargetPathTo:filename];
    NSString *outcome = [targetPath substringFromIndex:([targetPath length]-[filename length])];
    
    //then
    XCTAssertEqualObjects(outcome, @"boo", @"Incorrect filename at target path");
}

@end
