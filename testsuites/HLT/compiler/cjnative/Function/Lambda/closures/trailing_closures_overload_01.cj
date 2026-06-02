/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f  -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    var a1 = B()
    var a2 = a1.foo(1, {x: Int64 => x + 1})
    if (a2 != 3) {
        return 1
    }
    var a3 = a1.foo(1) {x: Int64 => x + 1}
    if (a3 != 3) {
        return 1
    }
    return 0
}

open class A {
    public var a: Int32 = 1
    public open func foo(a: Int64, fn: (Int64) -> Int64) {
        return fn(a)
    }
}

class B <: A {
    public var b: Int32 = 2
    public override func foo(a: Int64, fn: (Int64) -> Int64) {
        return fn(a) + 1
    }
}
