/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f  -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    var a1 = B(1, {i => i * 2})
    if (a1.m != 2) {
        return 1
    }
    var a2 = B(1) {i => i * 2}
    if (a2.m != 2) {
        return 1
    }
    var a3 = B({i => i * 2})
    if (a3.m != 2) {
        return 1
    }
    var a4 = B() {}
    if (a4.m != 1) {
        return 1
    }
    return 0
}

class B {
    public var m: Int64 = 1
    public init(a: Int64, fn: (Int64) -> Int64) {
        m = fn(a)
    }
    public init(fn: (Int64) -> Int64) {
        m = fn(1)
    }
    public init(fn: () -> Unit) {
        m = 1
    }
    //init()(fn: ()->Unit) { m =  2 }

}
