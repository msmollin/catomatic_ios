//
//  SXAPIManager.m
//  sxsw_data2go
//
//  Created by Matt Smollinger on 3/9/14.
//  Copyright (c) 2014 Matt Smollinger. All rights reserved.
//

#import "SXAPIManager.h"

@implementation SXAPIManager


+ (SXAPIManager *)sharedInstance
{
    static SXAPIManager * volatile sharedInstance = nil;
    static dispatch_once_t sharedInstanceToken;
    dispatch_once(&sharedInstanceToken, ^{
        sharedInstance = [[SXAPIManager alloc] initWithBaseURL:[NSURL URLWithString:@"http://mostlygeeks.com:5000"]];
    });
    return sharedInstance;
}

@end
