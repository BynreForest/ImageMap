//
//  SecretsAppDelegate.h
//  Secrets
//
//  Created by Gaynor, Brendan on 4/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>


@interface SecretsAppDelegate : NSObject <UIApplicationDelegate> {
   
    UINavigationController *iPhoneNavController;

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic, retain) IBOutlet UINavigationController *iPhoneNavController;


- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;
-(IBAction)showSMSPicker:(id)sender;

@end
