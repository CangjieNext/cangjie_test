// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
#import "M.h"
#import <memory.h>

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
  return [[NSString stringWithFormat:@"%s%s", first, second] UTF8String];
}

@end
