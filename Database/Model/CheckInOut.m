//
//  CheckInOut.m
//  Database
//
//  Created by Abby Schlageter on 30/05/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import "CheckInOut.h"

@implementation CheckInOut

-(instancetype)initType:(NSString*)type Timestamp:(NSString*)timestamp WorkerID:(NSString*)worker_id SupervisorID:(NSString*)supervisor_id
{
    if ( (self = [super init]) )
    {
        self.type_ch = type;
        self.timestamp_ch = timestamp;
        self.worker_id = worker_id;
        self.supervisor_id = supervisor_id;
    }
    return self;
}

@end
