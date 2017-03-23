//
//  MoiveService.m
//  MovieDemo
//
//  Created by hongjian lin on 3/23/17.
//  Copyright © 2017 hongjian lin. All rights reserved.
//

#import "MoiveService.h"
#import "MovieRequest.h"
static NSString * const AllMoviesEndpointString = @"api/1/FEE/AllMovies";
static NSString * const MoviesByRankEndpointString = @"api/1/FEE/MoviesByRank";
static NSString * const MovieDetailsEndpointString = @"api/1/FEE/MovieDetails";

@interface MoiveService()

@property (nonatomic, strong) id<APIClient> client;

@end

@implementation MoiveService


- (instancetype)initWithAPIClient:(id<APIClient>)client
{
    self = [super init];
    
    if (self) {
        self.client = client;
    }
    
    return self;
}


- (void)getMoiveResultsWithRequest:(MovieRequest *)request
                           success:(MoiveSuccessCallback)success
                           failure:(ServiceFailureCallback)failure
{
    
    NSString *endpoint = AllMoviesEndpointString;
    
    
    [self.client GET:endpoint parameters:request.parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        if ([responseObject objectForKey:@"result_type"] != [NSNull null]) {
//            [[TocaBocaAPI shared] setSearchResultType:[responseObject objectForKey:@"result_type"]];
//        }
//        id JSONArray = [responseObject objectForKey:@"result"];
//        
//        if (JSONArray == [NSNull null]) {
//            // So, if result isn't set, but we got a response, it's all good?
//            // Shouldn't the server return an empty array?
//            return success(@[]);
//        }
//        
//        NSError *error = nil;
//        NSArray<Video *> *results = [MTLJSONAdapter modelsOfClass:Video.class fromJSONArray:JSONArray error:&error];
//        
//        if (error == nil) {
//            success(results);
//        }
//        else {
//            failure(error);
//        }
//        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    
        failure(error);
    }];

    
    
}

- (void)getMoiveRankResultsWithRequest:(MovieRequest *)request
                               success:(MoiveSuccessCallback)success
                               failure:(ServiceFailureCallback)failure
{
    NSString *endpoint = MoviesByRankEndpointString;
    
    
    [self.client GET:endpoint parameters:request.parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
  
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(error);
    }];
}

- (void)getMoiveDetailResultsWithRequest:(MovieRequest *)request
                                 success:(MoiveSuccessCallback)success
                                 failure:(ServiceFailureCallback)failure
{
    NSString *endpoint = MovieDetailsEndpointString;
    
    
    [self.client GET:endpoint parameters:request.parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(error);
    }];
}


@end
