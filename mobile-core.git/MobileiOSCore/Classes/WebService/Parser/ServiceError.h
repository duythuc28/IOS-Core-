//
//  ServiceError.h
//  WebServiceCore
//
//  Created by MacMini on 7/10/15.
//  Copyright (c) 2015 Duong Tran. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ServiceError : NSError

@property (strong, nonatomic) NSString *errorMessage;

- (id)initWithErrorCode:(NSString *)errorCode;

@end