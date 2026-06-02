/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: caserunner.cj test_fj.txt test_fj_notnull.txt
// EXEC-PIPE: %compiler %cmp_opt caserunner.cj -o %output %f
// RUN-EXEC-PIPE: %run %run_opt %output %run_args|compare %f
// ASSERT: scan-not AssertionError
import std.posix.*

main(): Int64 {
    CaseRunner<Int32>().runCases(
        [
            (access("test_fj.txt", Int32(4)), Int32(0)),
            (access("test_fj.txt", Int32(2)), Int32(0)),
            (access("test_fj.txt", Int32(1)), Int32(-1)),
            (access("test_fj.txt", Int32(0)), Int32(0))
        ],
        description: "access()函数入参是已存在，但内容为空的文件"
    )
    CaseRunner<Int32>().runCases(
        [
            (access("test_fj1.txt", Int32(4)), Int32(-1)),
            (access("test_fj1.txt", Int32(2)), Int32(-1)),
            (access("test_fj1.txt", Int32(1)), Int32(-1)),
            (access("test_fj1.txt", Int32(0)), Int32(-1))
        ],
        description: "access()函数入参是不存在的文件"
    )
    CaseRunner<Int32>().runCases(
        [
            (access("", Int32(4)), Int32(-1)),
            (access("", Int32(2)), Int32(-1)),
            (access("", Int32(1)), Int32(-1)),
            (access("", Int32(0)), Int32(-1))
        ],
        description: "access()函数入参文件是空路径"
    )
    CaseRunner<Int32>().runCases(
        [
            (access("test_fj_notnull1.txt", Int32(4)), Int32(-1)),
            (access("test_fj_notnull1.txt", Int32(2)), Int32(-1)),
            (access("test_fj_notnull1.txt", Int32(1)), Int32(-1)),
            (access("test_fj_notnull1.txt", Int32(0)), Int32(-1))
        ],
        description: "access()函数入参是存在的文件，且文件内容不为空"
    )
    return 0
}
