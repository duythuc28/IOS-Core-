//
//  Define.h
//  MobileiOSCore
//
//  Created by MacMini on 7/14/15.
//  Copyright (c) 2015 Duong Tran. All rights reserved.
//

#ifndef MobileiOSCore_Define_h
#define MobileiOSCore_Define_h

#define UIAppDelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)

/*** ----------------------------------------- ***/

#pragma mark - Language

#define MULTILANGUAGE(key)      NSLocalizedStringFromTable(key, @"Title", nil)
#define ERROR_MESSAGE(key)      NSLocalizedStringFromTable(key, @"ErrorCode", nil)
#define DEFAULT_LOCALIZED_STRING(key)    NSLocalizedString(key, nil)

/*** ----------------------------------------- ***/

#pragma mark - Frame

#define WIDTH           [UIScreen mainScreen].bounds.size.width
#define HEIGHT          [UIScreen mainScreen].bounds.size.height

/// status bar
#define HEIGHT_STATUS_BAR       [UIApplication sharedApplication].statusBarFrame.size.height

/// navigation bar
#define HEIGHT_NAVIGATION_BAR   [UINavigationBar appearance].frame.size.height

#define MAIN_HEIGHT             [UIScreen mainScreen].bounds.size.height

/*** ----------------------------------------- ***/

#pragma mark - Scale

#define NATIVE_SCALE            (IOS_VERSION >= 8.0 ? [[UIScreen mainScreen] nativeScale] : 1.0)
#define SCALE                   (IOS_VERSION >= 8.0 ? [UIScreen mainScreen].scale : 1.0)

/// SCALE VALUE FOR FONT SIZE
#define SCALE_VALUE     (IS_IPAD ? 1.5f : 1.0f)

/*** ----------------------------------------- ***/

#pragma mark - Device checking

#define IOS_VERSION     [[[[UIDevice currentDevice].systemVersion componentsSeparatedByString:@"."] objectAtIndex:0] intValue]

#define IDIOM                   UI_USER_INTERFACE_IDIOM()
#define IPAD                    UIUserInterfaceIdiomPad

#define IS_IPAD                 IDIOM == IPAD
#define IS_IPHONE               (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

//http://stackoverflow.com/questions/25952243/how-can-i-detect-whether-a-user-has-an-iphone-6-plus-in-standard-or-zoomed-mode
#define IS_IPHONE_4                 (IS_IPHONE && MAIN_HEIGHT == 480.0)
#define IS_IPHONE_5                 (IS_IPHONE && MAIN_HEIGHT == 568.0 && NATIVE_SCALE == SCALE)

#define IS_STANDARD_IPHONE_6        (IS_IPHONE && MAIN_HEIGHT == 667.0 && NATIVE_SCALE == SCALE)
#define IS_ZOOMED_IPHONE_6          (IS_IPHONE && MAIN_HEIGHT == 568.0 && NATIVE_SCALE > SCALE)
#define IS_IPHONE_6                 (IS_STANDARD_IPHONE_6 || IS_ZOOMED_IPHONE_6)

#define IS_STANDARD_IPHONE_6_PLUS   (IS_IPHONE && MAIN_HEIGHT == 736.0)
#define IS_ZOOMED_IPHONE_6_PLUS     (IS_IPHONE && MAIN_HEIGHT == 667.0 && NATIVE_SCALE < SCALE)
#define IS_IPHONE_6PLUS             (IS_STANDARD_IPHONE_6_PLUS || IS_ZOOMED_IPHONE_6_PLUS)

#define IPHONE5_ADJUST(y) (IS_IPHONE_5 ? (y + 88) : y)

#define SYSTEM_VERSION_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)

#define SYSTEM_VERSION_GREATER_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)

#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

#define SYSTEM_VERSION_LESS_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)

#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

#define IS_iOS8_OR_GREATER (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_7_1)

/*** ----------------------------------------- ***/

#pragma mark - Custom NSLog
#ifdef DEBUG
#   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define DLog(...)
#endif

/*** ----------------------------------------- ***/

#pragma mark - RGB & RBGA

#define RGB(r, g, b)            [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]

#define RGBA(r, g, b, a)        [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

/*** ----------------------------------------- ***/

#pragma mark - Directory

#define IMAGESPATH [NSHomeDirectory() stringByAppendingString:@"/Documents/"]

#define HOMEDIRECTORY [[NSBundle mainBundle] resourcePath]

#define DOCUMENTDIRECTORY [NSHomeDirectory() stringByAppendingString:@"/Documents/"]

#define LIBRARY_CATCHES_DIRECTORY [NSHomeDirectory() stringByAppendingString:@"/Library/Caches/"]

#define TEMPDIRECTORY [NSHomeDirectory() stringByAppendingString:@"/tmp/"]

/*** ----------------------------------------- ***/

/*** ----------------------------------------- ***/

/*** ----------------------------------------- ***/

/*** ----------------------------------------- ***/

/*** ----------------------------------------- ***/

/*** ----------------------------------------- ***/

/*** ----------------------------------------- ***/

/*** ----------------------------------------- ***/

/*** ----------------------------------------- ***/

#endif
