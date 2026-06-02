/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: p1
// EXEC: %compiler %cmp_opt %compile_lib_opt ./p1/*.cj -o a.%middle
// EXEC: %compiler %cmp_opt a.%middle %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import p1.A
import p1.B as Boo
import p1

main(): Int64 {
    var a1 = A<Int32>()
    if (a1.goo(1) != 1) {
        return 1
    }
    var a2 = Boo<Int32>(Int32(1))
    if (a2.goo() != 2) {
        return 1
    }
    return 0
}

extend<T> p1.A<T> {
    public func goo(x: T) {
        return x
    }
}

extend<T> Boo<T> <: I {}

interface I {
    func goo() {
        return 2
    }
}
