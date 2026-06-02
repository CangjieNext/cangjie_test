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

open class X {}

open class Y <: X {}

class A<T> {}

extend<T> A<T> where T <: X {
    func f1(a: Int64): Int64 {
        return a
    }
}

extend<T> A<T> where T <: Y {
    func f2(a: Int64): Int64 {
        return a + 1
    }
    func f3(): Int64 {
        var res = 1 |> f1 |> f2
        return res
    }
}

main(): Int64 {
    var res = A<Y>().f3()
    if (res == 2) {
        return 0
    }
    return 1
}
