//
//  NetHttpClient+Request.h
//  NetworkProject
//
//  Created by JordanCZ on 16/5/30.
//  Copyright © 2016年 JordanCZ. All rights reserved.
//

#import "NetHttpClient.h"
#import "AFNetSessionOperation.h"
NS_ASSUME_NONNULL_BEGIN

@interface NetHttpClient (Request)

- (void)getRequestWithUrl:(NSString *)url
               Parameters:(nullable NSDictionary *)parameters
            complateBlock:(nullable NetHttpClientComplateBlock)complatedBlock;


@end
NS_ASSUME_NONNULL_END