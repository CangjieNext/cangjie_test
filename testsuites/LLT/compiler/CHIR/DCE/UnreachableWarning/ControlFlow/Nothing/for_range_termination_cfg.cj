// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify a range-for body return closes its unreachable CFG continuation.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func returnFromRange(shouldReturn: Bool): Int64 {
    for (_ in 0..1) {
        if (shouldReturn) {
            return 1
        }
    }
    0
}

main() {
    println(returnFromRange(true))
    println(returnFromRange(false))
}

/* SCAN
*/
