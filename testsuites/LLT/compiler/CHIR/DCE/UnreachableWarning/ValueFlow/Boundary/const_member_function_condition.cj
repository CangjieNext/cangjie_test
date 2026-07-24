// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// A const instance member call is not evaluated during RulesChecking.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

struct Threshold {
    const Threshold(let value: Int64) {}

    const func isNegative(): Bool {
        value < 0
    }
}

main() {
    const threshold = Threshold(1)
    if (threshold.isNegative()) {
        println("not diagnosed before CTFE")
    }
}

/* SCAN
*/
