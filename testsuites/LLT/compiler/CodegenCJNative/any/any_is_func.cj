// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

let f1: Any = {a: Int64, b: Int64 => a + b}

main(): Int64 {
    var result: Int64 = 0

    if (!({op1: Int32, op2: Int32 => op1 + op2} is Any)) {
        result |= 1
    }

    if (!({=> 10} is Any)) {
        result != 1 << 1
    }

    return result
}
