//
//  Worker.h
//  Database
//
//  Created by Abby Schlageter on 29/05/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Worker : NSObject

-(id)initWorkerNameFirst:(NSString*)firstname Mother:(NSString*)mothername Father:(NSString*)fathername RUT:(NSString*)rut Transport:(NSString*)transport andPhoto:(NSData*)photo;

@property (nonatomic, retain) NSString *firstname;
@property (nonatomic, retain) NSString *mothername;
@property (nonatomic, retain) NSString *fathername;
@property (nonatomic, retain) NSString *rut;
@property (nonatomic, retain) NSString *transport;
@property (nonatomic, retain) NSData *photo;


@end
