/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: caserunner.cj b
// EXEC: %compiler %cmp_opt %f caserunner.cj -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan-not AssertionError
import std.io.*
import std.fs.*

main() {
    var fs = File("./b/b_file_write.txt", ReadWrite)
    fs.close()
    var fs1 = File("b_file_bcz.txt", ReadWrite)
    fs1.close()
    var fs2 = File("b_file_bcz_01.txt", Write)
    fs2.close()
    CaseRunner<Bool>().runCasesTrue(
        [
            fs.isClosed(),
            fs1.isClosed(),
            fs2.isClosed()
        ],
        description: "File调用close()测试"
    )

    return 0
}
