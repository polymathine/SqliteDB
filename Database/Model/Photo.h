//
//  Photo.h
//  Database
//
//  Created by Abby Schlageter on 30/05/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Worker.h"
#import <sqlite3.h>

@interface Photo : NSObject

+(NSData*)getReducedDataForImage:(UIImage*)image;
+(void)addPhoto:(UIImage*)image forRut:(NSString*)rut inDatabase:(sqlite3*)database;

@end
