//
//  Demo_AppViewController.m
//  Demo App
//
//  Created by Rob Wills on 5/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Demo_AppViewController.h"

@interface Demo_AppViewController ()
- (void)alertWithMessage:(NSString *)message;
@end

@implementation Demo_AppViewController

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

#pragma mark - View lifecycle

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    if (!wrapper_) {
        wrapper_ = [[MyWrapper alloc] init];
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    [wrapper_ release];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)readName:(id)sender;
{
    NSString *dataPath = [[NSBundle mainBundle] pathForResource:@"data"
                                                         ofType:@"json"];
    if (!dataPath) {
        [self alertWithMessage:@"File \"data.json\" not found."];
        return;
    }
    NSData *fileData = [NSData dataWithContentsOfFile:dataPath];
    if (!fileData) {
        [self alertWithMessage:@"Failed to read file \"data.json\"."];
        return;
    }
    
    NSString *name = [wrapper_ readName:fileData];
    if (!name) {
        [self alertWithMessage:@"Failed to read name."];
    }
    else {
        [self alertWithMessage:[NSString stringWithFormat:@"Name: \"%@\"", name]];
    }
}

- (void)alertWithMessage:(NSString *)message;
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Demo App"
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
    [alertView show];
    [alertView release];
}

@end
