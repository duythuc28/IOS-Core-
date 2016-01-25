//
//  DataHelper.h
//  DVHPlay
//
//  Created by MacMini on 11/17/15.
//  Copyright (c) 2015 Toan Quach. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataHelper : NSObject

+ (void)setDataForControls:(NSArray *)controls values:(NSArray *)values;
+ (void)loadImageViewFromLink:(UIImageView *)imageView link:(NSString *)link;
+ (void)checkClassAndSetDataForControl:(id)control data:(NSString *)data;

@end
