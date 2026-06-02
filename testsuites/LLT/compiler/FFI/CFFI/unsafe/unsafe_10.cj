// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan B::[](index: UInt32, value!: Int64), value = 1
// ASSERT: scan b.n = 1
// ASSERT: scan B::[](index1: UInt32, index2: Int64, value!: Int64), value = 2
// ASSERT: scan b.n = 2

class B {
    var n = 0

    public unsafe operator func[](index: UInt32, value!: Int64): Unit {
        println("B::[](index: UInt32, value!: Int64), value = ${value}")
        n = value
    }

    public unsafe operator func[](index1: UInt32, index2: Int64, value!: Int64): Unit {
        println("B::[](index1: UInt32, index2: Int64, value!: Int64), value = ${value}")
        n = value
    }
}

unsafe main() {
    let b = B()
    b[0] = 1
    println("b.n = ${b.n}")

    b[0, 1] = 2
    println("b.n = ${b.n}")
}
