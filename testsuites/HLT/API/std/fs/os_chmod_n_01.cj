/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: caserunner.cj test_fj_0.txt test_fj_1.txt test_fj_2.txt test_fj_3.txt test_fj_4.txt test_fj_5.txt test_fj_6.txt
// DEPENDENCE: test_fj_7.txt test_fj_8.txt test_fj_9.txt test_fj_10.txt test_fj_11.txt
// (not Windows) EXEC-PIPE: %compiler %cmp_opt caserunner.cj -o %output %f
// (not Windows) RUN-EXEC-PIPE: %run %run_opt %output %run_args
// (not Windows)EXEC-PIPE: %ls -l| grep '\-\-\-\-\-\-\-\-\-x' |grep 'test_fj_10.txt'
// (not Windows)EXEC-PIPE: %ls -l| grep '\-r\-\-\-\-\-\-\-\-' | grep 'test_fj_0.txt'
// (not Windows)EXEC-PIPE: %ls -l| grep '\-\-w\-\-\-\-\-\-\-' | grep 'test_fj_1.txt'
// (not Windows)EXEC-PIPE: %ls -l| grep '\-\-\-x\-\-\-\-\-\-' | grep 'test_fj_2.txt'
// (not Windows)EXEC-PIPE: %ls -l| grep '\-rwx\-\-\-\-\-\-' | grep 'test_fj_3.txt'
// (not Windows)EXEC-PIPE: %ls -l| grep '\-\-\-\-r\-\-\-\-\-'| grep 'test_fj_4.txt'
// (not Windows)EXEC-PIPE: %ls -l| grep '\-\-\-\-\-w\-\-\-\-' | grep 'test_fj_5.txt'
// (not Windows)EXEC-PIPE: %ls -l| grep '\-\-\-\-\-\-x\-\-\-' | grep 'test_fj_6.txt'
// (not Windows)EXEC-PIPE: %ls -l| grep '\-\-\-\-rwx\-\-\-' | grep 'test_fj_7.txt'
// (not Windows)EXEC-PIPE: %ls -l| grep '\-\-\-\-\-\-\-r\-\-'| grep 'test_fj_8.txt'
// (not Windows)EXEC-PIPE: %ls -l| grep '\-\-\-\-\-\-\-\-w\-'| grep 'test_fj_9.txt'
// (not Windows)EXEC-PIPE: %ls -l| grep '\-\-\-\-\-\-\-\-\-x'| grep 'test_fj_10.txt'
// (not Windows)EXEC-PIPE: %ls -l| grep '\-\-\-\-\-\-\-rwx'| grep 'test_fj_11.txt'

import std.posix.*

main(): Int64 {
    CaseRunner<Int32>().runCases(
        [
            (chmod("test_fj_0.txt", UInt32(S_IRUSR)), Int32(0)),
            (chmod("test_fj_1.txt", UInt32(S_IWUSR)), Int32(0)),
            (chmod("test_fj_2.txt", UInt32(S_IXUSR)), Int32(0)),
            (chmod("test_fj_3.txt", UInt32(S_IRWXU)), Int32(0)),
            (chmod("test_fj_4.txt", UInt32(S_IRGRP)), Int32(0)),
            (chmod("test_fj_5.txt", UInt32(S_IWGRP)), Int32(0)),
            (chmod("test_fj_6.txt", UInt32(S_IXGRP)), Int32(0)),
            (chmod("test_fj_7.txt", UInt32(S_IRWXG)), Int32(0)),
            (chmod("test_fj_8.txt", UInt32(S_IROTH)), Int32(0)),
            (chmod("test_fj_9.txt", UInt32(S_IWOTH)), Int32(0)),
            (chmod("test_fj_10.txt", UInt32(S_IXOTH)), Int32(0)),
            (chmod("test_fj_11.txt", UInt32(S_IRWXO)), Int32(0))
        ],
        description: "chmod()函数，入参是文件存在但内容为空"
    )
    return 0
}
