//
//  BaseInvoker.h
//  WebServiceCore
//
//  Created by MacMini on 7/10/15.
//  Copyright (c) 2015 Duong Tran. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "RequestInvoker.h"
#import "ServiceError.h"

@interface BaseInvoker : NSObject

- (id)initWithControllerName:(NSString *)controllerName;
- (RequestInvoker *)createRequestInvokerWithMethodName:(NSString *)methodName requestMethod:(RequestMethod)requestMethod;
- (ServiceError *)handleError:(AFHTTPRequestOperation *)operation;

@end