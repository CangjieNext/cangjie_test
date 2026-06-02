/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: caserunner.cj test_fj_notnull_0.txt test_fj_notnull_1.txt test_fj_notnull_2.txt test_fj_notnull_3.txt test_fj_notnull_4.txt test_fj_notnull_5.txt test_fj_notnull_6.txt test_fj_notnull_7.txt test_fj_notnull_8.txt test_fj_notnull_9.txt test_fj_notnull_10.txt test_fj_notnull_11.txt
// (not Windows) EXEC-PIPE: %compiler %cmp_opt caserunner.cj -o %output %f
// (not Windows) RUN-EXEC-PIPE: %run %run_opt %output %run_args
// (not Windows)EXEC-PIPE: %ls -l| %grep '\-r\-\-\-\-\-\-\-\-'| %grep 'test_fj_notnull_0.txt'
// (not Windows)EXEC-PIPE: %ls -l| %grep '\-\-w\-\-\-\-\-\-\-'| %grep 'test_fj_notnull_1.txt'
// (not Windows)EXEC-PIPE: %ls -l| %grep '\-\-\-x\-\-\-\-\-\-'| %grep 'test_fj_notnull_2.txt'
// (not Windows)EXEC-PIPE: %ls -l| %grep '\-rwx\-\-\-\-\-\-'| %grep 'test_fj_notnull_3.txt'
// (not Windows)EXEC-PIPE: %ls -l| %grep '\-\-\-\-r\-\-\-\-\-'| %grep 'test_fj_notnull_4.txt'
// (not Windows)EXEC-PIPE: %ls -l| %grep '\-\-\-\-\-w\-\-\-\-'| %grep 'test_fj_notnull_5.txt'
// (not Windows)EXEC-PIPE: %ls -l| %grep '\-\-\-\-\-\-x\-\-\-'| %grep 'test_fj_notnull_6.txt'
// (not Windows)EXEC-PIPE: %ls -l| %grep '\-\-\-\-rwx\-\-\-' | %grep 'test_fj_notnull_7.txt'
// (not Windows)EXEC-PIPE: %ls -l| %grep '\-\-\-\-\-\-\-r\-\-'| %grep 'test_fj_notnull_8.txt'
// (not Windows)EXEC-PIPE: %ls -l| %grep '\-\-\-\-\-\-\-\-w\-'| %grep 'test_fj_notnull_9.txt'
// (not Windows)EXEC-PIPE: %ls -l| %grep '\-\-\-\-\-\-\-\-\-x'| %grep 'test_fj_notnull_10.txt'
// (not Windows)EXEC-PIPE: %ls -l| %grep '\-\-\-\-\-\-\-rwx'|%grep 'test_fj_notnull_11.txt'

import std.posix.*

main(): Int64 {
    CaseRunner<Int32>().runCases(
        [
            (chmod("test_fj_notnull_0.txt", UInt32(S_IRUSR)), Int32(0)),
            (chmod("test_fj_notnull_1.txt", UInt32(S_IWUSR)), Int32(0)),
            (chmod("test_fj_notnull_2.txt", UInt32(S_IXUSR)), Int32(0)),
            (chmod("test_fj_notnull_3.txt", UInt32(S_IRWXU)), Int32(0)),
            (chmod("test_fj_notnull_4.txt", UInt32(S_IRGRP)), Int32(0)),
            (chmod("test_fj_notnull_5.txt", UInt32(S_IWGRP)), Int32(0)),
            (chmod("test_fj_notnull_6.txt", UInt32(S_IXGRP)), Int32(0)),
            (chmod("test_fj_notnull_7.txt", UInt32(S_IRWXG)), Int32(0)),
            (chmod("test_fj_notnull_8.txt", UInt32(S_IROTH)), Int32(0)),
            (chmod("test_fj_notnull_9.txt", UInt32(S_IWOTH)), Int32(0)),
            (chmod("test_fj_notnull_10.txt", UInt32(S_IXOTH)), Int32(0)),
            (chmod("test_fj_notnull_11.txt", UInt32(S_IRWXO)), Int32(0))
        ],
        description: "chmod()函数，入参是文件存在但内容不为空"
    )
    return 0
}
