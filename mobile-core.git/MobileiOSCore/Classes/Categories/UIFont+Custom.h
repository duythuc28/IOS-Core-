//
//  UIFont+Custom.h
//  iOSCore
//
//  Created by MacMini on 7/13/15.
//  Copyright (c) 2015 Duong Tran. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (Custom)

#pragma mark - Define

#define FONT_SCALE 1.0f

#define FONT_SIZE_DETAIL 11.0f * FONT_SCALE
#define FONT_SIZE_NORMAL 13.0f * FONT_SCALE
#define FONT_SIZE_HEADER 15.0f * FONT_SCALE

#define FONT_NAME_NORMAL @""
#define FONT_NAME_BOLD   @""
#define FONT_NAME_ITALIC @""

#define FONT_NAME_HEADER_NORMAL @""
#define FONT_NAME_HEADER_BOLD   @""
#define FONT_NAME_HEADER_ITALIC @""

#define FONT_NAME_DETAIL_NORMAL @""
#define FONT_NAME_DETAIL_BOLD   @""
#define FONT_NAME_DETAIL_ITALIC @""

/*** ----------------------------------------- ***/

#pragma mark - Fonts

+ (UIFont *)defaultFontNormal;
+ (UIFont *)defaultFontBold;
+ (UIFont *)defaultFontItalic;

+ (UIFont *)headerFontNormal;
+ (UIFont *)headerFontBold;
+ (UIFont *)headerFontItalic;

+ (UIFont *)detailFontNormal;
+ (UIFont *)detailFontBold;
+ (UIFont *)detailFontItalic;

/*** ----------------------------------------- ***/

@end
