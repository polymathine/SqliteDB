//
//  DBSingleton.m
//  Database
//
//  Created by Abby Schlageter on 15/05/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import "DBSingleton.h"
#import <sqlite3.h>

@interface DBSingleton ()
@property (nonatomic) sqlite3 *mainDB;
@end

@implementation DBSingleton

-(instancetype) init
{
    if ( (self = [super init]) )
    {
        sqlite3 *database;
        self.mainDB = database;
        
    }
    return self;
}

@end
