//
//  UITextField+Designable.h
//  DVHPlay
//
//  Created by MacMini on 11/13/15.
//  Copyright (c) 2015 Toan Quach. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (Designable)

@property (nonatomic, assign) IBInspectable NSString *localizeKey;
@property (nonatomic, assign) IBInspectable NSString *placeholderLocalizeKey;

@property(nonatomic) NSString *dataForPlaceHolder;

@end
