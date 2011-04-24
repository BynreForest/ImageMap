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

@class DetailViewController;

@interface MapiPhoneViewController : UIViewController <MKMapViewDelegate> {
    MKMapView *mapView;
    Model *model;
    NSMutableArray *mapAnnotations;
    DetailViewController *detailViewController;
    NSManagedObjectContext *managedObjectContext;
    
}


@property (nonatomic, retain) IBOutlet DetailViewController *detailViewController;
@property (nonatomic, retain) IBOutlet MKMapView *mapView;
@property (nonatomic, retain) NSMutableArray *mapAnnotations;

- (void)gotoLocation;
+ (CGFloat)annotationPadding;
+ (CGFloat)calloutHeight;


@end
