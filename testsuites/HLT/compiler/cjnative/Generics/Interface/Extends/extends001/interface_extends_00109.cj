/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

interface A<X> {
    static func foo(a: X): X {
        a
    }
}

interface B <: A<Int64> {}

interface C<X> <: A<Int64> {}

interface D<X> <: A<X> {}

interface E<X, Y> <: A<X> {}

main() {
    // E<Int32,Int32> return type is Int32, not match.
    if (A<Int64>.foo(0) + B.foo(1) + C<Int32>.foo(2) + D<Int64>.foo(3) + E<Int32, Int32>.foo(4) != 10) {
        return 1
    }
    return 0
}
// ASSERT: scan sema_invalid_binary_expr
