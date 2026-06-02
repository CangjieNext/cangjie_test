/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: caserunner.cj
// EXEC: %compiler %cmp_opt %f caserunner.cj -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan-not AssertionError
// ASSERT: scan-not Exception
import std.math.*

main() {
    CaseRunner<Bool>().runCasesTrue(
        [
            nan16.isNaN(),
            (-nan16).isNaN(),
            nan32.isNaN(),
            (-nan32).isNaN(),
            nan64.isNaN(),
            (-nan64).isNaN()
        ],
        description: "入参是NaN"
    )
    CaseRunner<Bool>().runCasesTrue(
        [
            Float16(0).isNaN(),
            Float32(0).isNaN(),
            Float64(0).isNaN()
        ],
        description: "入参不是NaN",
        checktype: "AssertFalse"
    )

    return 0
}
