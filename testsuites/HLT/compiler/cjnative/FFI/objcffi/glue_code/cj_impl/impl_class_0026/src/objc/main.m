/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import "A.h"
#import "NonOpen.h"
#import <Foundation/Foundation.h>

int main(int argc, char** argv) {
    @autoreleasepool {
        NonOpen* n = [[NonOpen alloc] init: 11];
        A* a = [A E];
        A* ano = [A ENO: n];
        [ano setStNO];

        n = [A stF: n];
        n = [a f: n];
        n = [a implicitF: n];
        printf("in oc n.getV got %lld\n", [n getV]);

        printf("in oc A.stpNO got %lld\n", [[A stpNO] getV]);
        printf("in oc a.pNO got %lld\n", [[a pNO] getV]);
        printf("in oc ano.pNO got %lld\n", [[ano pNO] getV]);
    }
    return 0;
}
