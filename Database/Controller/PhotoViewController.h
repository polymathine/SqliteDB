//
//  PhotoViewController.h
//  Database
//
//  Created by Abby Schlageter on 30/05/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MobileCoreServices/MobileCoreServices.h"

@interface PhotoViewController : UIViewController

@property (nonatomic, retain)  IBOutlet UIImageView *imageView;
@property (nonatomic, strong) NSString *rut;

@end
