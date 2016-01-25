//
//  UIView+Custom.m
//  iOSCore
//
//  Created by MacMini on 7/10/15.
//  Copyright (c) 2015 Duong Tran. All rights reserved.
//

#import "UIView+Custom.h"
#import <objc/runtime.h>

static NSString *kStringTagKey = @"UIView+StringTag";
static NSString *kStringTagIndexKey = @"UIView+StringIndexTag";

@implementation UIView (Custom)

- (void)circleWithBorderLineWidth:(CGFloat)weight color:(UIColor *)color
{
    [self borderWidth:weight color:color radius:self.frame.size.width / 2];
}

- (void)borderWidth:(CGFloat)weight color:(UIColor *)color radius:(CGFloat)radius
{
    self.layer.cornerRadius = radius;
    
    if (color) {
        self.layer.borderColor = color.CGColor;
    }
    
    if (weight > 0) {
        self.layer.borderWidth = weight;
    }
    
    self.layer.masksToBounds = YES;
}

- (void)addLeftBorder
{
    CALayer *leftBorder = [CALayer layer];
    leftBorder.frame = CGRectMake(self.frame.size.width - 0.5f, 0.0f, 0.5f, self.frame.size.height);
    leftBorder.backgroundColor = [UIColor lightGrayColor].CGColor;
    [self.layer addSublayer:leftBorder];
}

- (void)addBottomBorder
{
    CALayer *border = [CALayer layer];
    border.frame = CGRectMake(0.0f, self.frame.size.height - 0.5f, self.frame.size.width, 0.5f);
    border.backgroundColor = [UIColor lightGrayColor].CGColor;
    [self.layer addSublayer:border];
}

#pragma mark - string tag

- (NSString *)stringTag
{
    return objc_getAssociatedObject(self, (__bridge const void *)(kStringTagKey));
}

- (void)setStringTag:(NSString *)stringTag
{
    objc_setAssociatedObject(self, (__bridge const void *)(kStringTagKey), stringTag, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

#pragma mark - string tag

- (NSString *)stringIndexTag
{
    return objc_getAssociatedObject(self, (__bridge const void *)(kStringTagIndexKey));
}

- (void)setstringIndexTag:(NSString *)stringIndexTag
{
    objc_setAssociatedObject(self, (__bridge const void *)(kStringTagIndexKey), stringIndexTag, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

#pragma mark - Frame

- (CGFloat)originYAtBottomPoint
{
    return self.frame.origin.y + self.frame.size.height;
}

- (CGFloat)originXAtRightView
{
    return self.frame.origin.x + self.frame.size.width;
}

-(void)changeFontTo:(NSString *)fontName
{
    if ([self isKindOfClass:[UIButton class]])
    {
        UIButton *btn = (UIButton *)self;
        CGFloat fontSize = btn.titleLabel.font.pointSize;
        btn.titleLabel.font = [UIFont fontWithName:fontName size:fontSize];
    }
    else if ([self isKindOfClass:[UILabel class]])
    {
        UILabel *lbl = (UILabel *)self;
        CGFloat fontSize = lbl.font.pointSize;
        [lbl setFont:[UIFont fontWithName:fontName size:fontSize]];
    }
    else if ([self isKindOfClass:[UITextView class]])
    {
        UITextView *txt = (UITextView *)self;
        CGFloat fontSize = txt.font.pointSize;
        [txt setFont:[UIFont fontWithName:fontName size:fontSize]];
    }
    else if ([self isKindOfClass:[UITextField class]])
    {
        UITextField *txt = (UITextField *)self;
        CGFloat fontSize = txt.font.pointSize;
        [txt setFont:[UIFont fontWithName:fontName size:fontSize]];
    }
    else if ([self isKindOfClass:[UIView class]]
             || [self isKindOfClass:[UIScrollView class]])
    {
        if (self.subviews.count == 0) return;
        for (UIView *subView in self.subviews) {
            [subView changeFontTo:fontName];
        }
    }
}

@end
