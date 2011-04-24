//
//  DetailViewController.m
//  Secrets
//
//  Created by Gaynor, Brendan on 4/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DetailViewController.h"
#import "ASIHTTPRequest.h"

@implementation DetailViewController
@synthesize pk, oldpk;
@synthesize imgView;
@synthesize textView;

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
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - ASIHTTPRequest delegate

- (void)requestFinished:(ASIHTTPRequest *)request
{
    NSLog(@"Request Finished");
    // Use when fetching text data
  //  NSString *responseString = [request responseString];
    
    // Use when fetching binary data
    NSData *responseData = [request responseData];
    
   // NSLog(@"Data For Image: %@", [request responseData]);
    
    UIImage *img = [[UIImage alloc] initWithData:responseData];
    [imgView setImage:img];
    [img release];
    
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
   
    NSError *error = [request error];
    
     NSLog(@"Request Failed: %@", error);
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    //intialize oldpk
    int i = 0;
    oldpk = [[NSNumber alloc] initWithInt:i];
    
   // textView.font = [UIFont fontWithName:@"Handwriting - Dakota" size:14];
    
}

- (void) viewDidAppear:(BOOL)animated
{
    // Do any additional setup after loading the view from its nib.
    //oldpk = [NSNumber numberWithInt:0];
    NSLog(@"Primary Key:  %@", pk);
    
    NSString *tmpurl = @"http://sodapoptoons.com/secretsapp/images/image_";
    
    NSString *str = [pk stringValue];
    
    NSString *tmpurl2 = [tmpurl stringByAppendingString:str];
    
    NSString *end = @".jpg";
    
    NSString *finalURL = [tmpurl2 stringByAppendingString:end];
    
    NSURL *url;
    
    
    
    NSLog(@"Final URL: %@", finalURL);
    
     NSLog(@"old pk: %@", oldpk);
   
    
    if (![pk isEqualToNumber:oldpk] ) {
        NSLog(@"Not Equal get new secret");
        url  = [NSURL URLWithString:finalURL];
        ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
        [request setDelegate:self];
        [request startAsynchronous];
        NSLog(@"Request Starting?");
    
    }
    

    oldpk = pk;
   
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
