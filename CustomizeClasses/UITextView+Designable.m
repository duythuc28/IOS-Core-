//
//  UITextView+Designable.m
//  DVHPlay
//
//  Created by MacMini on 11/13/15.
//  Copyright (c) 2015 Toan Quach. All rights reserved.
//

#import "UITextView+Designable.h"
#import "UITextView+Placeholder.h"

@implementation UITextView (Designable)

- (void) setLocalizeKey:(NSString *)localizeKey {
    self.text = MULTILANGUAGE(localizeKey);
}

- (NSString *)localizeKey {
    return self.text;
}

- (void) setPlaceholderLocalizeKey:(NSString *)placeholderLocalizeKey {
    self.placeholder = MULTILANGUAGE(placeholderLocalizeKey);
}

- (NSString *)placeholderLocalizeKey {
    return self.placeholder;
}

#pragma mark - Data helper

- (void)setDataForPlaceHolder:(NSString *)dataForPlaceHolder
{
    self.dataForPlaceHolder = dataForPlaceHolder;
}

- (NSString *)dataForPlaceHolder
{
    return self.dataForPlaceHolder;
}

@end
