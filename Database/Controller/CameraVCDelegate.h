//
//  CameraVCDelegate.h
//  Database
//
//  Created by Abby Schlageter on 30/05/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MobileCoreServices/MobileCoreServices.h"

@interface CameraVCDelegate : NSObject <UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (nonatomic, strong) NSString *rut;

@end
