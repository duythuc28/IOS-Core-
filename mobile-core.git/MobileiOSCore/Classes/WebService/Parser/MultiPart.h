//
//  MultiPart.h
//  WebServiceCore
//
//  Created by MacMini on 7/10/15.
//  Copyright (c) 2015 Duong Tran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JsonSerializable.h"

@interface MultiPart : NSObject

@property (strong, nonatomic) NSString *contentType;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSData *data;

- (id)initWithName:(NSString *)name contentType:(NSString *)contentType andData:(NSData *)data;
- (NSMutableDictionary *)getHeaders;

@end

//////////////////////////////////////////////////

@interface JsonPart : MultiPart

@property (strong, nonatomic) JsonSerializable *model;

- (id)initWithName:(NSString *)name jsonPart:(JsonSerializable *)model;

@end

//////////////////////////////////////////////////

@interface StringPart : MultiPart

- (id)initWithName:(NSString *)name stringPart:(NSString *)string;

@end

//////////////////////////////////////////////////

@interface ArrayPart : MultiPart

- (id)initWithName:(NSString *)name arrayPart:(NSArray *)array;

@end

//////////////////////////////////////////////////

@interface FilePart : MultiPart

@property (strong, nonatomic) NSString *fileName;

- (id)initWithName:(NSString *)name fileName:(NSString *)fileName andData:(NSData *)data;

@end

