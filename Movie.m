//
//  Movie.m
//  MovieDemo
//
//  Created by hongjian lin on 3/23/17.
//  Copyright © 2017 hongjian lin. All rights reserved.
//

#import "Movie.h"

@implementation Movie


- (id) initWithDictionary:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        self.dic=dic;
    }
    return self;
}

- (NSString*) movieId
{
    return [self.dic objectForKey:@"id"];
}

- (NSString *)rank
{
     return [self.dic objectForKey:@"Rank"];
}

- (NSString *)name
{
    return [self.dic objectForKey:@"Name"];
}

- (NSString *)duration
{
    return [self.dic objectForKey:@"Duration"];
}

- (NSString *)movieDescription
{
    return [self.dic objectForKey:@"Description"];
}

- (NSString *)director
{
    return [self.dic objectForKey:@"Director"];
}


@end
