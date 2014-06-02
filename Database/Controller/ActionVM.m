//
//  ActionVM.m
//  Database
//
//  Created by Abby Schlageter on 02/06/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import "ActionVM.h"
#import "Singleton.h"
#import "Action.h"
#import "ActionQueries.h"

@implementation ActionVM

+(void)saveAction:(NSString*)theAction toRut:(NSString*)rut
{
    NSLog(@"rut is %@", rut);
    sqlite3 *database = [[Singleton sharedInstance] retrieveDatabase];
    Action *action =[[Action alloc] initType:theAction Timestamp:@"2014-03-12" WorkerID:rut SupervisorID:@"username"];
    [ActionQueries addAction:action toDatabase:database];
    NSLog(@"action succesfully added");
}

@end
