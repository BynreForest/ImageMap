//
//  MapiPhoneViewController.m
//  Secrets
//
//  Created by Gaynor, Brendan on 4/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MapiPhoneViewController.h"
#import "Annotation.h"


@implementation MapiPhoneViewController
@synthesize mapView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    mapView.delegate = nil;
    [mapView release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    self.mapView.mapType = MKMapTypeSatellite;   // also MKMapTypeSatellite or MKMapTypeHybrid
    
    mapView.delegate = self;
    
    // create out annotations array (in this example only 2)
    annotationArray = [[NSMutableArray alloc] initWithCapacity:1];

    
   // model = [[Model alloc] init];
    
    /*
     show all world in view
     */
    /*
    MKCoordinateRegion region;
    region.center.latitude=0.0f;
    region.center.longitude=0.0f;
    region.span.latitudeDelta=180.0f;
    region.span.longitudeDelta=360.0f;
    [mapView setRegion:region];
    
    [mapView setRegion:[mapView regionThatFits:region] animated:TRUE];
     
     */
    // Do any additional setup after loading the view from its nib.
    
    NSLog(@"CREATING Annotation View1");
    // annotation for the City of San Francisco
    Annotation *sannotation = [[Annotation alloc] init];
   // [mapView addAnnotation:annotation];
    //[annotation release];
    
    [annotationArray addObject:sannotation];
    
    [sannotation release];

    
    /**
	 mapView adds the annotationsArray which holds the ErbituxAnnotations
	 **/
	[self.mapView addAnnotations:annotationArray];
    
    
     NSLog(@"CREATING Annotation View1A");
}

#pragma mark -
#pragma mark MKMapViewDelegate

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    
    NSLog(@"CREATING Annotation View2");
    
    
    MKPinAnnotationView *pin = (MKPinAnnotationView *) [self.mapView dequeueReusableAnnotationViewWithIdentifier: @"AnnotationIdentifier"];
    if (pin == nil)
    {                
        NSLog(@"CREATING Annotation View3");
                
        pin.canShowCallout = NO;
        pin.animatesDrop = YES;
        UIImageView *iv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"flag_finish"]];
        [pin addSubview:iv];
        //pin.image = [UIImage imageNamed:@"flag_finish"];
        return pin;
                
    }
    
    return nil;
}

- (void)mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray *)views
{
    NSLog(@"Log this");

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.mapView = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
