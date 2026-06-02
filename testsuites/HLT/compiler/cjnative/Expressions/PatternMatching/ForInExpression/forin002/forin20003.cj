/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.collection.*

class C1 {
    let v1 = 0
    const init(a: Int64) {}
}

open class C2<T> where T <: ToString {
    init(a: T) {}
}

main() {
    let arr1 = ArrayList<C1>([C1(0), C1(1), C1(2)])
    for (ele in arr1) {
        if (ele.v1 != 0) {
            throw Exception("illegal value")
        }
    }
    let arr2 = ArrayList<C2<Int64>>([C2<Int64>(1), C2<Int64>(9223372036854775807)])
    for (ele in arr2) {
        ele
    }
    0
}
