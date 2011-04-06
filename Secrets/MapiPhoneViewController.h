//
//  MapiPhoneViewController.h
//  Secrets
//
//  Created by Gaynor, Brendan on 4/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Model.h"

@interface MapiPhoneViewController : UIViewController <MKMapViewDelegate> {
    MKMapView *mapView;
    Model *model;
    NSMutableArray *annotationArray;
    
}

@property (nonatomic, retain) IBOutlet MKMapView *mapView;

@end
