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
    NSString *annotationTitle;
	NSString *annotationSubTitle;
    UIImage *image;
	NSString *annotationDesc;
	double lat;
	double lon;
    NSNumber *pk;
    NSString *category;
	
}

@property (nonatomic, retain) NSString *annotationTitle;
@property (nonatomic, retain) NSString *annotationSubTitle;
@property (nonatomic, copy) NSString *annotationDesc;
@property (nonatomic, copy) NSString *category;
@property (nonatomic, retain) NSNumber *pk;
@property double lat;
@property double lon;

@end
