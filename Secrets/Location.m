//
//  Location.m
//  Secrets
//
//  Created by Gaynor, Brendan on 4/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Location.h"


@implementation Location
@synthesize coordinate2D;

- (id) init 
{
    self = [super init];
    if(self) {
        
    }
    return self;
}

-(void) getLocation 
{
    locationManager = [[CLLocationManager alloc] init];
    [locationManager setDelegate:self];
    [locationManager setDistanceFilter:kCLDistanceFilterNone];
    [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    [locationManager startUpdatingLocation];
}


#pragma mark - CCLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"%@", newLocation);
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"Could not find location: %@", error);
}

-(void) dealloc
{
    [locationManager release];
    [super dealloc];
}




@end
