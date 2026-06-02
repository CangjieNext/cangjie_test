/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: caserunner.cj test_fj.txt test_fj_notnull.txt
// EXEC-PIPE: mkdir -p a/b
// EXEC-PIPE: mkdir dir
// EXEC-PIPE: %compiler %cmp_opt caserunner.cj -o %output %f
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan-not AssertionError

import std.posix.*

main() {
    CaseRunner<Bool>().runCasesTrue(
        [isReg("test_fj.txt")],
        description: "常规文件"
    )
    CaseRunner<Bool>().runCasesTrue(
        [
            isReg("./test_dir"),
            isReg("./test_notexists")
        ],
        description: "非常规文件",
        checktype: "AssertFalse"
    )
    CaseRunner<Bool>().runCasesTrue(
        [isReg("a/b")],
        description: "非常规文件2",
        checktype: "AssertFalse"
    )
    return 0
}
