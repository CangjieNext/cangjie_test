/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: caserunner.cj b file_02_01_cz.txt
// EXEC: %compiler %cmp_opt %f caserunner.cj -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan-not AssertionError
import std.io.*
import std.fs.*

main() {
    //If the Append file does not exist, a file is created. If the Append file does not exist, an exception is thrown.
    var file1 = File("./b/b_file_01_cz.txt", Append)
    var file2 = File("file_02_01_cz.txt", ReadWrite)
    CaseRunner<Bool>().runCasesTrue(
        [file1.canRead()],
        description: "File不可读",
        checktype: "AssertFalse"
    )
    CaseRunner<Bool>().runCasesTrue(
        [file2.canRead()],
        description: "File可读"
    )
    file1.close()
    file2.close()
    return 0
}
