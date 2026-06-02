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

enum Position<T, R> {
    Left(T)
    | Right(R)
    | Middle

    const func foo(a: Int64) {
        return a
    }

    static const func goo(b: String) {
        ""
    }
}

main(): Int64 {
    const a = Position<Int64, Int64>.Left(0)
    if (a.foo(1) == 1 && Position<UInt64, Int64>.goo("1") == "") {
        return 0
    }
    return 1
}
