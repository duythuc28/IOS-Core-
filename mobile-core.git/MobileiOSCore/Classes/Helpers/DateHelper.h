//
//  DateHelper.h
//  iOSCore
//
//  Created by MacMini on 7/10/15.
//  Copyright (c) 2015 Duong Tran. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateHelper : NSObject

- (NSString *)formatCurrentDate;
- (NSString *)formatFullCurrentDate;
- (NSString *)formatFullCurrentDateForTracking;
- (NSString *) stringFromDate:(NSDate*)date withFormat:(NSString*)format;

- (NSDate *) dateFromString:(NSString*)dateString withFormat:(NSString*)format;

@end
