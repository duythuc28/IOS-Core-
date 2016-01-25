//
//  JsonSerializable.m
//  WebServiceCore
//
//  Created by MacMini on 7/10/15.
//  Copyright (c) 2015 Duong Tran. All rights reserved.
//

#import "JsonSerializable.h"

@implementation JsonSerializable

+ (JSONKeyMapper *)keyMapper
{
    NSDictionary *map = [self customMapping];
    if (map) {
        return [[JSONKeyMapper alloc] initWithDictionary:map];
    }
    
    return [super keyMapper];
}

+ (NSMutableDictionary *)customMapping
{
    // abstract method
    
    return nil;
}

+ (BOOL)propertyIsOptional:(NSString *)propertyName
{
    return YES;
}

@end
