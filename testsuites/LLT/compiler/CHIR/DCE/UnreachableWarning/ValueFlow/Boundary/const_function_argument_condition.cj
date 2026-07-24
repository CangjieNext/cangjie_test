// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// A const function with const arguments is not evaluated during RulesChecking.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

const func increment(value: Int64): Int64 {
    value + 1
}

main() {
    const input = 1
    const result = increment(input)
    if (result < 0) {
        println("not diagnosed before CTFE")
    }
}

/* SCAN
*/
