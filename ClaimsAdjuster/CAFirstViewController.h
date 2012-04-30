//
//  CAFirstViewController.h
//  ClaimsAdjuster
//
//  Created by Paul Duncanson on 4/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CAFirstViewController : UIViewController

<UIPickerViewDataSource, UIPickerViewDelegate>

@property (strong, nonatomic) IBOutlet UITextView *ClaimInfo;
@property (strong, nonatomic) IBOutlet UIPickerView *ClaimPicker;
@property (strong, nonatomic) NSArray *ClaimWIP;

@end
