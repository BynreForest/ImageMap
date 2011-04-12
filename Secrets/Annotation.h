//
//  Annotation.h
//  Secrets
//
//  Created by Gaynor, Brendan on 4/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>


@interface Annotation : NSObject <MKAnnotation> {
    UIImage *image;
	NSString *annotationDesc;
	double lat;
	double lon;
    NSString *category;
	
}

@property (nonatomic, copy) NSString *annotationDesc;
@property (nonatomic, copy) NSString *category;
@property double lat;
@property double lon;

@end
