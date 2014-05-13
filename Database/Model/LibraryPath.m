//
//  LibraryPath.m
//  Database
//
//  Created by Abby Schlageter on 13/05/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import "LibraryPath.h"

@implementation LibraryPath

+(NSString*)getLibraryPath
{
    NSString *libraryPath = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject];
    return libraryPath;
}

+(NSString*)getTargetPathTo:(NSString*)filename
{
    return [[self getLibraryPath] stringByAppendingString:filename];
}

@end
