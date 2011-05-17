//
//  Demo_AppAppDelegate.h
//  Demo App
//
//  Created by Rob Wills on 5/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Demo_AppViewController;

@interface Demo_AppAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet Demo_AppViewController *viewController;

@end
