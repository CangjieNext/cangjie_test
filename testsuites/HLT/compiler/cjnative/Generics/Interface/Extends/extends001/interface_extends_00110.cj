/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_args

interface A<X> {
    static func foo<Y>(a: Y): Y {
        a
    }
}

interface B <: A<Int64> {}

interface C<X> <: A<Int64> {}

interface D<X> <: A<X> {}

interface E<X, Y> <: A<X> {}

main() {
    if (A<Int64>.foo<Int64>(0)
        + B.foo<Int64>(1)
        + C<Int32>.foo<Int64>(2)
        + D<Int64>.foo<Int64>(3)
        + E<Int32, Int32>.foo<Int64>(4) != 10) {
        return 1
    }
    return 0
}
