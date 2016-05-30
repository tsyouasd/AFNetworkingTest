//
//  UtilsMacro.h
//  NetworkProject
//
//  Created by JordanCZ on 16/5/30.
//  Copyright © 2016年 JordanCZ. All rights reserved.
//

#ifndef UtilsMacro_h
#define UtilsMacro_h

//Block Self
#define WEAKSELF typeof(self) __weak weakSelf = self;
#define STRONGSELF typeof(weakSelf) __strong strongSelf = weakSelf;
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

// 屏幕宽度
#define kScreenWidth ((CGRectGetWidth([UIScreen mainScreen].bounds) > CGRectGetHeight([UIScreen mainScreen].bounds))?(CGRectGetHeight([UIScreen mainScreen].bounds)):(CGRectGetWidth([UIScreen mainScreen].bounds)))

// 屏幕高度
#define kScreenHeight ((CGRectGetWidth([UIScreen mainScreen].bounds) > CGRectGetHeight([UIScreen mainScreen].bounds))?(CGRectGetWidth([UIScreen mainScreen].bounds)):(CGRectGetHeight([UIScreen mainScreen].bounds)))

#endif /* UtilsMacro_h */
