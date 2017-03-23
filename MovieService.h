//
//  MovieService.h
//  MovieDemo
//
//  Created by hongjian lin on 3/23/17.
//  Copyright © 2017 hongjian lin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APIClient.h"

@class MovieRequest;
@class Movie;


typedef void (^MovieSuccessCallback)(NSArray <Movie *> *results);

@interface MovieService : NSObject

typedef enum {
    RetrieveMovieSet = 1,
    RetrieveMovieInfoBasedOnRank,
    RetrieveDetailedMovieInfo
} MovieTermType;

- (instancetype)initWithAPIClient:(id<APIClient>)client;


- (void)getMovieResultsWithRequest:(MovieRequest *)request
                           success:(MovieSuccessCallback)success
                           failure:(ServiceFailureCallback)failure;

- (void)getMovieRankResultsWithRequest:(MovieRequest *)request
                                   success:(MovieSuccessCallback)success
                                   failure:(ServiceFailureCallback)failure;

- (void)getMovieDetailResultsWithRequest:(MovieRequest *)request
                                 success:(MovieSuccessCallback)success
                                 failure:(ServiceFailureCallback)failure;

@end
