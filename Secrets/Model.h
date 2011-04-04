//
//  Model.h
//  Secrets
//
//  Created by Gaynor, Brendan on 4/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Model : NSObject {
    
    NSMutableString *jsonString;
    NSManagedObjectContext *managedObjectContext;
    NSArray *annotationArray;
    
}

@property(nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property(nonatomic, retain) NSArray *annotationArray;

-(void) updateData;
-(id) init;
-(void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data;
-(void) connectionDidFinishLoading:(NSURLConnection *)connection;
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error;
-(void) dealloc;

@end
