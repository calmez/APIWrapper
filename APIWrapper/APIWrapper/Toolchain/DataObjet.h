//
//  DataObjet.h
//  APIWrapper
//
//  Created by Conrad Calmez on 6/20/13.
//  Copyright (c) 2013 Conrad Calmez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONKit.h"

@interface DataObjet : NSObject <NSCopying>

- (id)initWithRawData:(NSDictionary *)data; // designated initializer
- (id)initWithJSONString:(NSString *)JSONstring;
- (id)dataWithKey:(NSString *)key;
- (id)copyWithZone:(NSZone *)zone;

@end