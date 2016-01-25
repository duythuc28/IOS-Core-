//
//  NSObject+Category.m
//  DVHPlay
//
//  Created by MacMini on 11/17/15.
//  Copyright (c) 2015 Toan Quach. All rights reserved.
//

#import "NSObject+Category.h"

@implementation NSObject (Category)

- (id)objectOrNull
{
    return self?: [NSNull null];
}

@end
