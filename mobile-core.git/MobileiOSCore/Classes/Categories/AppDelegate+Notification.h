//
//  AppDelegate+Notification.h
//  iOSCore
//
//  Created by MacMini on 7/13/15.
//  Copyright (c) 2015 Duong Tran. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (Notification)

#pragma mark - Define

#define kDictionary_Device_Token    @"device_token"

/*** ----------------------------------------- ***/

#pragma mark -  Notifications

- (void)didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)sTokenData;

@end
