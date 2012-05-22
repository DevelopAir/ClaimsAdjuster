// ----------------------------------------------------------------------
//
//  CASecondViewController.h
//  ClaimsAdjuster
//
//  Created by Paul Duncanson on 2/28/12.
//  Copyright (c) 2012__Invigorate_Software_for_TOPA_Insurance__. All rights reserved.
//
// Rev. History:
//
// ----------------------------------------------------------------------

#import <UIKit/UIKit.h>
#import "WIPList.h"

@interface CASecondViewController : UIViewController
<UINavigationControllerDelegate, UIImagePickerControllerDelegate>
{
    UIImagePickerController *imagePicker;
}

@property (retain, nonatomic) IBOutlet UIBarButtonItem *goToSendFromPhotoButton;

-(IBAction) btnActivateCameraClicked:(id) sender;

@property (retain) IBOutlet UILabel *selectedClaim;
@property (nonatomic, retain) WIPList *theList;

- (void) image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo;
- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info;

- (void) dealloc;
- (void) didReceiveMemoryWarning;
@end   
