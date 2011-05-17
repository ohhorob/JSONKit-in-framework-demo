//
//  Demo_AppViewController.h
//  Demo App
//
//  Created by Rob Wills on 5/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <WrapperLib/MyWrapper.h>

@interface Demo_AppViewController : UIViewController {
    MyWrapper *wrapper_;
}
- (IBAction)readName:(id)sender;

@end
