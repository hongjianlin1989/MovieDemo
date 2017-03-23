//
//  MoiveAPIClient.m
//  MovieDemo
//
//  Created by hongjian lin on 3/23/17.
//  Copyright © 2017 hongjian lin. All rights reserved.
//

#import "MoiveAPIClient.h"


static NSString * const MovieServiceURLString = @"https://interview.zocdoc.com/";


@implementation MoiveAPIClient

+ (instancetype)sharedClient {
    static MoiveAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[MoiveAPIClient alloc] initWithBaseURL:[NSURL URLWithString:MovieServiceURLString]];
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
