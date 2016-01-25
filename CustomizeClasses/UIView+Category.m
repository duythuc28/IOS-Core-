//
//  UIView+Category.m
//  DVHPlay
//
//  Created by MacMini on 11/17/15.
//  Copyright (c) 2015 Toan Quach. All rights reserved.
//

#import "UIView+Category.h"

@implementation UIView (Category)

- (NSValue *)getNSValue
{
    return [NSValue valueWithNonretainedObject:self];
}

@end
