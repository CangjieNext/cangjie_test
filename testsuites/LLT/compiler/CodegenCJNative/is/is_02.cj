// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix | compare %f
// ASSERT: scan-not oh no1
// ASSERT: scan-not oh no2

interface I1<T> {}

interface I3 {}

interface I2<T> {}

open class CBase<T> {}

class CA<T> <: CBase<Int64> & I1<T> {}

extend CBase<Bool> <: I2<Bool> {}

extend<T> CBase<T> <: I3 where T <: I3 {}

main() {
    let ins: Any = CA<Float64>()
    if (ins is I2<Bool>) {
        println("oh no1")
    }
    if (ins is I3) {
        println("oh no2")
    }
    0
}
