//
//  NetHttpClient.m
//  NetworkProject
//
//  Created by JordanCZ on 16/5/25.
//  Copyright © 2016年 JordanCZ. All rights reserved.
//

#import "NetHttpClient.h"

static  NSString  * const NetHttpClientBaseURLString = @"https://api.app.net/";

@interface AFHTTPSessionManager (DataTask)

// this method is not publicly defined in @interface in .h, so we need to define our own interface for it

- (NSURLSessionDataTask *)dataTaskWithHTTPMethod:(NSString *)method
                                       URLString:(NSString *)URLString
                                      parameters:(id)parameters
                                  uploadProgress:(nullable void (^)(NSProgress *uploadProgress)) uploadProgress
                                downloadProgress:(nullable void (^)(NSProgress *downloadProgress)) downloadProgress
                                         success:(void (^)(NSURLSessionDataTask *, id))success
                                         failure:(void (^)(NSURLSessionDataTask *, NSError *))failure;
@end

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




- (NSURLSessionDataTask *)sendRequestWithMethod:(NSString *)method
                    URLString:(NSString *)url
                   parameters:(NSDictionary *)parameters
               completedBlock:(NetHttpClientComplateBlock)completedBlock{
   return   [self sendRequestWithMethod:method urlString:url parameters:parameters complateBlock:completedBlock uploadProgress:nil downloadProgress:nil];
}

- (NSURLSessionDataTask *)sendRequestWithMethod:(NSString *)method
                    urlString:(NSString *)url
                   parameters:(NSDictionary *)parameters
                complateBlock:(NetHttpClientComplateBlock)complatedblock
               uploadProgress:(void (^)(NSProgress *uploadProgress)) uploadProgress
             downloadProgress:(void (^)(NSProgress *downloadProgress)) downloadProgress
                    {
    
                        
                        AFHTTPResponseSerializer *jsonResponseSerializer = [AFHTTPResponseSerializer serializer];
                        NSMutableSet *jsonAcceptContentTypes = [NSMutableSet setWithSet:jsonResponseSerializer.acceptableContentTypes];
                        [jsonAcceptContentTypes addObjectsFromArray:@[@"text/plain", @"application/json",@"text/json",@"application/xml",@"text/html",@"image/tiff",@"image/jpeg", @"image/gif", @"image/png", @"image/ico", @"image/x-icon", @"image/bmp", @"image/x-bmp", @"image/x-xbitmap", @"image/x-win-bitmap"]];
                        jsonResponseSerializer.acceptableContentTypes = jsonAcceptContentTypes;
                        self.responseSerializer = jsonResponseSerializer;
                        
    return [self dataTaskWithHTTPMethod:method URLString:url parameters:parameters uploadProgress:uploadProgress downloadProgress:downloadProgress success:^(NSURLSessionDataTask *task, id responseObject) {
        dispatch_async(dispatch_get_main_queue(), ^{
            complatedblock(responseObject,task,YES);
        });
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            complatedblock(nil,task,NO);
        });
    }];
    
}


@end
