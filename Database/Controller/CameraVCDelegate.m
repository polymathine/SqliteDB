//
//  CameraVCDelegate.m
//  Database
//
//  Created by Abby Schlageter on 30/05/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import "CameraVCDelegate.h"
#import "PhotoVM.h"

@implementation CameraVCDelegate

#pragma mark CAMERA DELEGATE METHODS

// For responding to the user tapping Cancel.
- (void) imagePickerControllerDidCancel: (UIImagePickerController *) picker {
    
    [picker dismissViewControllerAnimated:NO completion:Nil];
}

// For responding to the user accepting a newly-captured picture or movie
- (void) imagePickerController: (UIImagePickerController *) picker
 didFinishPickingMediaWithInfo: (NSDictionary *) info {
    
    NSString *mediaType = [info objectForKey: UIImagePickerControllerMediaType];
    UIImage *originalImage, *editedImage, *imageToSave;
    
    // Handle a still image capture
    if (CFStringCompare ((CFStringRef) mediaType, kUTTypeImage, 0)== kCFCompareEqualTo)
    {
        editedImage = (UIImage *) [info objectForKey:UIImagePickerControllerEditedImage];
        originalImage = (UIImage *) [info objectForKey:UIImagePickerControllerOriginalImage];
        
        if (editedImage)
        {
            imageToSave = editedImage;
        } else
        {
            imageToSave = originalImage;
        }
        
        //need to sort out how will pass RUT here from DbViewController!***************************

        
        // Save the new image (original or edited) to
        [PhotoVM savePhoto:imageToSave toRut:self.rut];
        
    }
    [picker dismissViewControllerAnimated:NO completion:Nil];
    
}


@end
