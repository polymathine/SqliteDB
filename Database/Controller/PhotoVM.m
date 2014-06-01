//
//  PhotoVM.m
//  Database
//
//  Created by Abby Schlageter on 31/05/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import "PhotoVM.h"
#import "Singleton.h"
#import "Photo.h"

@implementation PhotoVM

+(void)savePhoto:(UIImage*)photo toRut:(NSString*)rut
{
    sqlite3 *database = [[Singleton sharedInstance] retrieveDatabase];
    [Photo addPhoto:photo forRut:rut inDatabase:database];
}

@end
