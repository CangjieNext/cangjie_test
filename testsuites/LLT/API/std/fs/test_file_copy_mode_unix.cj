/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// (Unix) EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (Unix) EXEC: umask 022 && touch file_mode_666.txt
// (Unix) EXEC: umask 0 && %run %run_opt %output %run_utest_opt
// (Unix) EXEC-PIPE: ls -al file_mode_666.* %output | compare %f
// (Unix) ASSERT: regex -rw-r--r--.*file_mode_666.txt
// (Unix) EXEC: rm file_mode_666.*

import std.fs.*

@Test
class TestFileDirCreateMode {
    @TestCase
    func test(): Unit {
        copy("file_mode_666.txt", to: "file_mode_666.copy.txt", overwrite: true)
    }
}
