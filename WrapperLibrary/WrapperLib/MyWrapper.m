//
//  MyWrapper.m
//  WrapperLibrary
//
//  Created by Rob Wills on 5/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MyWrapper.h"

#import "JSONKit.h"

@implementation MyWrapper

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (NSString *)readName:(NSData *)jsonData;
{
    // Use JSONKit to decode data
    NSError *decoderError;
    JSONDecoder *decoder = [[JSONDecoder alloc] init];
    NSDictionary *dictionary = [decoder objectWithData:jsonData error:&decoderError];
    [decoder release];
    if (!dictionary) {
        NSLog(@"%@ failed to decode json data", NSStringFromSelector(_cmd));
        return nil;
    }
    
    // Return the "name" key value
    NSString *name = [dictionary objectForKey:@"name"];
    if (!name || ![name isKindOfClass:[NSString class]]) {
        NSLog(@"%@ failed to read string for key \"name\" in dictionary %@",
              NSStringFromSelector(_cmd),
              dictionary);
        return nil;
    }
    
    return name;
}

@end
