//
//  CASecondViewController.m
//  ClaimsAdjuster
//
//  Created by Paul Duncanson on 2/28/12.
//  Copyright (c) 2012 __Invigorate_Software_for_TOPA_Insurance__. All rights reserved.
//

#import "CASecondViewController.h"

@implementation CASecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    if ([MFMailComposeViewController canSendMail]) {
        ActivateCamera.enabled = YES;
    } else {
        ActivateCamera.enabled = NO;
    }
}

- (void)viewDidUnload
{
    ActivateCamera = nil;
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

#pragma mark EMailOutputRoutinesToTestInterfaceBeforeConvertingToWS

- (void)emailImage:(UIImage *)image
{
    Email = [[MFMailComposeViewController alloc] init];
    
    Email.mailComposeDelegate = self;
    
    // Set address, subject and body of email
    [Email setSubject:@"XML and photo sent from ClaimsAssessor IPad App"];

    [Email setToRecipients:[NSArray arrayWithObjects:@"pbduncanson@gmail.com", nil]];

    NSString *emailBody = @"Interface refinement app prior to WS conversion.";

    [Email setMessageBody:emailBody isHTML:NO];

    // Create NSData object that will hold PNG image of photo taken
    NSData *data = UIImagePNGRepresentation(image);

    // Attach image to email
    [Email addAttachmentData:data mimeType:@"image/png" fileName:@"CameraImage"];

    // Show email and allow user to send or cancel.
    [self presentModalViewController:Email animated:YES];

}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error 
{	
	[self dismissModalViewControllerAnimated:YES];
}

- (void)buttonPressed:(UIButton *)ActivateCamera
{
	// Create image picker controller
    imagePicker = [[UIImagePickerController alloc] init];
    
	imagePicker.sourceType =  UIImagePickerControllerSourceTypeCamera;
    
	// imagePicker.delegate = self;
        
    // Show image picker
	[self presentModalViewController:imagePicker animated:YES];	
}

- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
	// Access image from dictionary
	UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    
    [self becomeFirstResponder];
    
	// Close the camera
	[self dismissModalViewControllerAnimated:YES];
    
	// Pass image to method that will email it
    // A delay is needed so camera view can be dismissed.  !!!!! Spawn a thread to handle this 
                                                              // to improve interactivity when 
                                                              // there's time.
    
    [self performSelector:@selector(emailImage:) withObject:image afterDelay:1.0];
}

- (void)dealloc 
{
    [Email release];
    [imagePicker release];
    [super dealloc];
}

@end
