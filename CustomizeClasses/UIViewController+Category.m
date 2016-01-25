//
//  UIViewController+Category.m
//  DVHPlay
//
//  Created by MacMini on 11/16/15.
//  Copyright (c) 2015 Toan Quach. All rights reserved.
//

#import "UIViewController+Category.h"

@implementation UIViewController (Category)

- (void)setEdgesForExtendedLayout
{
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars = NO;
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
}

+ (UIViewController *)initBasicViewController
{
    Class class = [self class];
    UIViewController *viewController = [[self alloc] initWithNibName:NSStringFromClass(class) bundle:nil];
    
    return viewController;
}

@end
