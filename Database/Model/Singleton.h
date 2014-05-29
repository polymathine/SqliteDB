//
//  Singleton.h
//  Database
//
//  Created by Abby Schlageter on 15/05/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>


@interface Singleton : NSObject

@property (nonatomic) sqlite3 *mainDB;

+ (instancetype)sharedInstance;
-(sqlite3*)retrieveDatabase;

@end
