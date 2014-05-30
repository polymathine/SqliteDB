//
//  CheckInOut.h
//  Database
//
//  Created by Abby Schlageter on 30/05/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CheckInOut : NSObject
-(instancetype)initType:(NSString*)type Timestamp:(NSString*)timestamp WorkerID:(NSString*)worker_id SupervisorID:(NSString*)supervisor_id;

@property (nonatomic, retain) NSString *type_ch;
@property (nonatomic, retain) NSString *timestamp_ch;
@property (nonatomic, retain) NSString *worker_id;
@property (nonatomic, retain) NSString *supervisor_id;
@property (nonatomic) int _id;

@end
