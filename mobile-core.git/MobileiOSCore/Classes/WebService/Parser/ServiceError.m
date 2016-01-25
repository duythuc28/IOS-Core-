//
//  ServiceError.m
//  WebServiceCore
//
//  Created by MacMini on 7/10/15.
//  Copyright (c) 2015 Duong Tran. All rights reserved.
//

#import "ServiceError.h"

@implementation ServiceError

- (id)initWithErrorCode:(NSString *)errorCode
{
    self = [super init];
    if (self) {
        self.errorMessage = errorCode;
    }
    
    return self;
}

@end
