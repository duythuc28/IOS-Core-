//
//  BaseDatabaseHelper.h
//  iOSCore
//
//  Created by MacMini on 7/10/15.
//  Copyright (c) 2015 Duong Tran. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseDatabaseHelper : NSObject

+ (NSString *)dbFilePath;

+ (BOOL)initDataTable;
+ (BOOL)openDB:(FMDatabase *)iFmDb;
+ (BOOL)update:(NSString *)tableName updateData:(NSDictionary *)data matchingValues:(NSDictionary *)matchingValues;

+ (BOOL)delete:(NSString *)tableName where:(NSString *)where arguments:(NSArray *)arguments;
+ (NSDictionary *)insert:(NSString *)tableName models:(NSArray *)models;

+ (NSArray *)selectAll:(NSString *)tableName orderBy:(NSString *)clause;
+ (NSArray *)selectAll:(NSString *)tableName where:(NSString *)where arguments:(NSArray *)arguments orderBy:(NSString *)orderBy;
+ (NSArray *)selectAll:(NSString *)tableName columnNames:(NSArray *)columnNames where:(NSString *)where arguments:(NSArray *)arguments orderBy:(NSString *)orderBy groupBy:(NSString *)groupBy having:(NSString *)having limit:(NSNumber *)limit offset:(NSNumber *)offset;
+ (NSArray *)selectAll:(NSString *)tableName matchingValues:(NSDictionary *)matchingValues orderBy:(NSString *)orderBy;

+ (NSObject *)selectSingle:(NSString *)tableName class:(Class)className matchingValues:(NSDictionary *)matchingValues orderBy:(NSString *)orderBy;

@end
