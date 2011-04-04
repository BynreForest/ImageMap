//
//  SecretsAppDelegate.h
//  Secrets
//
//  Created by Gaynor, Brendan on 4/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Location.h"

@class MapiPadViewController;
@class MapiPhoneViewController;
@interface SecretsAppDelegate : NSObject <UIApplicationDelegate> {
    /**
     BBG March 30, 2011
     **/
    MapiPadViewController *mapiPadVC;
    MapiPhoneViewController *mapiPhoneVC;
    Location *location;

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic, retain) Location *location;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
