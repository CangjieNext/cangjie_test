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
    var fs3 = File("b_file_bcz_01.txt", Write)
    var b = Array<UInt8>(10, {i => 1})
    var b1 = Array<UInt8>(9, {i => 1})
    var b2 = Array<UInt8>(11, {i => 1})
    var b3 = Array<UInt8>(1, {i => 1})
    var readnum1 = fs.read(b)
    fs.seek(SeekPosition.Begin(0))
    var readnum2 = fs.read(b1)
    fs.seek(SeekPosition.Begin(0))
    var readnum3 = fs.read(b2)
    fs.seek(SeekPosition.Begin(0))
    var readnum4 = fs.read(b3)
    fs.seek(SeekPosition.Begin(0))
    var readnum6 = fs1.read(b)
    CaseRunner<Int64>().runCases(
        [
            (readnum1, 10),
            (readnum2, 9),
            (readnum3, 10),
            (readnum4, 1),
            (readnum6, 0)
        ],
        description: "read的入参测试"
    )
    fs.close()
    fs1.close()
    fs3.close()
    return 0
}
