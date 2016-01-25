//
//  UILabel+Designable.m
//  DVHPlay
//
//  Created by MacMini on 11/13/15.
//  Copyright (c) 2015 Toan Quach. All rights reserved.
//

#import "UILabel+Designable.h"

@implementation UILabel (Designable)

- (void) setLocalizeKey:(NSString *)localizeKey {
    self.text = MULTILANGUAGE(localizeKey);
}

- (NSString *)localizeKey {
    return self.text;
}

@end
