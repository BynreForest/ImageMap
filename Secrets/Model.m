//
//  Model.m
//  Secrets
//
//  Created by Gaynor, Brendan on 4/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Model.h"
#import "JSON.h"
#import "SecretEntity.h"
#import "SecretsAppDelegate.h"


@implementation Model
@synthesize managedObjectContext;
@synthesize pinArray;


- (id) init 
{
    self = [super init];
    if(self) {
    
    }
    SecretsAppDelegate *sad = [[UIApplication sharedApplication] delegate];
    
    managedObjectContext = sad.managedObjectContext;
    
    
    return self;
}

/**
 After the NSNotification has been sent notifying of database udpate completion, this function can 
 be called to retreive the pins for the current map
 **/
-(NSArray *) getPinData
{
    
    
    NSEntityDescription *secretsEntity = [NSEntityDescription entityForName:@"SecretEntity" inManagedObjectContext:managedObjectContext];
    
    NSFetchRequest *request = [[[NSFetchRequest alloc] init] autorelease];
    
    [request setEntity:secretsEntity];
    
    NSError *error;
    
    pinArray = [managedObjectContext executeFetchRequest:request error:&error];
    
    [request release];
    
    return pinArray;
}

/**
 This function will be called each time the user iterates to another map representing another day
 **/

-(void) updateDatabase
{
	
	// Build the url string 
	NSString *urlString = [NSString stringWithFormat:@"http://sodapoptoons.com/secretsapp/secretdata.php"];
	
	// Create NSURL string from formatted string
	NSURL *url = [NSURL URLWithString:urlString];
	
	// Setup and start async download
	NSURLRequest *request = [[NSURLRequest alloc] initWithURL: url];
	NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
	[connection release];
	[request release];
    
}


-(void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    /**Delete all Records**/
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *secretsEntity = [NSEntityDescription entityForName:@"SecretEntity" inManagedObjectContext:managedObjectContext];
    [request setEntity:secretsEntity];
    
    NSLog(@"Request: %@", request);
    
    NSError *error;
    
    NSArray *items = [managedObjectContext executeFetchRequest:request error:&error];
    [request release];
    
    for (NSManagedObject *managedObject in items)
    {
        [managedObjectContext deleteObject:managedObject];
    }
    
    if(![managedObjectContext save:&error])
    {
        NSLog(@"Deletion Error");
    }
    /**END Delete all Records**/
    
    /**Store incoming data into a String**/
    
    if(jsonString == nil)
    {
        jsonString = [[NSMutableString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        
        NSLog(@"jsonString: %@", jsonString);
        
    } else {
        
        NSString *content = [[NSString alloc] initWithBytes:[data bytes] length:[data length] encoding:NSUTF8StringEncoding];
        
        [jsonString appendString:content];
        
        [content release];
    }
    
    //NSDictionary* myJsonParsed;
   // [NSNumber numberWithInt:[[myJsonParsed valueForKey:@"stringOrInt"] intValue]];
    
    /**Create a dictionary from the JSON String**/
    NSDictionary *results = [jsonString JSONValue];
    
    for (id key in results) {
        NSManagedObject *managedObject = [NSEntityDescription insertNewObjectForEntityForName:@"SecretEntity" inManagedObjectContext:managedObjectContext];
        
        
        
        [managedObject setValuesForKeysWithDictionary:key];
        
        NSError *error;
        
        if(![managedObjectContext save:&error])
        {
            /**Handle error**/
            NSLog(@"Error: %@", error);
        }

    }
    
}

-(void) connectionDidFinishLoading:(NSURLConnection *)connection
{

    [jsonString release];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"Processed" object:nil];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    UIAlertView *av = [[UIAlertView alloc] init];
    [av setDelegate:self];
    [av setTitle:@"Secret Images"];
    [av setMessage:@"Error in downloading data"];
    [av addButtonWithTitle:@"OK"];
    [av dismissWithClickedButtonIndex:1 animated:YES];
    [av show];
    [av release];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"Processed" object:nil];

}

-(void) dealloc
{
    
    [managedObjectContext release];
    [super dealloc];
}

@end
