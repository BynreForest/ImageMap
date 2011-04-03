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
@property (nonatomic, retain) NSString * pk;
@property (nonatomic, retain) NSNumber * lat;
@property (nonatomic, retain) NSNumber * lon;
@property (nonatomic, retain) NSString * category;
@property (nonatomic, retain) NSString * desc;
@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSNumber * photo_bool;

@end
