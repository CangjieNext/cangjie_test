/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import "A.h"
#import "S.h"
#import <Foundation/Foundation.h>

int main(int argc, char** argv) {
    @autoreleasepool {
        S* s = [[S alloc] init: 1];
        S* s7 = [[S alloc] init: 7];
        A* a = [A E2: s7];
        s = [a fooStruct: s];
        s = [a implicitFooStruct: s];
        s = [A stFooStruct: s];
        printf("in oc main, %lld\n", s.i64);
        printf("in oc main pS, %lld\n", a.pS.i64);
        printf("in oc main stpS, %lld\n", A.stpS.i64);
    }
    return 0;
}
