// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

#import "Base.h"

@implementation Base
- (id)init {
    printf("objc: Base()\n");
    if (self = [super init]) {
        return self;
    }
    return 0;
}
- (BOOL)bar {
    printf("objc: bar()\n");
    return YES;
}
- (int64_t)foo:(int64_t)i {
    printf("objc: foo(%ld)\n", i);
    return i + 1;
}
@end
