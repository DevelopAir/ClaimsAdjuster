//
//  CAClaims.h
//  ClaimsAdjuster
//
//  Created by Paul Duncanson on 2/28/12.
//  Copyright (c) 2012 __Invigorate_Software_for_TOPA_Insurance__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CAFirstViewController : UIViewController
<UIPickerViewDataSource, UIPickerViewDelegate>
@property (strong, nonatomic) IBOutlet UITextView *ClaimInfo;
@property (strong, nonatomic) IBOutlet UIPickerView *ClaimPicker;
@property (strong, nonatomic) NSArray *ClaimWIP;

@end
