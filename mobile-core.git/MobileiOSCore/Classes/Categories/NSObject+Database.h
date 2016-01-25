//
//  NSObject+AGS.h
//  OTTApp
//
//  Created by Tran Tu Duong on 3/18/15.
//  Copyright (c) 2015 Nhan Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMResultSet.h"
#import "FMResultSet+FMDBHelpers.h"

@interface NSObject (AGS)

+ (NSObject *)fillData:(FMResultSet *)resultSet;
- (NSDictionary *)getListProperty;
- (NSMutableDictionary *)getDictionary;
- (void)setDictionary:(NSDictionary*)dictionary;

@end
