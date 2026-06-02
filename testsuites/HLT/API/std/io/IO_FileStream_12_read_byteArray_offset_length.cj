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
    var fs = File("./b/b_file_read.txt", ReadWrite)
    var fs1 = File("b_file_bcz.txt", ReadWrite)
    var fs2 = File("b_file_bcz_01.txt", Write)
    var b = Array<UInt8>(20, {i => 1})
    var readnum2 = fs.read(b.slice(0, 15))
    fs.seek(SeekPosition.Begin(0))
    var readnum3 = fs.read(b.slice(0, 1))
    fs.seek(SeekPosition.Begin(0))
    var readnum4 = fs.read(b.slice(0, 5))
    fs.seek(SeekPosition.Begin(0))
    var readnum5 = fs.read(b.slice(0, 10))
    CaseRunner<Int64>().runCases(
        [
            (readnum2, 10),
            (readnum3, 1),
            (readnum4, 5),
            (readnum5, 10)
        ],
        description: "read的入参测试"
    )
    fs.close()
    fs1.close()
    fs2.close()
    return 0
}
