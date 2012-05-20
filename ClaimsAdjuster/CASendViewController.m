// ----------------------------------------------------------------------
//
//  CASendViewController.m
//  ClaimsAdjuster
//
//  Created by Paul Duncanson on 5/15/12.
//  Copyright (c) 2012 __Invigorate_Software_for_TOPA_Insurance__. All rights reserved.
//
// Rev. History:
//
// ----------------------------------------------------------------------

#import "CASendViewController.h"

@implementation CASendViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark EMailOutputRoutines

- (void)emailImage:(UIImage *)image
{
    Email = [[MFMailComposeViewController alloc] init];
    
    Email.mailComposeDelegate = self;
    
    // Set address, subject and body of email
    [Email setSubject:@"XML and photo sent from ClaimsAssessor IPhone App"];
    
    [Email setToRecipients:[NSArray arrayWithObjects:@"pbduncanson@gmail.com", nil]];
    
    NSString *emailBody = @"ClaimsAssessor prior to conversion to Web Service .";
    
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
    [self becomeFirstResponder];
	[self dismissModalViewControllerAnimated:YES];
}

@end
