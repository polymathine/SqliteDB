//
//  PhotoTest.m
//  Database
//
//  Created by Abby Schlageter on 30/05/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TestUtility.h"
#import "Photo.h"

@interface PhotoTest : XCTestCase

@end

@implementation PhotoTest

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

- (void)testPhotoDataNotNilWhenInstantiated
{
    //given

    //when
    NSData *photo1 = [[TestUtility getDummyPhoto] photoData];
    
    //then
    XCTAssertNotNil(photo1, @"photo not instantiated correctly");
    
}

-(void)testDataFromImageConversionNotNil
{
    //given
    UIImage *image = [TestUtility getDummyImage];
    
    //when
    NSData *reducedImage = [Photo getReducedDataForImage:image];
    
    //then
    XCTAssertNotNil(reducedImage, @"image data conversion returns nil");
    
}

-(void)testDataFromImageConversionLessThan50kb
{
    //given
    UIImage *image = [TestUtility getDummyImage];
    
    //when
    NSData *reducedImage = [Photo getReducedDataForImage:image];
    
    //then
    XCTAssertTrue(([reducedImage length] < 50000), @"reduced image size greater than 50kb");
    
}

@end
