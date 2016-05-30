//
//  AFNetSessionOperation.h
//  NetworkProject
//
//  Created by JordanCZ on 16/5/30.
//  Copyright © 2016年 JordanCZ. All rights reserved.
//

#import "NetOperation.h"

@interface AFNetSessionOperation : NetOperation

@property (nonatomic, strong,nullable) NSURLSessionTask *task;

@end
