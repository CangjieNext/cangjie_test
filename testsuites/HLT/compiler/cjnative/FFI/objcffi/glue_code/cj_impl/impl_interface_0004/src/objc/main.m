/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import "I.h"
#import <Foundation/Foundation.h>

@interface M : NSObject <I>
@end

@implementation M
- (void)f: (int64_t)a: (bool)b: (int32_t)c {
    printf("in oc f, %lld, %s, %d\n", a, b?"true":"false", c);
}
@end

int main(int argc, char** argv) {
    @autoreleasepool {
        id<I> a = [[M alloc] init];
        [a f: 1: true: 2];
    }
    return 0;
}
