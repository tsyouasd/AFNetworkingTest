//
//  NetHttpClient.m
//  NetworkProject
//
//  Created by JordanCZ on 16/5/25.
//  Copyright © 2016年 JordanCZ. All rights reserved.
//

#import "NetHttpClient.h"

static  NSString  * const NetHttpClientBaseURLString = @"https://api.app.net/";

@implementation NetHttpClient

+ (instancetype)sharedClient{
    static NetHttpClient  *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[NetHttpClient alloc] initWithBaseURL:[NSURL URLWithString:NetHttpClientBaseURLString]];
        _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    });
    return _sharedClient;
}


- (void)sendRequestWithMethod:(NSString *)method
                    URLString:(NSString *)url
                   parameters:(NSDictionary *)parameters
               completedBlock:(NetHttpClientComplateBlock)completedBlock{
    
}

- (NSURLSessionDataTask *)sendRequestWithMethod:(NSString *)method
                    urlString:(NSString *)url
                   parameters:(NSDictionary *)parameters
                complateBlock:(NetHttpClientComplateBlock)complatedblock
                    progress:(void (^)(NSProgress * _Nonnull))progressblock
                     constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))bodyblock{
    
     
    
    return [self POST:url parameters:parameters progress:progressblock success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        dispatch_async(dispatch_get_main_queue(), ^{
            complatedblock(responseObject,task,YES);
        });
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            complatedblock(nil,task,NO);
        });
    }];
}


@end
