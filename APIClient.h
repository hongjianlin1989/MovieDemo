
//
//  APIClient.h
//  MovieDemo
//
//  Created by hongjian lin on 3/23/17.
//  Copyright © 2017 hongjian lin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFURLRequestSerialization.h"
/**
 * Generic service failure handler. All failures should call back with an NSError instance.
 */
typedef void (^ServiceFailureCallback)(NSError * _Nonnull error);


/**
 * APIClient is a protocol that essentialy wraps AFHTTPSerssionManager request methods
 * This way, they will be really easy to stub for tests for example.
 */
@protocol APIClient <NSObject>


- (NSURLSessionDataTask * _Nonnull)GET:(NSString * _Nonnull)URLString
                            parameters:(id _Nullable)parameters
                              progress:(void (^ _Nullable)(NSProgress * _Nonnull progress))downloadProgress
                               success:(void (^ _Nullable)(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject))success
                               failure:(void (^ _Nullable)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error))failure;

- (NSURLSessionDataTask * _Nonnull)POST:(NSString *_Nonnull)URLString
                             parameters:(id _Nullable)parameters
                               progress:(void (^  _Nullable)(NSProgress *_Nonnull uploadProgress))uploadProgress
                                success:(void (^  _Nullable)(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject))success
                                failure:(void (^  _Nullable)(NSURLSessionDataTask * _Nullable task, NSError *_Nonnull error))failure;

- (NSURLSessionDataTask * _Nonnull)POST:(NSString *_Nonnull)URLString
                    parameters:(id _Nullable)parameters
     constructingBodyWithBlock:(void (^ _Nullable)(id <AFMultipartFormData> formData))block
                      progress:(nullable void (^)(NSProgress * _Nonnull))uploadProgress
                       success:(void (^ _Nonnull)(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject))success
                       failure:(void (^ _Nonnull)(NSURLSessionDataTask * _Nullable task, NSError *_Nonnull error))failure;

- (NSURLSessionDataTask * _Nonnull)DELETE:(NSString *_Nonnull)URLString
                      parameters:(id _Nullable)parameters
                         success:(void (^ _Nonnull)(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject))success
                         failure:(void (^ _Nonnull)(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error))failure;

- (nullable NSURLSessionDataTask *)PUT:(NSString * _Nonnull)URLString
                            parameters:(nullable id)parameters
                               success:(nullable void (^)(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject))success
                               failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *_Nonnull error))failure;


@end
