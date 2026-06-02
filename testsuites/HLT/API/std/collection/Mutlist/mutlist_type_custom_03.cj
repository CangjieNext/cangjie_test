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
    var rs = ArrayList<Mut>([subMut()])
    var r1 = ArrayList<ArrayList<Mut>>([rs])
    var r2 = ArrayList<ArrayList<Mut>>([ArrayList<Mut>([subMut()])])
    if (r1.size != 1) {
        return 1
    }
    if (r2.size != 1) {
        return 2
    }
    if ((r1[0][0] as subMut).getOrThrow().test(5) != Int16(5)) {
        return 3
    }
    if ((r2[0][0] as subMut).getOrThrow().test(5) != Int16(5)) {
        return 4
    }
    return 0
}

open class Mut {
    public func test(x: Int8): Int8 {
        return x
    }
}

class subMut <: Mut {
    public func test(x: Int16): Int16 {
        return x
    }
}
