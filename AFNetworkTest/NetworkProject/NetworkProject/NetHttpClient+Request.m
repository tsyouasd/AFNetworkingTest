//
//  NetHttpClient+Request.m
//  NetworkProject
//
//  Created by JordanCZ on 16/5/30.
//  Copyright © 2016年 JordanCZ. All rights reserved.
//

#import "NetHttpClient+Request.h"

@implementation NetHttpClient (Request)

- (void)getRequestWithUrl:(NSString *)url
               Parameters:(nullable NSDictionary *)parameters
            complateBlock:(nullable NetHttpClientComplateBlock)complatedBlock{
     [self sentRequestWithMethods:NetRequestMethodPost  Url:url Parameters:parameters EntityClass:nil complateBlock:complatedBlock];
}

- (void)sentRequestWithMethods:(NetRequestMethod)requestMethod
                           Url:(NSString *)url
                    Parameters:(NSDictionary *)parameters
                   EntityClass:(Class)entityClass
                 complateBlock:(NetHttpClientComplateBlock)completedBlock{
    NSString  *method = @"POST";
    if (requestMethod == NetRequestMethodGet) {
        method = @"GET";
    }
    else if(requestMethod == NetRequestMethodHead){
        method = @"HEAD";
    }
    self.operationQueue.maxConcurrentOperationCount = 2;
    AFNetSessionOperation  *operation = [[AFNetSessionOperation alloc] init];
    NSURLSessionDataTask *task = [self sendRequestWithMethod:method URLString:url parameters:parameters completedBlock:^(NSDictionary *responseData, NSURLSessionDataTask *operationTask, BOOL isSuccess) {
        completedBlock(responseData,operationTask,isSuccess);
        [operation completeOperation];
    }];
    [task resume];
    operation.task = task;
    
    [self.operationQueue addOperation:operation];
}



@end
