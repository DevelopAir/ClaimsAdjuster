// ----------------------------------------------------------------------
//
//  CASendViewController.h
//  ClaimsAdjuster
//
//  Created by Paul Duncanson on 5/15/12.
//  Copyright (c) 2012 __Invigorate_Software_for_TOPA_Insurance__. All rights reserved.
//
// Rev. History:
//
// ----------------------------------------------------------------------

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface CASendViewController : UIViewController
<MFMailComposeViewControllerDelegate>
{
    MFMailComposeViewController *email;
}

-(void)emailImage:(UIImage *)image;


@end
