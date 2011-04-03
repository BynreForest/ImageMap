//
//  MapiPhoneViewController.h
//  Secrets
//
//  Created by Gaynor, Brendan on 4/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>


@interface MapiPhoneViewController : UIViewController {
    IBOutlet MKMapView *mapView;
    
}

@property (nonatomic, retain)IBOutlet MKMapView *mapView;

@end
