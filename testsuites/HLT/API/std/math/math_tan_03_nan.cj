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
    CaseRunner<Bool>().runCasesTrue(
        [
            tan(nan16).isNaN(),
            tan(-nan16).isNaN(),
            tan(nan32).isNaN(),
            tan(-nan32).isNaN(),
            tan(nan64).isNaN(),
            tan(-nan64).isNaN()
        ],
        description: "入参是nan，返回nan"
    )
    return 0
}
