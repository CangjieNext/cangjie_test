// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// A const function initializer is not a RulesChecking-time value-flow fact.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

const func currentValue(): Int64 {
    1
}

main() {
    const value = currentValue()
    if (value < 0) {
        println("not diagnosed before CTFE")
    }
}

/* SCAN
*/
