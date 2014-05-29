//
//  ActionQueries.h
//  Database
//
//  Created by Abby Schlageter on 28/05/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Action.h"
#import <sqlite3.h>
#import "QuerySqlite.h"


@interface ActionResultProcessor : NSObject <SqliteResultProcessor>
-(Action*)processResult:(sqlite3_stmt*)statement;
@end

@interface ActionQueries : NSObject
+(void)addAction:(Action*)action toDatabase:(sqlite3*)database;
+(NSArray*)getActionsFromDatabase:(sqlite3*)database;
@end
