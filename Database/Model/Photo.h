//
//  Photo.h
//  Database
//
//  Created by Abby Schlageter on 30/05/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Photo : NSObject
@property (nonatomic, retain) NSData *photoData;

-(id)initWithData:(NSData*)photoData;
+(NSData*)getReducedDataForImage:(UIImage*)image;

@end
