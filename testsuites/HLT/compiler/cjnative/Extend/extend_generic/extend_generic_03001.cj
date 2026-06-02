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

interface Y {}

class C <: X & Y {
    let z: Int64 = 0
}

class A<T, K> where T <: X, K <: Y {}

extend<U> A<U, U> {
    public func f1(a: U): U {
        return a
    }
}

main(): Int64 {
    var res = A<C, C>().f1(C()).z
    if (res == 0) {
        return 0
    }
    1
}
