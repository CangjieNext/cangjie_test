/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: caserunner.cj
// EXEC: %compiler %cmp_opt %f caserunner.cj -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan-not AssertionError
// ASSERT: scan-not Exception
import std.math.*

main() {
    var m: Int64 = 0b111111111111111111111111111111111111111111111111111111111111101
    CaseRunner<Int64>().runCases(
        [(leadingZeros(m), 0)],
        description: "不连续0，不在首位"
    )
    var n: Int64 = 0b111111111111111111111111111111111111111111111111111111111111111
    CaseRunner<Int64>().runCases(
        [(trailingZeros(n), 0)],
        description: "全1"
    )
    return 0
}
