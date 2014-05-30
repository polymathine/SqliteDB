//
//  Photo.m
//  Database
//
//  Created by Abby Schlageter on 30/05/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import "Photo.h"

@implementation Photo

-(id)initWithData:(NSData*)photoData
{
    if ( (self = [super init]) )
    {
        self.photoData = photoData;
    }
    return self;
}

+(NSData*)getReducedDataForImage:(UIImage*)image
{
    // Resize image
    UIGraphicsBeginImageContext(CGSizeMake(640, 960));
    [image drawInRect: CGRectMake(0, 0, 640, 960)];
    UIImage *smallImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    // convert to NSData and compress image until it's less than 50kb
    CGFloat compressionRatio = 0.5;
    NSData *imageData = UIImageJPEGRepresentation(smallImage, compressionRatio);
    while ([imageData length]>50000)
    {
        compressionRatio=compressionRatio*0.5;
        imageData=UIImageJPEGRepresentation(smallImage,compressionRatio);
        NSLog(@"photo compressed to %lu bytes", (unsigned long)[imageData length]);
    }
    
    //return compressed image as NSData object
    return imageData;
}



@end
