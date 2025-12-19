// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

#import <Foundation/Foundation.h>

@interface M : NSObject {
@public
  int64_t a;
  double b;
}

- (id)initWithA:(int64_t)_a andB:(double)_b;

@end
