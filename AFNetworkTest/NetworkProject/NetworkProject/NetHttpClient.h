//
//  NetHttpClient.h
//  NetworkProject
//
//  Created by JordanCZ on 16/5/25.
//  Copyright © 2016年 JordanCZ. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSUInteger, NetRequestMethod) {
    NetRequestMethodGet,
    NetRequestMethodPost,
    NetRequestMethodHead
};


typedef void(^NetHttpClientComplateBlock)(NSDictionary *responseData,NSURLSessionDataTask *operationTask,BOOL isSuccess);
@interface NetHttpClient : AFHTTPSessionManager

+ (instancetype)sharedClient;

/**
 *  发送请求
 *
 *  @param method         POST, GET, HEAD
 *  @param url            请求URL
 *  @param parameters     参数请求
 *  @param completedBlock 回调
 */
- (NSURLSessionDataTask *)sendRequestWithMethod:(NSString *)method
                    URLString:(NSString *)url
                   parameters:(NSDictionary *)parameters
               completedBlock:(NetHttpClientComplateBlock)completedBlock;


@end
