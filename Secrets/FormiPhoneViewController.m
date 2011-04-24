//
//  FormiPhoneViewController.m
//  Secrets
//
//  Created by Gaynor, Brendan on 4/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FormiPhoneViewController.h"
#import "ActionSheetPicker.h"



@implementation FormiPhoneViewController
@synthesize categories = _categories;
@synthesize selectedIndex = _selectedIndex;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


-(IBAction)cancel:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}

-(IBAction)categoryBtn:(id)sender
{
    //Display the ActionSheetPicker
	[ActionSheetPicker displayActionPickerWithView:self.view data:self.categories selectedIndex:self.selectedIndex target:self action:@selector(itemWasSelected:)];
}

- (void)itemWasSelected:(NSNumber *)selectedIndex {
	//Selection was made
	self.selectedIndex = [selectedIndex intValue];
	//self.textField.text = [self.animals objectAtIndex:self.selectedIndex];
}

-(IBAction)photoBtn:(id)sender {
	// open a dialog with two custom buttons
	UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Add Photo To Your Secret"
															 delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil
													otherButtonTitles:@"Take Photo",@"Choose Existing",  nil];
	actionSheet.actionSheetStyle = UIActionSheetStyleDefault;
	actionSheet.cancelButtonIndex = 2;
	actionSheet.destructiveButtonIndex = 0;	// make the second button red (destructive)
	[actionSheet showInView:self.view]; // show from our table view (pops up in the middle of the table)
	[actionSheet release];
	
    
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
	NSLog(@"Button Index, %i", buttonIndex);
	if (buttonIndex == 0) {
		[self showImagePicker:UIImagePickerControllerSourceTypeCamera];
	} else if (buttonIndex == 1) {
		[self showImagePicker:UIImagePickerControllerSourceTypeCamera];
	} else {
		NSLog(@"Cancel");
	}
    
}





#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"My Secret";
    
    self.categories = [NSArray arrayWithObjects:@"Happy", @"Sad", @"Death", @"Money", @"Sex", @"Family", @"Hate", @"Love",nil];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
