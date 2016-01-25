//
//  UIImageView+Category.m
//  DVHPlay
//
//  Created by MacMini on 11/17/15.
//  Copyright (c) 2015 Toan Quach. All rights reserved.
//

#import "UIImageView+Category.h"
#import <objc/runtime.h>

static char const * const UIImageViewLoadingTypeKey = "UIImageViewLoadingType";
static char const * const PlaceholderImageNameKey = "PlaceholderImageName";

@implementation UIImageView (Category)

#pragma mark - Data helper

- (void)setLoadingType:(UIImageViewLoadingType)loadingType
{
    objc_setAssociatedObject(self, UIImageViewLoadingTypeKey, [NSNumber numberWithInteger:loadingType], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIImageViewLoadingType)loadingType
{
    return (UIImageViewLoadingType)[objc_getAssociatedObject(self, UIImageViewLoadingTypeKey) integerValue];
}

- (void)setPlaceholderImageName:(NSString *)placeholderImageName
{
    objc_setAssociatedObject(self, PlaceholderImageNameKey, placeholderImageName, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)placeholderImageName
{
    return objc_getAssociatedObject(self, PlaceholderImageNameKey);
}

@end
