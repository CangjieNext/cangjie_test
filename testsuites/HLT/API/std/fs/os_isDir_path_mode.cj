/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: caserunner.cj a
// EXEC-PIPE: %compiler %cmp_opt caserunner.cj -o %output %f
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan-not AssertionError
import std.posix.*

main() {
    CaseRunner<Bool>().runCasesTrue(
        [isDir("./a")],
        description: "isDir入参测试"
    )
    CaseRunner<Bool>().runCasesTrue(
        [isDir("./a/213456.txt")],
        description: "isDir入参测试",
        checktype: "AssertFalse"
    )
    return 0
}
