//
//  AFNetSessionOperation.m
//  NetworkProject
//
//  Created by JordanCZ on 16/5/30.
//  Copyright © 2016年 JordanCZ. All rights reserved.
//

#import "AFNetSessionOperation.h"

@interface AFNetSessionOperation ()


@end

@implementation AFNetSessionOperation



- (void)main {
    [self.task resume];
}

- (void)completeOperation {
    self.task = nil;
    [super completeOperation];
}

- (void)cancel {
    [self.task cancel];
    [super cancel];
}

@end
