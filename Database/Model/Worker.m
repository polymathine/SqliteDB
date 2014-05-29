//
//  Worker.m
//  Database
//
//  Created by Abby Schlageter on 29/05/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import "Worker.h"

@implementation Worker

-(id)initWorkerNameFirst:(NSString*)firstname Mother:(NSString*)mothername Father:(NSString*)fathername RUT:(NSString*)rut Transport:(NSString*)transport andPhoto:(NSData*)photo
{
    if ( (self = [super init]) )
    {
        self.firstname = firstname;
        self.mothername = mothername;
        self.fathername = fathername;
        self.rut = rut;
        self.transport = transport;
        self.photo = photo;
    }
    return self;
}

@end
