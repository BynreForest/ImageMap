//
//  Location.h
//  Secrets
//
//  Created by Gaynor, Brendan on 4/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>


@interface Location : NSObject <CLLocationManagerDelegate> {
    
    CLLocationManager *locationManager;
    CLLocationCoordinate2D coordinate2D;
    
}

@property CLLocationCoordinate2D coordinate2D;

-(void) getLocation;

@end
