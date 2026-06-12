// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
#import "M.h"
#import <memory.h>
#include <stddef.h>
#include <stdlib.h>

@implementation M

- (char *)objCProp {
  return self->objCField;
}

- (void)setObjCProp:(char *)objCProp {
  free(self->objCField);
  self->objCField = objCProp;
}

- (id)init {
  if (self = [super init]) {
    self->objCField = "Hello, Objective-C!";
    printf("objc: [M init]\n");
  }

  return self;
}

- (char *)concatFirst:(const char *)first andSecond:(const char *)second {
  NSString *nsConcatenated = [NSString stringWithFormat:@"%s%s", first, second];
  size_t bytes =
      [nsConcatenated lengthOfBytesUsingEncoding:NSUTF8StringEncoding] + 1; // extra byte for \0
  char *buf = malloc(bytes);
  [nsConcatenated getCString:buf maxLength:bytes encoding:NSUTF8StringEncoding];
  return buf;
}

@end
