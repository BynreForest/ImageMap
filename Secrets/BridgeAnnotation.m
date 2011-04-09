//
//  BridgeAnnotation.m
//  Secrets
//
//  Created by Gaynor, Brendan on 4/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "BridgeAnnotation.h"

@implementation BridgeAnnotation

- (CLLocationCoordinate2D)coordinate;
{
    CLLocationCoordinate2D theCoordinate;
    theCoordinate.latitude = 37.810000;
    theCoordinate.longitude = -122.477989;
    return theCoordinate; 
}

// required if you set the MKPinAnnotationView's "canShowCallout" property to YES
- (NSString *)title
{
    return @"Golden Gate Bridge";
}

// optional
- (NSString *)subtitle
{
    return @"Opened: May 27, 1937";
}

- (void)dealloc
{
    [super dealloc];
}

@end