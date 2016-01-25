//
//  UIView+Custom.h
//  iOSCore
//
//  Created by MacMini on 7/10/15.
//  Copyright (c) 2015 Duong Tran. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Custom)

- (void)circleWithBorderLineWidth:(CGFloat)weight color:(UIColor *)color;
- (void)borderWidth:(CGFloat)weight color:(UIColor *)color radius:(CGFloat)radius;

- (void)changeFontTo:(NSString *)fontName;

- (void)addLeftBorder;
- (void)addBottomBorder;

- (NSString *)stringTag;
- (void)setStringTag:(NSString *)stringTag;

- (CGFloat)originYAtBottomPoint;
- (CGFloat)originXAtRightView;

@end
