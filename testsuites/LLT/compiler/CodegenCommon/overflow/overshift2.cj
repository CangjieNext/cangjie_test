// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %output
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex-auto ArithmeticException: Overshift: Negative shift count!

func foo(lhs: UInt8, rhs: Int16) {
    lhs << rhs
}

main(): Int64 {
    let lhs: UInt8 = 87
    let rhs: Int16 = -18949
    foo(lhs, rhs)
    return 0
}
