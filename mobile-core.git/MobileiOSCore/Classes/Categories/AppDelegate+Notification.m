//
//  AppDelegate+Notification.m
//  iOSCore
//
//  Created by MacMini on 7/13/15.
//  Copyright (c) 2015 Duong Tran. All rights reserved.
//

#import "AppDelegate+Notification.h"

@implementation AppDelegate (Notification)

- (void)didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)sTokenData
{
    NSString *deviceToken = [[sTokenData description] stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"<>"]];
    deviceToken = [deviceToken stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    //remove the old
    if ([kUserDefault objectForKey:kDictionary_Device_Token])
    {
        [kUserDefault removeObjectForKey:kDictionary_Device_Token];
    }
    
    //set token
    [kUserDefault setObject:deviceToken forKey:kDictionary_Device_Token];
}

@end
