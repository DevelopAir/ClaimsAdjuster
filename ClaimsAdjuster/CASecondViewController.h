// ----------------------------------------------------------------------
//
//  CASecondViewController.h
//  ClaimsAdjuster
//
//  Created by Paul Duncanson on 2/28/12.
//  Copyright (c) 2012 __Invigorate_Software_for_TOPA_Insurance__. All rights reserved.
//
// Rev. History:
//
// ----------------------------------------------------------------------

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface CASecondViewController : UIViewController
<UINavigationControllerDelegate, UIImagePickerControllerDelegate, MFMailComposeViewControllerDelegate>
{
    MFMailComposeViewController *Email;
    UIImagePickerController *imagePicker;
}

-(IBAction)btnActivateCameraClicked:(id) sender;
- (void)emailImage:(UIImage *)image;
- (void)didReceiveMemoryWarning;

@end
