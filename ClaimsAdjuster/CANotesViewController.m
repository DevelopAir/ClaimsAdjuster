// ----------------------------------------------------------------------
//
//  CANotesViewController.m
//  ClaimsAdjuster
//
//  Created by Paul Duncanson on 5/14/12.
//  Copyright (c) 2012 __Invigorate_Software_for_TOPA_Insurance__. All rights reserved.
//
// Rev. History:
//
// ----------------------------------------------------------------------

#import "CANotesViewController.h"

@interface CANotesViewController ()

@end

@implementation CANotesViewController
@synthesize ClaimNote;
@synthesize goToPhotoFromNotesButton;

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
    [self setClaimNote:nil];
    [self setGoToPhotoFromNotesButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark Memory Management

- (void)dealloc {
    [ClaimNote release];
    [goToPhotoFromNotesButton release];
    [super dealloc];
}

@end
