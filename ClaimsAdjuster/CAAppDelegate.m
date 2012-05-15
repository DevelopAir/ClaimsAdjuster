// ----------------------------------------------------------------------
//
//  CAAppDelegate.m
//  ClaimsAdjuster
//
//  Created by Paul Duncanson on 2/28/12.
//  Copyright (c) 2012 __Invigorate_Software_for_TOPA_Insurance__. All rights reserved.
//
// Rev. History:
//
// ----------------------------------------------------------------------

#import "CAAppDelegate.h"
#import "XMLParser.h"

@implementation CAAppDelegate

@synthesize window = _window;
@synthesize listArray;
@synthesize navigationController = _navigationController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // To access current WIP Claims from UI Test Portal uncomment following block and 
    // comment out local access used during local development
    
    /*
    //----Retrieve current WIP Claims from UI Test Portal-------
    NSURL *url = [[NSURL alloc] initWithString:@"http://www.topa-portal.com/WIPClaims.xml"];
    
    NSData *data = [[NSData alloc] initWithContentsOfURL:url]; 
    //----------------------------------------------------------
    */
    
    //----Retrieve WIP Claims test data from local xml file-----
    NSString *path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Claims.xml"];
    
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    //-----------------------------------------------------------
    
    NSXMLParser *nsxmlParser = [[NSXMLParser alloc] initWithData:data];
    
    XMLParser *theXMLParser = [[XMLParser alloc] initXMLParser];
    
    [nsxmlParser setDelegate:theXMLParser];
    
    // Verify that XML parsing worked.
    BOOL parseOk = [nsxmlParser parse];
    
    if (parseOk) {
        NSLog(@"WIP Count is %i", [listArray count]);
    }
    else {
        NSLog(@"Error while parsing XML data from remote server.");
    }

    [data release];
    [nsxmlParser release];
    [theXMLParser release]; 
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
}

- (void)applicationWillTerminate:(UIApplication *)application
{

}

@end
