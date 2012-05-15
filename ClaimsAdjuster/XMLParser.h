// ----------------------------------------------------------------------
//
//  XMLParser.h
//  ClaimsAdjuster
//
//  Created by Paul Duncanson on 2/28/12.
//  Copyright (c) 2012__Invigorate_Software_For_Topa_Insurance__. All rights reserved.
//
// Rev. History:
//
// ----------------------------------------------------------------------

#import <Foundation/Foundation.h>
#import "CAAppDelegate.h"
#import "WIPList.h"

@interface XMLParser : NSObject <NSXMLParserDelegate> {
    
    CAAppDelegate *app;
    WIPList *theList;
    NSMutableString *currentElementValue;
    
}

-(id)initXMLParser;

@end
