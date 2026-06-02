/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: pkg1 pkg2
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg1/a.cj -o pkg1.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg2/b.cj pkg1.%middle -o pkg2.%middle
// EXEC: %compiler %cmp_opt %f pkg1.%middle pkg2.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import pkg1.*
import pkg2.*

main() {
    var en1: enum1<Int64> = enum1<Int64>.B(enum1<Int64>.A.foo2(enum1<Int64>.A.foo1()))
    var en2: enum2<Int64> = enum2<Int64>.B(enum2<Int64>.A.foo2(enum2<Int64>.A.foo1()))
    var en3: enum3<Int64> = enum3<Int64>.B(enum3<Int64>.A.foo2(enum3<Int64>.A.foo1()))

    var e1 = match (en1) {
        case B(x) => x
        case _ => UIntNative(0)
    }
    var e2 = match (en2) {
        case B(x) => x
        case _ => UIntNative(0)
    }
    var e3 = match (en3) {
        case B(x) => x
        case _ => UIntNative(0)
    }

    if (e1 == 20 && e2 == 40 && e3 == 60) {
        return 0
    } else {
        return 1
    }
}
