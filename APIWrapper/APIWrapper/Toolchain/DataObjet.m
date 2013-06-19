//
//  DataObjet.m
//  APIWrapper
//
//  Created by Conrad Calmez on 6/20/13.
//  Copyright (c) 2013 Conrad Calmez. All rights reserved.
//

#import "DataObjet.h"

@interface DataObjet ()

@property (strong, nonatomic) NSDictionary *data;

@end

@implementation DataObjet   

@synthesize data = _data;

- (id)initWithRawData:(NSDictionary *)data
{
    if ([super init]) {
        if ([data isKindOfClass:[NSDictionary class]]) {
            self.data = data;
        } else {
            self.data = [NSDictionary dictionary];
        }
        return self;
    } else {
        return nil;
    }
}

- (id)initWithJSONString:(NSString *)JSONstring
{
    id parsedData = [JSONstring objectFromJSONString];
    NSDictionary *data = [NSDictionary dictionary];
    if ([parsedData respondsToSelector:@selector(objectForKeyedSubscript:)]) {
        data = [parsedData copy];
    }
    return [self initWithRawData:data];
}

- (id)dataWithKey:(NSString *)key
{
    id value = [self.data objectForKey:key];
    if ([value isKindOfClass:[NSNull class]]) {
        return nil;
    }
    return value;
}

- (id)copyWithZone:(NSZone *)zone
{
    return [[[self class] allocWithZone:zone] initWithRawData:self.data];
}

@end