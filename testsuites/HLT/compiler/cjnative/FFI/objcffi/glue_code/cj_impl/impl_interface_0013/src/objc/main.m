/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import "I.h"
#import "S.h"
#import <Foundation/Foundation.h>

@interface M : NSObject <I>
@end

@implementation M
- (void)f {
    printf("in oc f\n");
}
@end

int main(int argc, char** argv) {
    @autoreleasepool {
        id<I> a = [[M alloc] init];
        S* s = [[S alloc] init: a];
        a = [S f2: a];
        a = [s f1: a];
        a = [s implicitf1: a];
        a = [s mutf1: a];
        [a f];

        [s.i f];
        [s.constI f];
        [s.p f];
        [s.mutP f];

        [S initStI: a];
        [S.stI f];
        [S.stConstI f];
        [S.stP f];
        [S.stMutP f];
    }
    return 0;
}
