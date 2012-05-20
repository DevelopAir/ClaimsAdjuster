// ----------------------------------------------------------------------
//
//  CATableViewController.m
//  ClaimsAdjuster
//
//  Created by Paul Duncanson on 2/28/12.
//  Copyright (c) 2012__Invigorate_Software_For_Topa_Insurance__. All rights reserved.
//
// Rev. History:
//
// ----------------------------------------------------------------------

#import "CATableViewController.h"
#import "CADetailViewController.h"
#import "WIPList.h"

@implementation CATableViewController

@synthesize app;
@synthesize detailViewController = _detailViewController;
@synthesize theList;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    app = [[UIApplication sharedApplication] delegate];
    [self.tableView reloadData];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}
 
- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}
 
// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [app.listArray count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    theList = [app.listArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = theList.name;    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CADetailViewController *detailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"CADetailViewController"];
    
    detailViewController.theList = [app.listArray objectAtIndex:indexPath.row];

    //NSLog(@"theList.Name   is %@", [detailViewController.theList name]); 
    //NSLog(@"theList.Cause  is %@", [detailViewController.theList cause]); 
    //NSLog(@"theList.Dol    is %@", [detailViewController.theList dol]);
    //NSLog(@"theList.Policy is %@", [detailViewController.theList policy]);
    
    [self.navigationController pushViewController:detailViewController animated:YES]; 
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender 
{
      
}

#pragma mark Memory Management

- (void)didReceiveMemoryWarning
{
    NSLog(@"Received memory use warning in CATableViewController");
    [super didReceiveMemoryWarning];
}

- (void) dealloc
{
    //[app release];
    //[theList release];
    
    [super dealloc];
}

@end
