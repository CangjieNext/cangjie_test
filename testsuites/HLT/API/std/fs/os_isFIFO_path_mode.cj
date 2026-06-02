/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: caserunner.cj a
// (not Windows) EXEC-PIPE: %compiler %cmp_opt caserunner.cj -o %output %f
// (not Windows) EXEC-PIPE: mkfifo test_fifo
// (not Windows) RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// (not Windows) ASSERT: scan-not AssertionError
import std.posix.*

//func isFIFO(path: String, mode: Int32): Bool
main() {
    CaseRunner<Bool>().runCasesTrue(
        [isFIFO("./test_fifo")],
        description: "isFIFO入参测试"
    )

    CaseRunner<Bool>().runCasesTrue(
        [isFIFO("./a")],
        description: "isFIFO入参测试",
        checktype: "AssertFalse"
    )
    return 0
}
