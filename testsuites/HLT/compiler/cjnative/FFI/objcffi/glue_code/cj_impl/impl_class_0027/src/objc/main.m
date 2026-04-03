/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import "S.h"
#import "NonOpen.h"
#import <Foundation/Foundation.h>

int main(int argc, char** argv) {
    @autoreleasepool {
        NonOpen* n = [[NonOpen alloc] init: 11];
        S* s = [[S alloc] init: n];

        n = [S stFoo: n];
        n = [s foo: n];
        n = [s implicitFoo: n];
        printf("in oc n.getV got %lld\n", [n getV]);

        [s.constNO f];
        [s.implicitNO f];
        [s.no f];
        [s.p f];
        [s.mutP f];

        [S.stConstNO f];
        [S.stNO f];
        [S.stP f];
        [S.stMutP f];
    }
    return 0;
}
