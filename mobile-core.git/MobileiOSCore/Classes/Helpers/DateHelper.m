//
//  DateHelper.m
//  iOSCore
//
//  Created by MacMini on 7/10/15.
//  Copyright (c) 2015 Duong Tran. All rights reserved.
//

#import "DateHelper.h"

@implementation DateHelper

/**
 *  Get string from [NDate date]
 *
 *  @return YYYY-MM-DD
 */
- (NSString *)formatCurrentDate
{
    NSString *dateStr = @"";
    NSDate *date = [NSDate date];
    NSDateFormatter *dateFomatter = [[NSDateFormatter alloc] init];
    [dateFomatter setDateFormat:@"yyyy-MM-dd"];
    dateStr = [dateFomatter stringFromDate:date];
    return dateStr;
}

/**
 *  Get string from [NDate date]
 *
 *  @return YYYY-MM-DD hh:mm:ss
 */
- (NSString *)formatFullCurrentDate
{
    NSString *dateStr = @"";
    NSDate *date = [NSDate date];
    NSDateFormatter *dateFomatter = [[NSDateFormatter alloc] init];
    [dateFomatter setDateFormat:@"dd-MM-yyyy HH:mm:ss"];
    dateStr = [dateFomatter stringFromDate:date];
    return dateStr;
}

/**
 *  get string from [NSDate date]
 *
 *  @return yyyyMMddhhmm
 */
- (NSString *)formatFullCurrentDateForTracking
{
    NSString *dateStr = @"";
    NSDate *date = [NSDate date];
    NSDateFormatter *dateFomatter = [[NSDateFormatter alloc] init];
    [dateFomatter setDateFormat:@"yyyyMMddhhmm"];
    dateStr = [dateFomatter stringFromDate:date];
    return dateStr;
}

/**
 *  parse string to date
 *
 *  @param dateString date string
 *  @param format     format
 *
 *  @return date
 */
- (NSDate *) dateFromString:(NSString*)dateString withFormat:(NSString*)format
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"UTC"]];
    [dateFormatter setDateFormat:format];
    return [dateFormatter dateFromString:dateString];
}


/**
 *  parse date to string
 *
 *  @param date   date value
 *  @param format format
 *
 *  @return string
 */
- (NSString *) stringFromDate:(NSDate*)date withFormat:(NSString*)format
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    //    [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"UTC"]];
    [formatter setDateFormat:format];
    return [formatter stringFromDate:date];
}

@end
