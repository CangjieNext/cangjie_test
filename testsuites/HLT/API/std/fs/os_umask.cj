/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: caserunner.cj test_fj.txt test_fj_notnull.txt
// EXEC: %compiler %cmp_opt caserunner.cj -o %output %f
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_args | compare %f
// ASSERT: scan-not AssertionError

import std.posix.*

main(): Int64 {
    if (umask(UInt32(S_IRUSR)) is UInt32) {
        return 1
    }
    if ((umask(UInt32(S_IWUSR)) is UInt32) && umask(UInt32(S_IWUSR)) == 256) {
        return 2
    }
    if ((umask(UInt32(S_IXUSR)) is UInt32) && umask(UInt32(S_IXUSR)) == 128) {
        return 3
    }
    if ((umask(UInt32(S_IRWXU)) is UInt32) && umask(UInt32(S_IRWXU)) == 64) {
        return 4
    }
    if ((umask(UInt32(S_IRGRP)) is UInt32) && umask(UInt32(S_IRGRP)) == 448) {
        return 5
    }
    if ((umask(UInt32(S_IWGRP)) is UInt32) && umask(UInt32(S_IWGRP)) == 32) {
        return 6
    }
    if ((umask(UInt32(S_IXGRP)) is UInt32) && umask(UInt32(S_IXGRP)) == 16) {
        return 7
    }
    if ((umask(UInt32(S_IRWXG)) is UInt32) && umask(UInt32(S_IRWXG)) == 8) {
        return 8
    }
    if ((umask(UInt32(S_IROTH)) is UInt32) && umask(UInt32(S_IROTH)) == 56) {
        return 9
    }
    if ((umask(UInt32(S_IWOTH)) is UInt32) && umask(UInt32(S_IWOTH)) == 4) {
        return 10
    }
    if ((umask(UInt32(S_IXOTH)) is UInt32) && umask(UInt32(S_IXOTH)) == 2) {
        return 11
    }
    if ((umask(UInt32(S_IRWXO)) is UInt32) && umask(UInt32(S_IRWXO)) == 1) {
        return 12
    }
    return 0
}
