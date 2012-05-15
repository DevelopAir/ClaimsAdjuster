// ----------------------------------------------------------------------
//
//  CATableViewController.h
//  ClaimsAdjuster
//
//  Created by Paul Duncanson on 2/28/12.
//  Copyright (c) 2012__Invigorate_Software_For_Topa_Insurance__. All rights reserved.
//
// Rev. History:
//
// ----------------------------------------------------------------------

#import <UIKit/UIKit.h>
#import "CAAppDelegate.h"
#import "WIPList.h"
@class CADetailViewController;

@interface CATableViewController : UITableViewController
{
}
@property (strong, nonatomic) CADetailViewController *detailViewController;
@property (nonatomic, retain) CAAppDelegate *app;
@property (nonatomic, retain) WIPList *theList;

- (void)didReceiveMemoryWarning;

@end
