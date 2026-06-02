/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan sema_undeclared_identifier

open class X {}

open class Y <: X {}

class A<T> {}

extend<T> A<T> where T <: X {
    func f1(a: Int64): Int64 {
        return a
    }
    func f3(): Int64 {
        var res = 1 |> f2 |> f1
        return res
    }
}

extend<T> A<T> where T <: Y {
    func f2(a: Int64): Int64 {
        return a + 1
    }
}

main(): Int64 {
    var res = A<Y>().f3()
    if (res == 2) {
        return 0
    }
    return 1
}
