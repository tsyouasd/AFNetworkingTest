//
//  NetOperation.m
//  NetworkProject
//
//  Created by JordanCZ on 16/5/30.
//  Copyright © 2016年 JordanCZ. All rights reserved.
//

#import "NetOperation.h"

@interface NetOperation ()

@property (nonatomic, getter = isFinished, readwrite)  BOOL finished;
@property (nonatomic, getter = isExecuting, readwrite) BOOL executing;

@end

@implementation NetOperation
@synthesize finished = _finished;
@synthesize executing = _executing;



- (id)init {
    self = [super init];
    if (self) {
        _finished  = NO;
        _executing = NO;
    }
    return self;
}

- (void)start{
    if ([self isCancelled]) {
        self.finished = YES;
        return;
    }
    self.executing = YES;
    [self main];
}

- (void)main{
    
}

- (void)completeOperation {
    self.executing = NO;
    self.finished  = YES;
}

#pragma mark - NSOperation methods

- (BOOL)isAsynchronous {
    return YES;
}

- (BOOL)isExecuting {
    @synchronized(self) {
        return _executing;
    }
}

- (BOOL)isFinished {
    @synchronized(self) {
        return _finished;
    }
}

- (void)setExecuting:(BOOL)executing {
    if (_executing != executing) {
        [self willChangeValueForKey:@"isExecuting"];
        @synchronized(self) {
            _executing = executing;
        }
        [self didChangeValueForKey:@"isExecuting"];
    }
}

- (void)setFinished:(BOOL)finished {
    [self willChangeValueForKey:@"isFinished"];
    @synchronized(self) {
        if (_finished != finished) {
            _finished = finished;
        }
    }
    [self didChangeValueForKey:@"isFinished"];
}

@end
