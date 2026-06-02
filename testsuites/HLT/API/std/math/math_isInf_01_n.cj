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
            inf16.isInf(),
            (-inf16).isInf(),
            inf32.isInf(),
            (-inf32).isInf(),
            inf64.isInf(),
            (-inf64).isInf()
        ],
        description: "入参是inf"
    )
    CaseRunner<Bool>().runCasesTrue(
        [
            Float16(0.0).isInf(),
            Float16(-0.0).isInf(),
            Float32(0.0).isInf(),
            Float32(-0.0).isInf(),
            Float64(0.0).isInf(),
            Float64(-0.0).isInf()
        ],
        description: "入参不是是inf",
        checktype: "AssertFalse"
    )
    return 0
}
