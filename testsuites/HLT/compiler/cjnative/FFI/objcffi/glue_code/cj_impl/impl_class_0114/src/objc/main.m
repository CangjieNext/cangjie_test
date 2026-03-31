/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import "A.h"
#import "Opencls.h"
#import <Foundation/Foundation.h>

int main(int argc, char** argv) {
    @autoreleasepool {
        Opencls* n = [[Opencls alloc] init: 11];
        A* a = [A E];
        A* aoc = [A EOC: n];
        [aoc setStOC];

        // funcs with opencls in signature are not exposed
        // n = [A stF: n];
        // n = [a f: n];
        // n = [a implicitF: n];
        printf("in oc n.getV got %lld\n", [n getV]);

        printf("in oc A.stpOC got %lld\n", [[A stpOC] getV]);
        printf("in oc a.pOC got %lld\n", [[a pOC] getV]);
        printf("in oc aoc.pOC got %lld\n", [[aoc pOC] getV]);
    }
    return 0;
}
