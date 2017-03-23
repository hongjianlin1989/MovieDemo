//
//  MoiveService.h
//  MovieDemo
//
//  Created by hongjian lin on 3/23/17.
//  Copyright © 2017 hongjian lin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APIClient.h"

@class MovieRequest;
@class Movie;


typedef void (^MoiveSuccessCallback)(NSArray <Movie *> *results);

@interface MoiveService : NSObject

typedef enum {
    RetrieveMovieSet = 1,
    RetrieveMovieInfoBasedOnRank,
    RetrieveDetailedMovieInfo
} MovieTermType;

- (instancetype)initWithAPIClient:(id<APIClient>)client;


- (void)getMoiveResultsWithRequest:(MovieRequest *)request
                           success:(MoiveSuccessCallback)success
                           failure:(ServiceFailureCallback)failure;

- (void)getMoiveRankResultsWithRequest:(MovieRequest *)request
                                   success:(MoiveSuccessCallback)success
                                   failure:(ServiceFailureCallback)failure;

- (void)getMoiveDetailResultsWithRequest:(MovieRequest *)request
                                 success:(MoiveSuccessCallback)success
                                 failure:(ServiceFailureCallback)failure;

@end
