//
//  mapViewController.m
//  map
//
//  Created by Gaynor, Brendan on 4/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MapiPhoneViewController.h"
#import "BridgeAnnotation.h"

enum
{
    kCityAnnotationIndex = 0,
    kBridgeAnnotationIndex
};


@implementation MapiPhoneViewController
@synthesize mapView;
@synthesize mapAnnotations;

- (void)dealloc
{
    NSLog(@"delloc Instance: %p", self);
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    // create out annotations array (in this example only 2)
    self.mapAnnotations = [[NSMutableArray alloc] initWithCapacity:1];
    
    // annotation for Golden Gate Bridge
    BridgeAnnotation *bridgeAnnotation = [[BridgeAnnotation alloc] init];
    [self.mapAnnotations insertObject:bridgeAnnotation atIndex:0];
    [bridgeAnnotation release];
    
    [self gotoLocation];
}

- (void)gotoLocation
{
    NSLog(@"1");
    mapView.delegate = self;
    // start off by default in San Francisco
    MKCoordinateRegion newRegion;
    newRegion.center.latitude = 37.786996;
    newRegion.center.longitude = -122.440100;
    newRegion.span.latitudeDelta = 0.112872;
    newRegion.span.longitudeDelta = 0.109863;
    
    [self.mapView setRegion:newRegion animated:YES];
    
    [self.mapView addAnnotations:self.mapAnnotations];
   //  NSLog(@"self.mapAnnotations %@", self.mapView);
}

- (MKAnnotationView *)mapView:(MKMapView *)theMapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    NSLog(@"hit delegate");
    return  nil;
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
