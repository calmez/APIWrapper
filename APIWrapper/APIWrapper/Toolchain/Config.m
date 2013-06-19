//
//  MetaConfig.m
//  APIWrapper
//
//  Created by Conrad Calmez on 6/20/13.
//  Copyright (c) 2013 Conrad Calmez. All rights reserved.
//

#import "Config.h"

#define META_CONFIG_FILE_NAME @"metaconfig.json"

#define API_LIST_KEY @"apis"
#define API_NAME_KEY @"name"
#define API_CONFIG_FILE_KEY @"file"

@interface MetaConfig ()

@end

@implementation MetaConfig

#pragma mark - Initialisation

- (id)init
{
    self = [super init];
    if (self) {
        NSError *readError;
        NSString *rawMetaConfig = [NSString stringWithContentsOfFile:META_CONFIG_FILE_NAME
                                                            encoding:NSUTF8StringEncoding
                                                               error:&readError];
        if (readError != nil) {
            [NSException raise:@"Could not read metaconfig file"
                        format:@"looking for file with name '%@'", META_CONFIG_FILE_NAME];
        }
        self = [self initWithJSONString:rawMetaConfig];
    }
    return self;
}

#pragma mark - Custom Getters

@synthesize apis = _apis;

- (NSArray *)apis
{
    if (_apis == nil) {
        NSMutableArray *outArray = [NSMutableArray array];
        NSArray *rawData = [[self dataWithKey:API_LIST_KEY] copy];
        for (NSDictionary *rawAPI in rawData) {
            [outArray addObject:[[APIConfig alloc] initWithRawData:rawAPI]];
        }
        _apis = [outArray copy];
    }
    return _apis;
}

@end

@interface APIConfig ()

@end

@implementation APIConfig

- (NSString *)name
{
    return [self dataWithKey:API_NAME_KEY];
}

- (NSString *)configFileName
{
    return [self dataWithKey:API_CONFIG_FILE_KEY];
}

// TODO parse API config

@end
