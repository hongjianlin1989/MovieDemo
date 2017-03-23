//
//  MovieRequest.h
//  MovieDemo
//
//  Created by hongjian lin on 3/23/17.
//  Copyright © 2017 hongjian lin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieRequest : NSObject


@property (nonatomic, assign) NSInteger startRankIndex;
@property (nonatomic, assign) NSInteger numMovies;
@property (nonatomic, assign) NSInteger movieIds;


/**
 * Factory method that explicitly takes all parameters
 */
+ (MovieRequest *)requestMovie;
+ (MovieRequest *)requestStartRankIndex:(NSNumber *)startRankIndex
                              numMovies:(NSNumber *)numMovies;
+ (MovieRequest *)requestmovieIds:(NSNumber *)movieIds;


/**
 * Request parameters
 */
- (NSDictionary *)parameters;
- (NSDictionary *)rankParameters;
- (NSDictionary *)movieDetailParameters;

/**
 * Request part of the URL.
 */
- (NSString *)url;
@end
