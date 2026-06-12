// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
#import "A.h"

int main(int argc, char **argv) {
  @autoreleasepool {
    A *a = [[A alloc] init];
    char *first = "The message is ";

    char *concatenated = [a concatFirst:first andSecond:a.cjProp];
    printf("objc: concatenated from cj \"%s\"\n", concatenated);
    free(concatenated);

    [a testConcatThroughOC];
  }
  return 0;
}
