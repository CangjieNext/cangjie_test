// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC: %frontendCompiler %dump-ir-to-screen %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex-not declare void @"_CNatat0A1_lIl2\[\]Hll"

struct A {
    public var a = 6
}

main() {
    var p = Array<A>(5, A())
    var x = A()
    x.a = 7
    p[3] = x

    var p1 = Array<Int64>(5, 0)
    p1[3] = 7
    if (p1[3] != 7 && p[3].a != 7) {
        return 1
    }
    println(p1[3])
    return 0
}
