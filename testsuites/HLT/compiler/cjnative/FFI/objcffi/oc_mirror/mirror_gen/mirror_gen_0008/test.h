/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import <Foundation/Foundation.h>

@interface A : NSObject
@end

@protocol B <NSObject>
@end

typedef struct {
} S;

@interface test : NSObject
- (A*)f1WithA:(A*)a andB:(id<B>)b andS:(S)s;
- (id<B>)f2WithA:(A*)a andB:(id<B>)b andS:(S)s;
- (S)f3WithA:(A*)a andB:(id<B>)b andS:(S)s;
@end
