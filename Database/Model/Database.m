//
//  Database.m
//  Database
//
//  Created by Abby Schlageter on 13/05/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import "Database.h"
#import "LibraryPath.h"
#import <sqlite3.h>


@interface Database ()
@property (nonatomic) sqlite3 *mainDB;
@end

@implementation Database

-(int)openSqliteDB
{
    NSString *targetPath = [LibraryPath getTargetPathTo:@"MainDB.sqlite"];
    const char *dbPath = [targetPath UTF8String];
    sqlite3 *theDatabase;
    
    int outcome = sqlite3_open(dbPath, &theDatabase);
    //A positive result: SQLITE_OK = O
    
    return outcome;
}

@end
