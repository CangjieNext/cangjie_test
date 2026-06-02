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
            tan(inf16).isNaN(),
            tan(-inf16).isNaN(),
            tan(inf32).isNaN(),
            tan(-inf32).isNaN(),
            tan(inf64).isNaN(),
            tan(-inf64).isNaN()
        ],
        description: "入参是inf，返回值是nan"
    )
    return 0
}
