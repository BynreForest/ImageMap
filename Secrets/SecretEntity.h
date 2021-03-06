//
//  SecretEntity.h
//  Secrets
//
//  Created by Gaynor, Brendan on 4/3/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface SecretEntity : NSManagedObject {
@private
}
@property (nonatomic, retain) NSNumber * pk;
@property (nonatomic, retain) NSNumber * lat;
@property (nonatomic, retain) NSNumber * lon;
@property (nonatomic, retain) NSString * category;
@property (nonatomic, retain) NSString * descriptions;
@property (nonatomic, retain) NSNumber * photo_bool;

@end
