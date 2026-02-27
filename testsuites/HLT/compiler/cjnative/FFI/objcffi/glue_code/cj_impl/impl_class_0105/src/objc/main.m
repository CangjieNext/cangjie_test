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
- (id)init;
@end
@implementation M1
- (id)init { return [super init]; }
@end
@interface M2 : A
@end
@implementation M2
@end
int main(int argc, char** argv) {
    @autoreleasepool {
        A* a1 = [[A alloc] init: 1];
        A* a2 = [[M1 alloc] init];
        M1* a3 = [[M1 alloc] init: 1];
        A* a4 = [[M2 alloc] init: 1];
        M2* a5 = [[M2 alloc] init];
        A* a6 = [[A alloc] init];
    }
    return 0;
}
