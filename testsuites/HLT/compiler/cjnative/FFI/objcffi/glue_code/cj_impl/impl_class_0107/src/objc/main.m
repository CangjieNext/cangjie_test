/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import "A.h"
#import <Foundation/Foundation.h>

@interface M1 : A
@end
@implementation M1
@end
@interface M2 : A
- (void)f:(int64_t)p1;
@end
@implementation M2
- (void)f:(int64_t)p1 { printf("in oc, %lld\n", p1); }
@end
int main(int argc, char** argv) {
    @autoreleasepool {
        A* a1 = [[A alloc] init];
        A* a2 = [[M1 alloc] init];
        M1* a3 = [[M1 alloc] init];
        A* a4 = [[M2 alloc] init];
        M2* a5 = [[M2 alloc] init];
        [a1 f: 1];
        [a2 f: 1];
        [a3 f: 1];
        [a4 f: 1];
        [a5 f: 1];
    }
    return 0;
}
