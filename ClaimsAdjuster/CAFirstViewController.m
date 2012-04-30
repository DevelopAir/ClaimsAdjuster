//
//  CAFirstViewController.m
//  ClaimsAdjuster
//
//  Created by Paul Duncanson on 4/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CAFirstViewController.h"

@interface CAFirstViewController ()

@end

@implementation CAFirstViewController
@synthesize ClaimInfo;
@synthesize ClaimPicker;
@synthesize ClaimWIP = _ClaimWIP;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Load the Claims Work in Progress List
    _ClaimWIP = [[NSArray alloc] initWithObjects:@"Aames, Anthony", @"Crogan, Charles", @"Drake, David", @"Ewing, Edward", @"Frank, Francis", @"Golf, Gus", @"Hardy, Hank", nil];
}

- (void)viewDidUnload
{
    [self setClaimInfo:nil];
    [self setClaimPicker:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

#pragma Mark UI Picker View

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *) pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 7;
}


@end
