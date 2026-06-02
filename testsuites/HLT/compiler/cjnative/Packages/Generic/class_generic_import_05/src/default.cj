/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: p1
// EXEC: %compiler %cmp_opt %compile_lib_opt ./p1/*.cj -o p1.%middle
// EXEC: %compiler %cmp_opt p1.%middle %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import p1.A
import p1.B as Boo
import p1

main(): Int64 {
    var a1 = C<Int32>(1)
    var a2 = D<Int32>(1)
    if (a1.a != 1) {
        return 1
    }
    if (a2.a != 1) {
        return 1
    }
    return 0
}

class C<T> <: p1.A<T> {
    public var a: T
    public init(x: T) {
        a = x
    }
}

class D<T> <: Boo<T> {
    public init(x: T) {
        super(x)
    }
}
