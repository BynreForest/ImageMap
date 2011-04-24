//
//  Annotation.m
//  Secrets
//
//  Created by Gaynor, Brendan on 4/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Annotation.h"


@implementation Annotation
@synthesize annotationDesc;
@synthesize lat,lon;
@synthesize category;
@synthesize pk;
@synthesize annotationTitle, annotationSubTitle;



- (CLLocationCoordinate2D)coordinate;
{
    CLLocationCoordinate2D theCoordinate;
    theCoordinate.latitude = lat;
    theCoordinate.longitude = lon;
    return theCoordinate; 
}

- (NSNumber *)pk
{
    return pk;
}


// required if you set the MKPinAnnotationView's "canShowCallout" property to YES
- (NSString *)title
{
    return annotationTitle;
}

// optional
- (NSString *)subtitle
{
    return annotationSubTitle;
}


- (void)dealloc
{
    [super dealloc];
}


@end
