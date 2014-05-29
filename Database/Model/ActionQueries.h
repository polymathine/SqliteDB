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

@interface ActionQueries : NSObject
+(void)addAction:(Action*)action toDatabase:(sqlite3*)database;
@end
