//
//  LibraryPath.h
//  Database
//
//  Created by Abby Schlageter on 13/05/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LibraryPath : NSObject
+(NSString*)getLibraryPath;
+(NSString*)getTargetPathTo:(NSString*)filename;



@end
