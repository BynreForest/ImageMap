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
@synthesize annotationArray;


- (id) init 
{
    self = [super init];
    if(self) {
    
    }
    return self;
}

-(void) updateData
{
    SecretsAppDelegate *sra = [[UIApplication sharedApplication] delegate];
    
    managedObjectContext = sra.managedObjectContext;
    
    NSEntityDescription *secretsEntity = [NSEntityDescription entityForName:@"SecretEntity" inManagedObjectContext:managedObjectContext];
    
    NSFetchRequest *request = [[[NSFetchRequest alloc] init] autorelease];
    
    [request setEntity:secretsEntity];
    
    NSError *error;
    
    annotationArray = [managedObjectContext executeFetchRequest:request error:&error];
    
    [request release];
}

-(void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    /**Delete all Records**/
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *secretsEntity = [NSEntityDescription entityForName:@"SecretEntity" inManagedObjectContext:managedObjectContext];
    [request setEntity:secretsEntity];
    
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
        
    } else {
        
        NSString *content = [[NSString alloc] initWithBytes:[data bytes] length:[data length] encoding:NSUTF8StringEncoding];
        
        [jsonString appendString:content];
        
        [content release];
    }
    
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
