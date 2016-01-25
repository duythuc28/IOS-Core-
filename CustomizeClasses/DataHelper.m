//
//  DataHelper.m
//  DVHPlay
//
//  Created by MacMini on 11/17/15.
//  Copyright (c) 2015 Toan Quach. All rights reserved.
//

#import "DataHelper.h"

@implementation DataHelper

+ (void)setDataForControls:(NSArray *)controls values:(NSArray *)values
{
    [controls enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [self checkClassAndSetDataForControl:obj data:values[idx]];
    }];
}

+ (void)checkClassAndSetDataForControl:(id)control data:(NSString *)data
{
    if([control isKindOfClass:[UILabel class]]) {
        ((UILabel *)control).text = data;
    }
    else if([control isKindOfClass:[UIButton class]]) {
        [((UIButton *)control) setTitle:data forState:UIControlStateNormal];
    }
    else if([control isKindOfClass:[UITextField class]]) {
        UITextField *textField = (UITextField *)control;
        textField.text = data;
        if (textField.dataForPlaceHolder) {
            textField.placeholder = textField.dataForPlaceHolder;
        }
    }
    else if([control isKindOfClass:[UITextView class]]) {
        UITextView *textView = (UITextView *)control;
        textView.text = data;
        if (textView.dataForPlaceHolder) {
            textView.placeholder = textView.dataForPlaceHolder;
        }
    }
    else if([control isKindOfClass:[UIImageView class]]) {
        UIImageView *imageView = (UIImageView *)control;
        switch (imageView.loadingType) {
            case UIImageViewLoadingTypeImage:
                
                imageView.image = [UIImage imageNamed:data];
                break;
                
            case UIImageViewLoadingTypeLink:
                
                [self loadImageViewFromLink:imageView link:data];
                break;
                
            default:
                break;
        }
    }
}

+ (void)loadImageViewFromLink:(UIImageView *)imageView link:(NSString *)link
{
    NSURL *url = [NSURL URLWithString:link];
    if (url) {
        
        if (imageView.placeholderImageName) {
            UIImage *placeholderImage = [UIImage imageNamed:imageView.placeholderImageName];
            [imageView sd_setImageWithURL:url placeholderImage:placeholderImage];
        }
        else {
            [imageView sd_setImageWithURL:url];
        }
    }
}

@end
