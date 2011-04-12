//
//  mapViewController.m
//  map
//
//  Created by Gaynor, Brendan on 4/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MapiPhoneViewController.h"
#import "Annotation.h"
#import "BridgeAnnotation.h"
#import "DetailViewController.h"
#import "SecretEntity.h"
#import "SecretsAppDelegate.h"

enum
{
    kCityAnnotationIndex = 0,
    kBridgeAnnotationIndex
};


@implementation MapiPhoneViewController
@synthesize mapView;
@synthesize mapAnnotations;
@synthesize detailViewController;

#pragma mark -

+ (CGFloat)annotationPadding;
{
    return 10.0f;
}
+ (CGFloat)calloutHeight;
{
    return 40.0f;
}


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
    SecretsAppDelegate *sad = [[UIApplication sharedApplication] delegate];
    
    managedObjectContext = sad.managedObjectContext;
    
    //Register to receive a notification when the model has been updated 
	[[NSNotificationCenter defaultCenter] addObserver:self 
											 selector:@selector(RecordsUpdated:) 
												 name:@"Processed" 
											   object:nil];
    /*
    // create out annotations array (in this example only 2)
    self.mapAnnotations = [[NSMutableArray alloc] initWithCapacity:1];
    
    // annotation for Golden Gate Bridge
    Annotation *annotation = [[Annotation alloc] init];
    //[self.mapView addAnnotation:bridgeAnnotation];
    [mapAnnotations addObject:annotation];
    
    [self.mapView addAnnotations:mapAnnotations];    
    [self gotoLocation];
     */
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

#pragma mark -
#pragma mark MKMapViewDelegate

- (void)showDetails:(id)sender
{
    // the detail view does not want a toolbar so hide it
   // [self.navigationController setToolbarHidden:YES animated:NO];
    
    [self.navigationController pushViewController:self.detailViewController animated:YES];
}


- (MKAnnotationView *)mapView:(MKMapView *)theMapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    NSLog(@"hit delegate");
    if ([annotation isKindOfClass:[Annotation class]])   // for City of San Francisco
    {
        static NSString* AnnotationIdentifier = @"AnnotationIdentifier";
        MKPinAnnotationView* pinView =
        (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:AnnotationIdentifier];
        
        if (!pinView)
        {
            MKAnnotationView *annotationView = [[[MKAnnotationView alloc] initWithAnnotation:annotation
                                                                             reuseIdentifier:AnnotationIdentifier] autorelease];
            annotationView.canShowCallout = YES;
            
            UIImage *flagImage = [UIImage imageNamed:@"flag.png"];
            
            CGRect resizeRect;
            
            resizeRect.size = flagImage.size;
            CGSize maxSize = CGRectInset(self.view.bounds,
                                         [MapiPhoneViewController annotationPadding],
                                         [MapiPhoneViewController annotationPadding]).size;
            maxSize.height -= self.navigationController.navigationBar.frame.size.height + [MapiPhoneViewController calloutHeight];
            if (resizeRect.size.width > maxSize.width)
                resizeRect.size = CGSizeMake(maxSize.width, resizeRect.size.height / resizeRect.size.width * maxSize.width);
            if (resizeRect.size.height > maxSize.height)
                resizeRect.size = CGSizeMake(resizeRect.size.width / resizeRect.size.height * maxSize.height, maxSize.height);
            
            resizeRect.origin = (CGPoint){0.0f, 0.0f};
            UIGraphicsBeginImageContext(resizeRect.size);
            [flagImage drawInRect:resizeRect];
            UIImage *resizedImage = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            
            annotationView.image = resizedImage;
            annotationView.opaque = NO;
            
            UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            [rightButton addTarget:self
                            action:@selector(showDetails:)
                  forControlEvents:UIControlEventTouchUpInside];
            annotationView.rightCalloutAccessoryView = rightButton;
            
            return annotationView;
        }
        else
        {
            pinView.annotation = annotation;
        }
        return pinView;

    }
}

#pragma mark -
#pragma mark NSNotification selector

-(void)	RecordsUpdated:(NSNotification*)notfication
{
    MKCoordinateRegion newRegion;
    newRegion.center.latitude = 37.786996;
    newRegion.center.longitude = -122.440100;
    newRegion.span.latitudeDelta = 0.112872;
    newRegion.span.longitudeDelta = 0.109863;
    
    [self.mapView setRegion:newRegion animated:YES];

	NSLog(@"iPhone Map records updated");
    mapView.delegate = self;
    
    self.mapAnnotations = [[NSMutableArray alloc] init];
	
	
	NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *secretsEntity = [NSEntityDescription entityForName:@"SecretEntity" inManagedObjectContext:managedObjectContext];
    [request setEntity:secretsEntity];
    
    NSLog(@"Request: %@", request);
    
    NSError *error;
    
    NSArray *items = [managedObjectContext executeFetchRequest:request error:&error];
    [request release];
	
	for(int i = 0; i < [items count]; i++)
	{
		NSLog(@"Map Data Loop");	
        
		SecretEntity *se = (SecretEntity *)[items objectAtIndex:i];
		
		double tmpLat = [[se lat] doubleValue];
		double tmpLon = [[se lon] doubleValue];
		
		Annotation *annotation = [[Annotation alloc] init];
		annotation.lat = tmpLat;
		annotation.lon = tmpLon;
		//annotation.annotationTitle = [se salesfirstname];
		//annotation.annotationSubTitle = [se saleslastname];
		
		[self.mapAnnotations addObject:annotation];
		
		[annotation release];
		
	}
	
	/**
	 mapView adds the annotationsArray which holds the ErbituxAnnotations
	 **/
	[self.mapView addAnnotations:mapAnnotations];
	
	[mapAnnotations release];
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
