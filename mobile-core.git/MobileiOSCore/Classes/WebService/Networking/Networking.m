//
//  Networking.m
//  WebServiceCore
//
//  Created by MacMini on 7/10/15.
//  Copyright (c) 2015 Duong Tran. All rights reserved.
//

#import "Networking.h"

@implementation Networking

/**
 *  Check internet connection: wifi or 3G
 *  @return Yes/NO
 */

+ (BOOL)isHavingNetworkConnection
{
    Reachability *networkReachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [networkReachability currentReachabilityStatus];
    if (networkStatus == NotReachable) {
        NSLog(@"There IS NO internet connection");
        return NO;
    }
    
    return YES;
}

@end
