/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

interface Number {
    operator func +(right: Number): Number
    func as_int64(): Int64
}

extend Int64 <: Number {
    public operator func +(right: Number): Number {
        this + right.as_int64()
        /* ~~~~ the `+` here is expected to be dispatched to the `+` operator
         * of the type Int64, yet this does not happen
         */
    }

    public func as_int64(): Int64 {
        this
    }
}

main() {
    /* The function do compiles, yet running the binary leads to a dead recursion. */
    let a: Number = 1;
    let b: Number = a + 1;
}
