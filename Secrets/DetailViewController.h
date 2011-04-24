//
//  DetailViewController.h
//  Secrets
//
//  Created by Gaynor, Brendan on 4/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DetailViewController : UIViewController {
    NSNumber *pk;
    NSNumber *oldpk;
    UIImageView *imgView;
    UITextView *textView;
}
@property (nonatomic, copy) NSNumber *pk;
@property (nonatomic, copy) NSNumber *oldpk;
@property (nonatomic, retain) IBOutlet UIImageView *imgView;
@property (nonatomic, retain) IBOutlet UITextView *textView;

@end
