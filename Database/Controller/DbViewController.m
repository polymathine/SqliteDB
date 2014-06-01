//
//  DbViewController.m
//  Database
//
//  Created by Abby Schlageter on 13/05/2014.
//  Copyright (c) 2014 Abby Schlageter. All rights reserved.
//

#import "DbViewController.h"
#import "PhotoViewController.h"

@interface DbViewController ()

@end

@implementation DbViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)goToPhotoViewController
{
    [self performSegueWithIdentifier:@"photoSegue" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:@"photoSegue"])
    {
        // Get reference to the destination view controller
        PhotoViewController *vc = [segue destinationViewController];
        //pass rut to destination vc
        vc.rut = self.workerText.text;
    }
}


@end
