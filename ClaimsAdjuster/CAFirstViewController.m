//
//  CAClaims.m
//  ClaimsAdjuster
//
//  Created by Paul Duncanson on 2/28/12.
//  Copyright (c) 2012 __Invigorate_Software_for_TOPA_Insurance__. All rights reserved.
//

#import "CAFirstViewController.h"

@interface CAFirstViewController ()

@end

@implementation CAFirstViewController
@synthesize ClaimInfo = _ClaimInfo;
@synthesize ClaimPicker;
@synthesize ClaimWIP = _ClaimWIP;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Load the Claims Work in Progress List
    _ClaimWIP = [[NSArray alloc] initWithObjects:
                 @"Aames, Anthony", 
                 @"Crogan, Charles", 
                 @"Drake, David", 
                 @"Ewing, Edward", 
                 @"Frank, Francis", 
                 @"Golf, Gus", 
                 @"Hardy, Hank", 
                 nil];
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

#pragma Mark UIPickerView
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _ClaimWIP.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [_ClaimWIP objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    _ClaimInfo = [NSString stringWithFormat:@"%x", row];
    
    //NSString *str = [NSString stringWithFormat:"%x", theNumber];
}

@end
