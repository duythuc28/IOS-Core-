//
//  NSObject+AGS.m
//  OTTApp
//
//  Created by Tran Tu Duong on 3/18/15.
//  Copyright (c) 2015 Nhan Nguyen. All rights reserved.
//

#import "NSObject+Database.h"
#import <objc/runtime.h>

@implementation NSObject (Database)

- (NSDictionary *)getListProperty
{
    NSMutableArray *listProperty = [@[] mutableCopy];
    NSMutableArray *listValue= [@[] mutableCopy];
    NSMutableDictionary *jsonValues = [@{} mutableCopy];
    
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    for(i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        const char *propName = property_getName(property);
        if(propName) {
            NSString *propertyName = [NSString stringWithCString:propName
                                                        encoding:[NSString defaultCStringEncoding]];
            @try {
                id value = [self valueForKeyPath:propertyName];
                if (value) {
                    [listValue addObject:value];
                    [listProperty addObject:propertyName];
                    [jsonValues setValue:value forKey:propertyName];
                }
            }
            @catch (NSException *exception) {
                NSLog(@"%@", exception);
            }
            @finally {
                
            }
        
        }
    }
    
    free(properties);
    
    if (listValue.count == listProperty.count) {
        return @{@"properties" : listProperty, @"values" : @[listValue], @"jsonValues" : jsonValues};
    }
    
    return nil;
}

+ (NSObject *)fillData:(FMResultSet *)resultSet
{
    if (resultSet.allRecords.count > 0) {
        
        NSObject *objTemp = [[[self class] alloc] init];
        
        unsigned int outCount, i;
        objc_property_t *properties = class_copyPropertyList([self class], &outCount);
        for(i = 0; i < outCount; i++) {
            objc_property_t property = properties[i];
            const char *propName = property_getName(property);
            if(propName) {
                const char *propType = property_getAttributes(property);
                NSString *propertyName = [NSString stringWithCString:propName
                                                            encoding:[NSString defaultCStringEncoding]];
                NSString *propertyType = [NSString stringWithCString:propType
                                                            encoding:[NSString defaultCStringEncoding]];
                propertyType = [[propertyType componentsSeparatedByString:@","] firstObject];
                
                /// obj
                if ([propertyType rangeOfString:NSStringFromClass([NSString class])].location != NSNotFound) {
                    [objTemp setValue:[resultSet stringForColumn:propertyName] forKey:propertyName];
                }
                else if ([propertyType rangeOfString:NSStringFromClass([NSData class])].location != NSNotFound) {
                    [objTemp setValue:[resultSet dataForColumn:propertyName] forKey:propertyName];
                }
                else if ([propertyType rangeOfString:NSStringFromClass([NSNumber class])].location != NSNotFound) {
                    [objTemp setValue:[NSNumber numberWithDouble:[resultSet doubleForColumn:propertyName]] forKey:propertyName];
                }
                
                /// non-obj
                else if ([propertyType rangeOfString:@"Tq"].location != NSNotFound) {
                    [objTemp setValue:[NSNumber numberWithDouble:[resultSet intForColumn:propertyName]] forKey:propertyName];
                }
                else if ([propertyType rangeOfString:@"TB"].location != NSNotFound) {
                    [objTemp setValue:[NSNumber numberWithDouble:[resultSet intForColumn:propertyName]] forKey:propertyName];
                }
            }
        }
        
        free(properties);
        
        return objTemp;
    }
    return nil;
}

NSString* getPropertyType(objc_property_t property) {
    const char *attributes = property_getAttributes(property);
    char buffer[1 + strlen(attributes)];
    strcpy(buffer, attributes);
    char *state = buffer, *attribute;
    while ((attribute = strsep(&state, ",")) != NULL) {
        if (attribute[0] == 'T') {
            return [[NSString alloc] initWithBytes:attribute + 3 length:strlen(attribute) - 4 encoding:NSASCIIStringEncoding];
        }
    }
    return @"@";
}


-(NSMutableDictionary *)getDictionary
{
    Class klass = self.class;
    if (klass == NULL) {
        return nil;
    }
    
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList(klass, &outCount);
    NSMutableDictionary * results = [NSMutableDictionary dictionaryWithCapacity:outCount];
    for (i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        const char *propName = property_getName(property);
        if(propName) {
            NSString *propertyName = [NSString stringWithUTF8String:propName];
            
            NSString * value = [self valueForKey:propertyName];
            if (value) {
                [results setObject:value forKey:propertyName];
            }
        }
    }
    free(properties);
    
    return results;
}


-(void)setDictionary:(NSDictionary*)dictionary
{
    Class klass = self.class;
    if (klass == NULL) {
        return;
    }
    
    [dictionary enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop){
        // Don't set null objects. Skip "id"
        if (![obj isMemberOfClass:[NSNull class]] && ![key isEqualToString:@"id"]) {
            @try {
                objc_property_t property = class_getProperty(klass, [key UTF8String]);
                if (property) {
                    NSString *properyType = getPropertyType(property);
                    if ([properyType isEqualToString:@"NSNumber"] && [obj isKindOfClass:[NSString class]]) {
                        // Force NSNumber mapping if value is NSString
                        static NSNumberFormatter * f;
                        if (!f) {
                            f = [[NSNumberFormatter alloc] init];
                            [f setNumberStyle:NSNumberFormatterDecimalStyle];
                            [f setMaximumFractionDigits:20];
                        }
                        NSNumber * num = [f numberFromString:obj];
                        [self setValue:num forKey:(NSString *)key];
                    }
                    else {
                        [self setValue:obj forKey:(NSString *)key];
                    }
                }
            }
            @catch (NSException *exception) {
                // Ignore
                //NSLog(@"Exception while enumerating object: %@", exception.description);
            }
        }
    }];
}

@end
