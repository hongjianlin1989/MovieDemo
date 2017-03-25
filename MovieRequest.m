//
//  MovieRequest.m
//  MovieDemo
//
//  Created by hongjian lin on 3/23/17.
//  Copyright © 2017 hongjian lin. All rights reserved.
//

#import "MovieRequest.h"

static NSString * const authToken = @"3b502b3f-b1ff-4128-bd99-626e74836d9c";


@implementation MovieRequest


+ (MovieRequest *)requestMovie
{
    MovieRequest *request = [MovieRequest new];
    return request;
}

+ (MovieRequest *)requestmovieIds:(NSArray *)movieIds
{
    MovieRequest *request = [MovieRequest new];
    request.movieIds= [movieIds copy];
    return request;
}

+ (MovieRequest *)requestStartRankIndex:(NSNumber *)startRankIndex
                              numMovies:(NSNumber *)numMovies
{
    MovieRequest *request = [MovieRequest new];
    request.startRankIndex= startRankIndex.integerValue;
    request.numMovies= numMovies.integerValue;
    return request;
}


- (NSDictionary *)parameters
{
    NSMutableDictionary *parameters = [@{} mutableCopy];
    
    parameters[@"authToken"] = authToken;

    return [parameters copy];
}

- (NSDictionary *)rankParameters
{
    NSMutableDictionary *parameters = [@{} mutableCopy];
    parameters[@"authToken"] = authToken;
    parameters[@"startRankIndex"] =[NSNumber numberWithInteger:self.startRankIndex];
    parameters[@"numMovies"] =[NSNumber numberWithInteger:self.numMovies];
    return [parameters copy];
}

- (NSDictionary *)movieDetailParameters
{
    NSMutableDictionary *parameters = [@{} mutableCopy];
    parameters[@"authToken"] = authToken;
    [parameters setObject:self.movieIds forKey:@"movieIds"];

    return [parameters copy];
}


- (NSString *)DetailUrl
{
    NSString *url=[NSString stringWithFormat:@"authToken=%@", authToken];
    
    for (NSNumber *num in self.movieIds) {
        
        url= [url stringByAppendingString:[NSString stringWithFormat:@"&movieIds=%@",num.stringValue]];
        
    }
    
    return url;
}


@end
