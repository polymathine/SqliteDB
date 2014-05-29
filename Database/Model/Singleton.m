//
//  Singleton.m
//  Database
//
//  Created by Abby Schlageter on 15/05/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import "Singleton.h"
#import "LibraryPath.h"

@interface Singleton ()

@end

@implementation Singleton
+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken = 0;
    
    __strong static id _sharedObject = nil;
    //ensures sharedObject only created once
    dispatch_once(&onceToken, ^{
        _sharedObject = [[[self class] alloc] initOnce];
    });
    return _sharedObject;
}

-(id) initOnce
{
    if ( (self = [super init]) )
    {
        //copy database file to iPhone directory
        NSString *databasePath = [LibraryPath getTargetPathTo:@"/mainDB.sqlite"];
        
        const char *dbPath = [databasePath UTF8String];
        sqlite3 *theDatabase;
        
        //if database opened succesfully at path
        if (sqlite3_open(dbPath, &theDatabase) == SQLITE_OK)
        {
            //database opened successfully
            NSLog(@"Database opened succesfully at path %@", databasePath);
        }
        else
        {
            NSLog(@"database not opened succesfully because %s", sqlite3_errmsg(theDatabase));
        }
        //assign sqliteDB parameter to sqlite3 property on Database Object
        self.mainDB = theDatabase;
    }
    return self;
}

-(sqlite3*)retrieveDatabase
{
    return self.mainDB;
}

@end
