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

class A<T> {
    A(var a: T) {}
}

extend<T> A<T> <: I<T> {
    func foo<T>() {
        a
    }

    func foob<T>(b: T) {
        return b
    }
}

interface I<T> {}

main() {
    return A(-1).foo<Int64>() + A("1").foob(1)
}
