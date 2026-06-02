// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix | compare %f
// ASSERT: scan yes1\nyes2
// ASSERT: scan-not oh no

interface I1<T> {}

interface I2<T> {}

interface I3 {}

interface I4 {}

interface I5 {}

open class CBase<T> {}

class CA<T> <: CBase<T> & I1<T> {}

extend<T> CA<T> <: I5 where T <: I4 {}

extend CA<Bool> <: I4 {}

extend CA<Float64> <: I2<Bool> {}

extend<T> CBase<T> <: I3 where T <: I3 {}

extend Float64 <: I3 {}

extend Bool <: I4 {}

main() {
    CA<Bool>()
    let ins: Any = CA<Float64>()
    if (ins is I2<Bool>) {
        println("yes1")
    }
    if (ins is I3) {
        println("yes2")
    }
    if (ins is I4) {
        println("oh no")
    }
    0
}
