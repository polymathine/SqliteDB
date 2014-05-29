//
//  WorkerQueries.h
//  Database
//
//  Created by Abby Schlageter on 29/05/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "QuerySqlite.h"
#import "Worker.h"

@interface WorkerResultProcessor : NSObject <SqliteResultProcessor>
-(Worker*)processResult:(sqlite3_stmt*)statement;
@end

@interface WorkerQueries : NSObject
+(void)addWorker:(Worker*)worker toDatabase:(sqlite3*)database;
+(NSArray*)getWorkersFromDatabase:(sqlite3*)database;

@end
