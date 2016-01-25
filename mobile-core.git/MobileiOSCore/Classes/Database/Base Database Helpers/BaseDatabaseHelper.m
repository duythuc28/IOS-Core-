//
//  BaseDatabaseHelper.m
//  iOSCore
//
//  Created by MacMini on 7/10/15.
//  Copyright (c) 2015 Duong Tran. All rights reserved.
//

#import "BaseDatabaseHelper.h"

@implementation BaseDatabaseHelper

+ (NSString *)dbFilePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    return [[paths firstObject] stringByAppendingPathComponent:DATABASE_NAME];
}

+ (BOOL)openDB:(FMDatabase *)iFmDb
{
    if (![iFmDb open])
    {
        return NO;
    }
    
    return YES;
}

+ (BOOL)initDataTable
{
    NSString *databasePathFromApp = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:DATABASE_NAME];
    
    NSError *error;
    NSString *dbPath = [BaseDatabaseHelper dbFilePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:dbPath]) {
        if(![[NSFileManager defaultManager] copyItemAtPath:databasePathFromApp
                                                    toPath:[self dbFilePath]
                                                     error:&error])
        {
            NSLog(@"%@", error);
            return NO;
        }
    }
    
    return YES;
}

+ (BOOL)delete:(NSString *)tableName where:(NSString *)where arguments:(NSArray *)arguments
{
    FMDatabase *fmdb = [FMDatabase databaseWithPath:[BaseDatabaseHelper dbFilePath]];
    BOOL isOpen = [BaseDatabaseHelper openDB:fmdb];
    if (isOpen) {
        NSError *error;
        BOOL isSuccess = [fmdb deleteFrom:tableName where:where arguments:arguments error:&error];
        [fmdb close];
        
        return isSuccess;
    }
    
    return NO;
}

+ (NSDictionary *)insert:(NSString *)tableName models:(NSArray *)models
{
    FMDatabase *fmdb = [FMDatabase databaseWithPath:[BaseDatabaseHelper dbFilePath]];
    BOOL isOpen = [BaseDatabaseHelper openDB:fmdb];
    NSInteger failedCount = 0;
    NSInteger successCount = 0;
    if (isOpen) {
        [fmdb beginTransaction];
        for (NSObject *model in models) {
            NSDictionary *obj = [model getListProperty];
            if (obj) {
                @try
                {
                    BOOL isSuccess = [fmdb insertInto:tableName columns:[NSArray arrayWithArray:[obj valueForKeyPath:@"properties"]] values:[obj valueForKeyPath:@"values"] error:nil];
                    if (!isSuccess) {
                        failedCount ++;
                        
                        NSMutableDictionary *json = [obj valueForKeyPath:@"jsonValues"];
                        [json removeObjectForKey:[obj valueForKeyPath:@"properties"][0]];
                        
                        NSMutableArray *properties = [obj valueForKeyPath:@"properties"];
                        NSMutableArray *values = [obj valueForKeyPath:@"values"][0];
                        
                        if ([tableName isEqualToString:@"category"]) {
                            NSUInteger index = [properties indexOfObject:@"isChecked"];
                            [properties removeObjectAtIndex:index];
                            [values removeObjectAtIndex:index];
                        }
                        
                        NSInteger isSuccess = [fmdb update:tableName values:json matchingValues:@{properties[0] : values} error:nil];
                        
                        if (isSuccess == -1) { /* -1 is failed */
                            [fmdb rollback];
                        }
                    }
                    else {
                        successCount ++;
                    }
                }
                @catch(NSException* e)
                {
                    failedCount ++;
                }
            }
        }
        
        [fmdb commit];
        [fmdb close];
    }
    
    return @{@"success" : [NSNumber numberWithInteger:successCount], @"failed" : [NSNumber numberWithInteger:failedCount]};
}

/// matchingValues = @{key : value, key1: value1};
/// data = @{column : value}
+ (BOOL)update:(NSString *)tableName updateData:(NSDictionary *)data matchingValues:(NSDictionary *)matchingValues
{
    FMDatabase *fmdb = [FMDatabase databaseWithPath:[BaseDatabaseHelper dbFilePath]];
    BOOL isOpen = [BaseDatabaseHelper openDB:fmdb];
    if (isOpen) {
        [fmdb beginTransaction];
        @try
        {
            NSInteger isSuccess = [fmdb update:tableName values:data matchingValues:matchingValues error:nil];
            
            if (isSuccess == -1) { /* -1 is failed */
                [fmdb rollback];
                return NO;
            }
            else {
                [fmdb commit];
                return YES;
            }
        }
        @catch(NSException* e)
        {
            [fmdb rollback];
            return NO;
        }
        
        [fmdb close];
    }
}

+ (NSArray *)selectAll:(NSString *)tableName orderBy:(NSString *)clause
{
    FMDatabase *fmdb = [FMDatabase databaseWithPath:[BaseDatabaseHelper dbFilePath]];
    BOOL isOpen = [BaseDatabaseHelper openDB:fmdb];
    if (isOpen) {
        NSError *error;
        NSArray *results = [fmdb selectAllFrom:tableName orderBy:clause error:&error];
        [fmdb close];
        
        return results;
    }
    
    return nil;
}

+ (NSArray *)selectAll:(NSString *)tableName where:(NSString *)where arguments:(NSArray *)arguments orderBy:(NSString *)orderBy
{
    FMDatabase *fmdb = [FMDatabase databaseWithPath:[BaseDatabaseHelper dbFilePath]];
    BOOL isOpen = [BaseDatabaseHelper openDB:fmdb];
    if (isOpen) {
        NSError *error;
        NSArray *results = [fmdb selectAllFrom:tableName where:where arguments:arguments orderBy:orderBy error:&error];
        [fmdb close];
        
        return results;
    }
    
    return nil;
}

+ (NSArray *)selectAll:(NSString *)tableName columnNames:(NSArray *)columnNames where:(NSString *)where arguments:(NSArray *)arguments orderBy:(NSString *)orderBy groupBy:(NSString *)groupBy having:(NSString *)having limit:(NSNumber *)limit offset:(NSNumber *)offset
{
    FMDatabase *fmdb = [FMDatabase databaseWithPath:[BaseDatabaseHelper dbFilePath]];
    BOOL isOpen = [BaseDatabaseHelper openDB:fmdb];
    if (isOpen) {
        NSError *error;
        NSArray *results = [fmdb selectResults:columnNames from:tableName where:where groupBy:groupBy having:having arguments:arguments orderBy:orderBy limit:limit offset:offset error:&error].allRecords;
        [fmdb close];
        
        return results;
    }
    
    return nil;
}

+ (NSArray *)selectAll:(NSString *)tableName matchingValues:(NSDictionary *)matchingValues orderBy:(NSString *)orderBy
{
    FMDatabase *fmdb = [FMDatabase databaseWithPath:[BaseDatabaseHelper dbFilePath]];
    BOOL isOpen = [BaseDatabaseHelper openDB:fmdb];
    if (isOpen) {
        NSError *error;
        NSArray *results = [fmdb selectResultsFrom:tableName matchingValues:matchingValues orderBy:orderBy error:&error].allRecords;
        [fmdb close];
        
        return results;
    }
    
    return nil;
}

+ (NSObject *)selectSingle:(NSString *)tableName class:(Class)className matchingValues:(NSDictionary *)matchingValues orderBy:(NSString *)orderBy
{
    FMDatabase *fmdb = [FMDatabase databaseWithPath:[BaseDatabaseHelper dbFilePath]];
    BOOL isOpen = [BaseDatabaseHelper openDB:fmdb];
    if (isOpen) {
        NSError *error;
        NSArray *results = [fmdb selectResultsFrom:tableName matchingValues:matchingValues orderBy:orderBy error:&error].allRecords;
        [fmdb close];
        
        if (results.count > 0) {
            NSObject *obj = [[className alloc] init];
            [obj setDictionary:results[0]];
            return obj;
        }
        
        return nil;
    }
    
    return nil;
}


@end
