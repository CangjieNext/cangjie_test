// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

#import <Foundation/Foundation.h>

@interface M : NSObject

- (id)initWithValue:(int64_t) value;
- (id)initWithB:(M*)b;
- (id)initWithM:(M*)m andB:(BOOL)b;
- (id)initWithA:(M*)a andM:(M*)m;
@property (nonatomic, assign) int64_t value;

@end
