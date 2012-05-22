// ----------------------------------------------------------------------
//
//  CANotesViewController.h
//  ClaimsAdjuster
//
//  Created by Paul Duncanson on 5/14/12.
//  Copyright (c) 2012 __Invigorate_Software_for_TOPA_Insurance__. All rights reserved.
//
// Rev. History:
//
// ----------------------------------------------------------------------

#import <UIKit/UIKit.h>

@interface CANotesViewController : UIViewController

@property (retain, nonatomic) IBOutlet UITextView *ClaimNote;

@property (retain, nonatomic) IBOutlet UIBarButtonItem *goToPhotoFromNotesButton;

@end
