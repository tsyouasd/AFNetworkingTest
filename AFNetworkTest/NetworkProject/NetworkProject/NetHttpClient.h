//
//  NetHttpClient.h
//  NetworkProject
//
//  Created by JordanCZ on 16/5/25.
//  Copyright © 2016年 JordanCZ. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^NetHttpClientComplateBlock)(NSDictionary *responseData,NSURLSessionDataTask *operationTask,BOOL isSuccess);
@interface NetHttpClient : AFHTTPSessionManager

+ (instancetype)sharedClient;



@end
