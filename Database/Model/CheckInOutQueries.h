//
//  CheckInOutQueries.h
//  Database
//
//  Created by Abby Schlageter on 30/05/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QuerySqlite.h"
#import <sqlite3.h>
#import "CheckInOut.h"

@interface CheckInOutResultProcessor : NSObject <SqliteResultProcessor>
-(CheckInOut*)processResult:(sqlite3_stmt*)statement;
@end

@interface CheckInOutQueries : NSObject
+(void)addCheckInOut:(CheckInOut*)checkinout toDatabase:(sqlite3*)database;
+(NSArray*)getCheckInOutFromDatabase:(sqlite3*)database;

@end
