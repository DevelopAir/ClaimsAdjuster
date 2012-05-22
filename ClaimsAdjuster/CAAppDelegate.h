// ----------------------------------------------------------------------
//
//  CAAppDelegate.h
//  ClaimsAdjuster
//
//  Created by Paul Duncanson on 2/28/12.
//  Copyright (c) 2012 __Invigorate_Software_for_TOPA_Insurance__. All rights reserved.
//
// Rev. History:
//
// ----------------------------------------------------------------------

#import <UIKit/UIKit.h>

@interface CAAppDelegate : UIResponder <UIApplicationDelegate> {
    NSInteger currentIdx;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSMutableArray *listArray;
@property (strong, nonatomic) UINavigationController *navigationController;

@end
