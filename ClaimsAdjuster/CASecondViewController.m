// ----------------------------------------------------------------------
//
//  CASecondViewController.m
//  ClaimsAdjuster
//
//  Created by Paul Duncanson on 2/28/12.
//  Copyright (c) 2012 __Invigorate_Software_for_TOPA_Insurance__. All rights reserved.
//
// Rev. History:
//
// ----------------------------------------------------------------------

#import "CASecondViewController.h"

@implementation CASecondViewController

- (id) init 
{         
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    //UIAlertView *alert [[UIAlertView alloc] initWithTitle:@"This is my title" message:@"This is my message" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Okay", nil];
    
    //[alert show];
    //[alert release];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

#pragma mark ImagePickerRoutines

-(IBAction)btnActivateCameraClicked:(id) sender
{
	// Create image picker controller
    imagePicker = [[UIImagePickerController alloc] init];
    
	imagePicker.sourceType =  UIImagePickerControllerSourceTypeCamera;
    
	imagePicker.delegate = self;
        
    // Show image picker
	[self presentModalViewController:imagePicker animated:YES];	
}

-(void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    if (error == NULL) 
    {
        UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Success" message:@"Image successfully saved." delegate:self cancelButtonTitle:@"Close" otherButtonTitles:nil];
        [error show];
        [error release];
    }
    else {
        UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"ERROR" message:@"Image was not saved." delegate:self cancelButtonTitle:@"Close" otherButtonTitles:nil];
        [error show];
        [error release];

    }
}

- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
	// Access image from dictionary
	UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    
    [self becomeFirstResponder];
    
	// Close the camera
	[self dismissModalViewControllerAnimated:YES];
    
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), self);
    
    
	// Pass image to method that will email it if user agrees.
    //[self performSelector:@selector(emailImage:) withObject:image afterDelay:1.0];
}

#pragma mark Memory Management

- (void)dealloc 
{
    [imagePicker release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    NSLog(@"Received memory use warning in CASecondViewController");
    [super didReceiveMemoryWarning];
}

@end
