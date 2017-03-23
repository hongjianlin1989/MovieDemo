//
//  MoiveAPIClient.h
//  MovieDemo
//
//  Created by hongjian lin on 3/23/17.
//  Copyright © 2017 hongjian lin. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import "APIClient.h"
@interface MoiveAPIClient : AFHTTPSessionManager<APIClient>

+ (instancetype)sharedClient;

@end
