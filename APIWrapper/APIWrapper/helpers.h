//
//  helpers.h
//  APIWrapper
//
//  Created by Conrad Calmez on 6/20/13.
//  Copyright (c) 2013 Conrad Calmez. All rights reserved.
//

#ifndef APIWrapper_helpers_h
#define APIWrapper_helpers_h

#define S(format, ...) [NSString stringWithFormat:format,##__VA_ARGS__]

#ifdef DEBUG
    #define DebugLog(msg, args...) NSLog(msg, args);
#else
    #define DebugLog(msg, args...)
    #define NSLog(...)
#endif

#endif
