// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC:%compiler %debugCHIROpt %cmp_opt %enableO2 %f -o %output 2>&1 | compare %f
// (DEBUG_OPTION)EXEC:%run %run_opt %output

struct S {
    var a: Int64 = 3
}

var p = S()

main() {
    p.a = 7
    p = S()
    var q = S()
    var q2 = p.a
    let res1 = q.a == q2 // [true, false]
    q = p
    let res2 = q.a == q2 // [true, false]
    ()
}

// ASSERT: regex-not Assertion .* failed
// ASSERT: scan-not core dumped
// ASSERT: regex-not \[RangeAnalysis\].*\[21,16\]
// ASSERT: regex-not \[RangeAnalysis\].*\[23,16\]
