//
//  Database.m
//  Database
//
//  Created by Abby Schlageter on 13/05/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import "Database.h"

@interface Database ()
@property (nonatomic) sqlite3 *mainDB;
@end

@implementation Database

+(int)openSqliteDB:(sqlite3*)theDatabase at:(NSString*)targetPath
{
    const char *dbPath = [targetPath UTF8String];
    
    int outcome = sqlite3_open(dbPath, &theDatabase);
    //A positive result: SQLITE_OK = O
    
    return outcome;
}

+(int)closeSqliteDB:(sqlite3*)theDatabase
{
    int outcome = sqlite3_close(theDatabase);
    NSLog(@"Database Connection  NOT Closed! %s", sqlite3_errmsg(theDatabase));
    return outcome;
}



@end
