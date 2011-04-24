//
//  FormiPhoneViewController.h
//  Secrets
//
//  Created by Gaynor, Brendan on 4/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FormiPhoneViewController : UIViewController  {
    NSArray *_categories;
	NSInteger _selectedIndex;
}

@property (nonatomic, retain) NSArray *categories;
@property (nonatomic, assign) NSInteger selectedIndex;

-(IBAction)cancel:(id)sender;
-(IBAction)categoryBtn:(id)sender;
-(IBAction)photoBtn:(id)sender;
- (void)itemWasSelected:(NSNumber *)selectedIndex;

@end
