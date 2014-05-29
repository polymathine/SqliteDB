//
//  Database.h
//  Database
//
//  Created by Abby Schlageter on 13/05/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>


@interface Database : NSObject
+(int)openSqliteDB:(sqlite3*)theDatabase at:(NSString*)targetPath;
+(int)closeSqliteDB:(sqlite3*)theDatabase;



@end
