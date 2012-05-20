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

@interface CADetailViewController : UITableViewController <UITextFieldDelegate> {
    
    IBOutlet UITableView *tableView;
    
    NSDate *dolDate;
    UIActionSheet *dateSheet;
    UILabel *dolLabel;
    
    NSString *strNameField;
    NSString *strCauseField;
    NSString *strPolicyField;
    NSString *strDOLField;
}    

@property (nonatomic, retain) NSDate *dolDate;
@property (nonatomic, strong) WIPList *listItem;
@property (retain, nonatomic) IBOutlet UILabel *dolLabel;
@property (nonatomic, retain) WIPList *theList;

- (void)viewDidLoad;
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

- (UITableViewCell *)tableView:(UITableView *)tableView 
         cellForRowAtIndexPath:(NSIndexPath *)indexPath;
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section;

- (void)setDol;
- (void) dismissDateSet;
- (void) cancelDateSet;
- (void)textFieldDidBeginEditing:(UITextField *)textField;
- (void)textFieldDidEndEditing:(UITextField *)textField;

- (void)didReceiveMemoryWarning;
- (void) dealloc;

@end
