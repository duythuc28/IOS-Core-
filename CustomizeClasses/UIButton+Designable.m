//
//  UIButton+Designable.m
//  DVHPlay
//
//  Created by MacMini on 11/13/15.
//  Copyright (c) 2015 Toan Quach. All rights reserved.
//

#import "UIButton+Designable.h"

@implementation UIButton (Designable)

- (void) setLocalizeKey:(NSString *)localizeKey {
    [self setTitle:MULTILANGUAGE(localizeKey) forState:UIControlStateNormal];
}

- (NSString *)localizeKey {
    return self.titleLabel.text;
}

@end
