//
//  SXAPIManager.h
//  sxsw_data2go
//
//  Created by Matt Smollinger on 3/9/14.
//  Copyright (c) 2014 Matt Smollinger. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface SXAPIManager : AFHTTPRequestOperationManager

+ (SXAPIManager *)sharedInstance;

@end
