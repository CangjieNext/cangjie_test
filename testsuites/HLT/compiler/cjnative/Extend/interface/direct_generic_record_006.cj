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

struct A<T> {
    A(var a: T) {}
}

extend<T> A<T> <: I<T> {
    func foo<T>() {
        return a
    }

    public func foob<T>(b: T) {
        return b
    }

    public func foob(b: T) {
        return a
    }
}

interface I<T> {
    func foob(b: T) {
        return b
    }
}

main() {
    return A(-1).foo<Int64>() + A("1").foob(1) + A(0).foob(3)
}
