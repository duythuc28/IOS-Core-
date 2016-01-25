//
//  UIFont+Custom.m
//  iOSCore
//
//  Created by MacMini on 7/13/15.
//  Copyright (c) 2015 Duong Tran. All rights reserved.
//

#import "UIFont+Custom.h"

@implementation UIFont (Custom)

+ (UIFont *)defaultFontNormal
{
    return [UIFont fontWithName:FONT_NAME_NORMAL size:FONT_SIZE_NORMAL];
}

+ (UIFont *)defaultFontBold
{
    return [UIFont fontWithName:FONT_NAME_BOLD size:FONT_SIZE_NORMAL];
}

+ (UIFont *)defaultFontItalic
{
    return [UIFont fontWithName:FONT_NAME_ITALIC size:FONT_SIZE_NORMAL];
}

+ (UIFont *)headerFontNormal
{
    return [UIFont fontWithName:FONT_NAME_HEADER_NORMAL size:FONT_SIZE_HEADER];
}

+ (UIFont *)headerFontBold
{
    return [UIFont fontWithName:FONT_NAME_HEADER_BOLD size:FONT_SIZE_HEADER];
}

+ (UIFont *)headerFontItalic
{
    return [UIFont fontWithName:FONT_NAME_HEADER_ITALIC size:FONT_SIZE_HEADER];
}

+ (UIFont *)detailFontNormal
{
    return [UIFont fontWithName:FONT_NAME_DETAIL_NORMAL size:FONT_SIZE_DETAIL];
}

+ (UIFont *)detailFontBold
{
    return [UIFont fontWithName:FONT_NAME_DETAIL_BOLD size:FONT_SIZE_DETAIL];
}

+ (UIFont *)detailFontItalic
{
    return [UIFont fontWithName:FONT_NAME_DETAIL_ITALIC size:FONT_SIZE_DETAIL];
}

@end
