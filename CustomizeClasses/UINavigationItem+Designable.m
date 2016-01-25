//
//  UINavigationItem+Designable.m
//  DVHPlay
//
//  Created by MacMini on 11/16/15.
//  Copyright (c) 2015 Toan Quach. All rights reserved.
//

#import "UINavigationItem+Designable.h"

@implementation UINavigationItem (Designable)

- (void) setLocalizeKey:(NSString *)localizeKey {
    self.title = MULTILANGUAGE(localizeKey);
}

- (NSString *)localizeKey {
    return self.title;
}

@end
