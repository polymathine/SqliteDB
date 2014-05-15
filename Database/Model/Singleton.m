//
//  Singleton.m
//  Database
//
//  Created by Abby Schlageter on 15/05/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import "Singleton.h"

@implementation Singleton

+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken = 0;
    
    __strong static id _sharedObject = nil;
    //ensures sharedObject only created once
    dispatch_once(&onceToken, ^{
        _sharedObject = [[[self class] alloc] init];
    });
    return _sharedObject;
}




@end
