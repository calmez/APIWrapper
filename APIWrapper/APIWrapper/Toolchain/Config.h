//
//  MetaConfig.h
//  APIWrapper
//
//  Created by Conrad Calmez on 6/20/13.
//  Copyright (c) 2013 Conrad Calmez. All rights reserved.
//

#import "DataObjet.h"

@interface MetaConfig : DataObjet

@property (readonly, nonatomic) NSArray *apis;

@end

@interface APIConfig : DataObjet

@property (readonly, nonatomic) NSString *name;
@property (readonly, nonatomic) NSString *configFileName;

@end