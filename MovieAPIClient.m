//
//  MovieAPIClient.m
//  MovieDemo
//
//  Created by hongjian lin on 3/23/17.
//  Copyright © 2017 hongjian lin. All rights reserved.
//

#import "MovieAPIClient.h"


static NSString * const MovieServiceURLString = @"https://interview.zocdoc.com/";


@implementation MovieAPIClient

+ (instancetype)sharedClient {
    static MovieAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[MovieAPIClient alloc] initWithBaseURL:[NSURL URLWithString:MovieServiceURLString]];
    });
    
    return _sharedClient;
}

- (instancetype)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    
    if (self) {
        // Any custom initialization - certificate pinning etc.
    }
    
    return self;
}

@end
