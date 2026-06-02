// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC: %compiler %debugCHIROpt %cmp_opt %f %enableO2 -o %output 2>&1 | compare %f
// (DEBUG_OPTION)EXEC: %run %run_opt %output 10000

import std.convert.*

main(args: Array<String>) {
    var sm = 0
    let sz = Int64.parse(args[0])
    let a = Array<Int64>(sz, {a => a})
    for (i in 0..a.size) {
        sm += a[i]
    }
    println(sm)
    0
}

// ASSERT: regex-not Assertion .* failed
// ASSERT: scan-not core dumped
// ASSERT: regex \[RangeAnalysis\].*\[17,9\]
// ASSERT: regex \[RangeAnalysis\].*\[16,15\]
