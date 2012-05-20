// ----------------------------------------------------------------------
//
//  WIPList.m
//  ClaimsAdjuster
//
//  Created by Paul Duncanson on 2/28/12.
//  Copyright (c) 2012__Invigorate_Software_For_Topa_Insurance__. All rights reserved.
//
// Rev. History:
//
// ----------------------------------------------------------------------

#import "WIPList.h"

@implementation WIPList

@synthesize name, cause, dol, policy, listID, premCodes;

-(id) :(NSString *)
        edtName : 
        edtCause : (NSString *) 
        edtDol : (NSString *)
        edtPolicy : (NSString *) 
        edtPremCodes 
{
    
    self = [super init];
    if (self) {
        self.name = edtName;        
        self.cause = edtCause;
        self.dol = edtDol;
        self.policy = edtPolicy;
        self.premCodes = edtPremCodes;
    }
    return self;
}

@end
