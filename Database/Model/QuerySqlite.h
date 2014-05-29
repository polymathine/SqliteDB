//
//  QuerySqlite.h
//  Database
//
//  Created by Abby Schlageter on 15/05/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@protocol SqliteResultProcessor <NSObject>
-(NSObject*)processResult:(sqlite3_stmt*)statement;
@end

@interface QuerySqlite : NSObject
+(int)runQuery:(NSString*)query on:(sqlite3*)database;
+(NSMutableArray*)outcomesWhenRunQuery:(NSString*)query on:(sqlite3*)theDatabase using:(id<SqliteResultProcessor>)resultProcessor;

@end
