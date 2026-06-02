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

class A<K, T> where T <: HashMap<K, K> {
    public func test(x: Int64): Int64 {
        return x
    }
}

main(): Int64 {
    var a = A<Int64, HashMap<Int64, Int64>>()
    if (a.test(4) == 4) {
        return 0
    }
    return 1
}
