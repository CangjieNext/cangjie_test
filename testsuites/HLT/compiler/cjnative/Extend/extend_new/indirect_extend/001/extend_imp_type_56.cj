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

type A<T, K> = classA<T, K>

interface I {
    func c() {
        2
    }
    func d() {
        true
    }
}

extend<T, K> A<T, K> <: I {
    public func c() {
        2
    }
    public func d() {
        true
    }
}

class classA<T, K> {
    public var a: T
    public var b: K
    public classA(var x: T, var y: K) {
        this.a = x
        this.b = y
    }
}

main(): Int64 {
    var a: A<Int64, Bool> = A<Int64, Bool>(A<Int64, Bool>(1, false).c(), A<Int64, Bool>(3, true).d())
    if (a.a == 2 && a.b) {
        return 0
    } else {
        return 1
    }
}
