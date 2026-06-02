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

extend<T> Array<T> <: I<T> {
    func foo(end: Int64) {
        return this[0..end + 1]
    }

    public func foo(index: Int64, a: T): Unit {
        this[index] = a
    }
}

interface I<T> {
    func foo(index: Int64, a: T): Unit
}

main() {
    var a = [0]
    a.foo(0, 1)
    return [1].foo(0)[0] - 1
}
