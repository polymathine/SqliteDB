//
//  Action.m
//  Database
//
//  Created by Abby Schlageter on 28/05/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import "Action.h"

@implementation Action

-(instancetype)initType:(NSString*)type Timestamp:(NSString*)timestamp WorkerID:(NSString*)worker_id SupervisorID:(NSString*)supervisor_id
{
    if ( (self = [super init]) )
    {
        self.type = type;
        self.timestamp = timestamp;
        self.worker_id = worker_id;
        self.supervisor_id = supervisor_id;
    }
    return self;
}

@end
