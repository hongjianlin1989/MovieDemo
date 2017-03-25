//
//  MovieService.m
//  MovieDemo
//
//  Created by hongjian lin on 3/23/17.
//  Copyright © 2017 hongjian lin. All rights reserved.
//

#import "MovieService.h"
#import "MovieRequest.h"
#import "Movie.h"
static NSString * const AllMoviesEndpointString = @"api/1/FEE/AllMovies";
static NSString * const MoviesByRankEndpointString = @"api/1/FEE/MoviesByRank";
static NSString * const MovieDetailsEndpointString = @"api/1/FEE/MovieDetails";

@interface MovieService()

@property (nonatomic, strong) id<APIClient> client;

@end

@implementation MovieService


- (instancetype)initWithAPIClient:(id<APIClient>)client
{
    self = [super init];
    
    if (self) {
        self.client = client;
    }
    
    return self;
}


- (void)getMovieResultsWithRequest:(MovieRequest *)request
                           success:(MovieSuccessCallback)success
                           failure:(ServiceFailureCallback)failure
{
    
    NSString *endpoint = AllMoviesEndpointString;
    
    
    [self.client GET:endpoint parameters:request.parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
      
        NSArray * JSONArray = (NSArray *) responseObject;
        NSMutableArray *result= [[NSMutableArray alloc] init];
        for (NSDictionary *movieDic in JSONArray) {
            Movie *tem=[[Movie alloc] initWithDictionary:movieDic];
            [result addObject:tem];
        }
        
        success(result);
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    
        failure(error);
    }];

    
    
}

- (void)getMovieRankResultsWithRequest:(MovieRequest *)request
                               success:(MovieSuccessCallback)success
                               failure:(ServiceFailureCallback)failure
{
    NSString *endpoint = MoviesByRankEndpointString;
    
    
    [self.client GET:endpoint parameters:request.rankParameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSArray * JSONArray = (NSArray *) responseObject;
        NSMutableArray *result= [[NSMutableArray alloc] init];
        for (NSDictionary *movieDic in JSONArray) {
            Movie *tem=[[Movie alloc] initWithDictionary:movieDic];
            [result addObject:tem];
        }
        
        success(result);

        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(error);
    }];
}

- (void)getMovieDetailResultsWithRequest:(MovieRequest *)request
                                 success:(MovieSuccessCallback)success
                                 failure:(ServiceFailureCallback)failure
{
    NSString *endpoint =[NSString stringWithFormat:@"%@?%@", MovieDetailsEndpointString, request.DetailUrl];
    
    
    [self.client GET:endpoint parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSArray * JSONArray = (NSArray *) responseObject;
        NSMutableArray *result= [[NSMutableArray alloc] init];
        for (NSDictionary *movieDic in JSONArray) {
            Movie *tem=[[Movie alloc] initWithDictionary:movieDic];
            [result addObject:tem];
        }
        
        success(result);

        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(error);
    }];
}


@end
