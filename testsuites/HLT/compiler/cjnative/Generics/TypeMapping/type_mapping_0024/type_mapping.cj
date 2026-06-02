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

interface I<T> {
    func test(a: T): Int64 {
        return 0
    }
}

interface I2<T, V> <: I<T> & I<V> {}

class A <: I2<(Int64, Float64), Float64> {}

extend A <: I2<(Float64, Int64), Int64> {}

extend A <: I2<A, I<Int64>> {}

main() {
    var a = A()
    return a.test(1) + a.test(1.0) + a.test(a) + a.test((1, 1.0))
}
