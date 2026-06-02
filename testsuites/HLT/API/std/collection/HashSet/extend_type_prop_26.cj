/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f  -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.collection.*

main(): Int64 {
    var a = HashSet<Int64>([1, 2])
    if (a.n != 1) {
        return 1
    }
    a.m = 10
    if (a.m != 2) {
        return 2
    }
    return 0
}

extend<T> HashSet<T> where T <: Hashable & Equatable<T> {
    public mut prop m: Int64 {
        get() {
            return 2
        }
        set(v) {}
    }
    public prop n: Int64 {
        get() {
            return 1
        }
    }
}
