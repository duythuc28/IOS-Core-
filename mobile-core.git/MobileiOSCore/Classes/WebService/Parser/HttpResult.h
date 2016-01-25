//
//  mHttpResult.h
//  WebServiceCore
//
//  Created by MacMini on 7/10/15.
//  Copyright (c) 2015 Duong Tran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPRequestOperation.h"

@interface HttpResult : NSObject

@property (strong, nonatomic) AFHTTPRequestOperation *requestOperation;

// methods

- (id)initWithAFHTTPRequestOperation:(AFHTTPRequestOperation *)requestOperation;
- (id)parseFromDictionary:(NSDictionary *)dictionary class:(Class)class;

- (BOOL)isSuccess;

- (id)parse:(Class)class;
- (BOOL)toBoolean;
- (NSString *)toString;
- (NSInteger)toInteger;
- (CGFloat)toFloat;
- (NSNumber *)toNumber;
- (NSArray *)toArray:(Class)class;
- (NSDictionary *)toDictionary;

@end
