//
//  Movie.h
//  MovieDemo
//
//  Created by hongjian lin on 3/23/17.
//  Copyright © 2017 hongjian lin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject


@property (copy, nonatomic) NSString* movieId;

@property (copy, nonatomic) NSString* rank;

@property (copy, nonatomic) NSString* name;

@property (copy, nonatomic) NSString* duration;

@property (copy, nonatomic) NSString* movieDescription;

@property (copy, nonatomic) NSString* director;

@property (strong, nonatomic) NSDictionary *dic;

@end
