//
//  TestUtility.h
//  Database
//
//  Created by Abby Schlageter on 29/05/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "Action.h"

@interface TestUtility : NSObject

+ (sqlite3*)getDummyDB;
+(void)closeTestDB:(sqlite3*)testDB;
+(Action*)getDummyAction;

@end
