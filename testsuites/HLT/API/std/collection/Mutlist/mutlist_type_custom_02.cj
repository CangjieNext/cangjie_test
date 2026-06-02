/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.collection.*

main(): Int64 {
    var rs = ArrayList<Mut<Int32>>([Mut<Int32>()])
    var r1 = ArrayList<ArrayList<Mut<Int32>>>([rs])
    var r2 = ArrayList<ArrayList<Mut<Int32>>>([ArrayList<Mut<Int32>>([Mut<Int32>()])])
    if (r1.size != 1) {
        return 1
    }
    if (r2.size != 1) {
        return 2
    }
    if (r1[0][0].test(5) != Int32(5)) {
        return 3
    }
    if (r2[0][0].test(5) != Int32(5)) {
        return 4
    }
    return 0
}

class Mut<T> {
    public func test(x: T): T {
        return x
    }
}
