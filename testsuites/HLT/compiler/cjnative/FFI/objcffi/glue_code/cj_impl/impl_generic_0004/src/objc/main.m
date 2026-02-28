/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import "AInt64.h"
#import <Foundation/Foundation.h>

@interface M : NSObject <AInt64>
@end

@implementation M
- (int64_t)f:(int64_t)a {
    return a;
}
@end

int main(int argc, char** argv) {
    @autoreleasepool {
        M* a = [[M alloc] init];
        printf("in oc, %lld\n", [a f: 1]);
    }
    return 0;
}
