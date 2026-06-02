/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: caserunner.cj file_02_01_cz.txt
// EXEC: %compiler %cmp_opt %f caserunner.cj -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan-not AssertionError
import std.io.*
import std.fs.*

main() {
    var fileName = "file_02_01_cz.txt"
    var file1 = File(fileName, ReadWrite)
    CaseRunner<Bool>().runCasesTrue(
        [file1.canWrite()],
        description: "File可写"
    )
    file1.close()
    var file2 = File(fileName, Read)
    CaseRunner<Bool>().runCasesTrue(
        [file2.canWrite()],
        description: "File不可写",
        checktype: "AssertFalse"
    )
    file2.close()
    return 0
}
