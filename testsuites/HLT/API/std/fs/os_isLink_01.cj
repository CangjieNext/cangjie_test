/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: caserunner.cj test_fj.txt test_fj_notnull.txt
// (not Windows) EXEC-PIPE: rm -rf a/b;mkdir -p a/b
// (not Windows) EXEC-PIPE: rm -rf dir;mkdir dir
// (not Windows) EXEC-PIPE: ln -s test_fj.txt  testlink
// (not Windows) EXEC-PIPE: %compiler %cmp_opt caserunner.cj -o %output %f
// (not Windows) RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// (not Windows) ASSERT: scan-not AssertionError

import std.posix.*

main() {
    CaseRunner<Bool>().runCasesTrue(
        [isLnk("testlink")],
        description: "是Link"
    )

    CaseRunner<Bool>().runCasesTrue(
        [
            isLnk("../test_dir"),
            isLnk("test_fj.txt"),
            isLnk("../test_notexists")
        ],
        description: "非Link",
        checktype: "AssertFalse"
    )
    CaseRunner<Bool>().runCasesTrue(
        [isLnk("a/b")],
        description: "非Link",
        checktype: "AssertFalse"
    )
    return 0
}
