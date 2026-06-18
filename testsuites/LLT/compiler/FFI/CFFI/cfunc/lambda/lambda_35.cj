// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %output 2>&1 | compare %f

interface I1<T1> {
    static func g<T2>(): Unit { println("g in I1") }
}

interface I2 <: I1<Int64> {
    static func f() {
        let fn: CFunc<()->Unit> = { =>
            g<Int32>() // equal to I1<Int64>.g<Int32>()
        }
        unsafe{fn()}
    }
}

main() {
    I2.f()
}

/* SCAN
g in I1
*/
