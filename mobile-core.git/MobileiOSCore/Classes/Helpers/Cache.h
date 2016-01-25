//
//  Cache.h
//  iOSCore
//
//  Created by MacMini on 7/10/15.
//  Copyright (c) 2015 Duong Tran. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cache : NSObject

/*** ----------------------------------------- ***/

#pragma mark - Define

#define kUserDefault [NSUserDefaults standardUserDefaults]

/*** ----------------------------------------- ***/

#pragma mark - Methods

+ (void)setBoolValue:(BOOL)value forKey:(NSString *)key;
+ (BOOL)boolValueForKey:(NSString *)key;

+ (void)setIntegerValue:(NSInteger)value forKey:(NSString *)key;
+ (NSInteger)integerValueForKey:(NSString *)key;

+ (void)setObject:(id)object forKey:(NSString *)key;
+ (id)objectValueForKey:(NSString *)key;

@end
