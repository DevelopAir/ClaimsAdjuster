// ----------------------------------------------------------------------
//
//  CADetailViewController.m
//  ClaimsAdjuster
//
//  Created by Paul Duncanson on 5/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
// Rev. History:
//
// ----------------------------------------------------------------------

#import "CADetailViewController.h"
#import "CAAppDelegate.h"

@implementation CADetailViewController

@synthesize nameField = _nameField;
@synthesize causeField = _causeField;
@synthesize policyField = _policyField;
@synthesize listItem = _listItem;
@synthesize dolLabel = _dolLabel;
@synthesize dolField = _dolField;
@synthesize dolDate = _dolDate;
@synthesize theList;

- (void)didReceiveMemoryWarning
{
    NSLog(@"Received memory use warning in CADetailViewController");
    
    [super didReceiveMemoryWarning];
}

- (void) dealloc
{
    [_dolDate release];
    [_dolField release];
    [_dolLabel release];    

    [super dealloc];
}

CAAppDelegate *app;

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"In CADetailViewController at beginning of viewDidLoad");
    self.title = theList.name;
    
    self.nameField.text = self.listItem.name;
    self.causeField.text = self.listItem.cause;
    self.policyField.text = self.listItem.policy;
    self.dolField.text = self.listItem.dol;
    
    app = [[UIApplication sharedApplication] delegate]; 
    NSLog(@"In CADetailViewController at end of viewDidLoad");
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSLog(@"Count items in listArray are %d", 3);
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)theTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"DetailCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
	
	switch(indexPath.section)
	{
		case 0:
			cell.textLabel.text = theList.name;
			break;
		case 1:
			cell.textLabel.text = theList.cause;
			break;
		case 2:
			cell.textLabel.text = theList.dol;
			break;
        case 3:
			cell.textLabel.text = theList.policy;
			break;
	}
	
	return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	
	NSString *sectionName = nil;
	
	switch(section)
	{
		case 0:
			sectionName = [NSString stringWithString:@"Name"];
			break;
		case 1:
			sectionName = [NSString stringWithString:@"Cause"];
			break;
		case 2:
			sectionName = [NSString stringWithString:@"dol"];
			break;
        case 3:
			sectionName = [NSString stringWithString:@"Policy"];
			break;
	}
	
	return sectionName;
}		

#pragma mark - IBActions

- (void)taskDataChaged:(id)sender {
    NSLog(@"Beginning of taskDataChaged");
    self.listItem.name = self.nameField.text;
    self.listItem.cause = self.causeField.text;
    self.listItem.policy = self.policyField.text;
}

-(void)setDol {
    NSLog(@"In CADetailViewController at beginning of setDol");
    dateSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:nil cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil];
    
    [dateSheet setActionSheetStyle:UIActionSheetStyleBlackTranslucent];
    
    CGRect pickerFrame = CGRectMake(0, 44, 0, 0);
    UIDatePicker *dolPicker = [[UIDatePicker alloc] initWithFrame:pickerFrame];
    
    [dolPicker setDatePickerMode:UIDatePickerModeDate];
    
    [dateSheet addSubview:dolPicker];
    
    [dolPicker release];
    
    UIToolbar *controlToolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0,0,dateSheet.bounds.size.width, 44)];
    
    [controlToolBar setBarStyle:UIBarStyleBlack];
    [controlToolBar sizeToFit];
    
    UIBarButtonItem *spacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    UIBarButtonItem *setButton = [[UIBarButtonItem alloc] initWithTitle:@"Set" style:UIBarButtonItemStyleDone target:self action:@selector(dismissDateSet)];
    
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(cancelDateSet)];
    
    [controlToolBar setItem:[NSArray arrayWithObjects:spacer, cancelButton, setButton, nil] animated:NO];
    
    [spacer release];
    [setButton release];
    [cancelButton release];
    
    [dateSheet addSubview:controlToolBar];
    [controlToolBar release];
    
    [dateSheet showInView:self.view];
    
    [dateSheet setBounds:CGRectMake(0,0,320,485)];
    NSLog(@"In CADetailViewController at ending of setDol");
}

-(void) cancelDateSet {
    [dateSheet dismissWithClickedButtonIndex:0 animated:YES];
    [dateSheet release];
    
}

-(void) dismissDateSet {
    NSArray *listOfViews = [dateSheet subviews];
    
    for (UIView *subView in listOfViews) {
        if ([subView isKindOfClass:[UIDatePicker class]]) {
            self.dolDate = [(UIDatePicker *)subView date];
        }
    }
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"MM/dd/yyyy"];
    
    [_dolField setText:[dateFormatter stringFromDate:self.dolDate]];
    
    [dateFormatter release];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
    
    NSDateComponents *dolCalc = [calendar components:unitFlags 
                                            fromDate:self.dolDate 
                                              toDate:[NSDate date] 
                                             options:0];
    
    int months = [dolCalc month];
    int days = [dolCalc day];
    int years = [dolCalc year];
    
    if (years < 0 || days < 0 || months < 0) {
        [self.dolLabel setText:@"Date of Loss cannot be in the future."];
    } else {
        NSString *output = [NSString stringWithFormat:@"%i year %i month %i day", years, months,days];
        [self.dolLabel setText:output];
    }
    
    [dateSheet dismissWithClickedButtonIndex:0 animated:YES];
    
    [dateSheet release];
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    [self setDol];
    return NO;
}

@end

