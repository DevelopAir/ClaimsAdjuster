// ----------------------------------------------------------------------
//
//  CADetailViewController.h
//  ClaimsAdjuster
//
//  Created by Paul Duncanson on 2/28/12.
//  Copyright (c) 2012__Invigorate_Software_For_Topa_Insurance__. All rights reserved.
//
// Rev. History:
//
// ----------------------------------------------------------------------

#import <UIKit/UIKit.h>
#import "WIPList.h"
@interface CADetailViewController : UITableViewController {
    
    IBOutlet UITableView *tableView;
    
    NSDate *dolDate;
    UIActionSheet *dateSheet;
    UILabel *dolLabel;
    
    UITextField *nameField;
    UITextField *causeField;
    UITextField *policyField;
    UITextField *dolField;
    
}    
- (void)didReceiveMemoryWarning;

@property (nonatomic, strong) IBOutlet UITextField *nameField;
@property (nonatomic, strong) IBOutlet UITextField *causeField;
@property (retain, nonatomic) IBOutlet UITextField *dolField;
@property (nonatomic, strong) IBOutlet UITextField *policyField;

@property (nonatomic, retain) NSDate *dolDate;
@property (nonatomic, strong) WIPList *listItem;
@property (retain, nonatomic) IBOutlet UILabel *dolLabel;

- (IBAction)taskDataChaged:(id)sender;

- (void) setDol;
- (void) dismissDateSet;
- (void) cancelDateSet;

@property (nonatomic, retain) WIPList *theList;

@end
