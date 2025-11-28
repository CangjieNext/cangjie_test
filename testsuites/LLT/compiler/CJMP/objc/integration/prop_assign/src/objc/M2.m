// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

#import "M2.h"
#import "M1.h"

@implementation M2

- (id)init {
  if (self = [super init]) {
    v = [[M1 alloc] init:1];
    self.p = [[M1 alloc] init:2];
  }
  return self;
}
- (id<I>)g1 {
  return [[M1 alloc] init:3];
}
- (void)g2:(id<I>)a {
  printf("in objc p1: %lld\n", a.p1);
  [a f1];
}
@end
