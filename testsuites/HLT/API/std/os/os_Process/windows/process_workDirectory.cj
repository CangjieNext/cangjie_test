/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
import std.fs.*
import std.posix.*
import std.process.*
import std.math.*

@Test
class test_workDirectory {
    @TestCase
    func test_error_path(): Unit {
        var cnt = 0
        try {
            let process = Process.start("sleep", "5s", workingDirectory: Path("\0"))
        } catch (e: IllegalArgumentException) {
            cnt++
            @Expect(e.message, "The `rawPath` cannot contain null character!")
        }
        @Expect(cnt, 1)

        try {
            let process = Process.start("sleep", "5s", workingDirectory: Path("  "))
        } catch (e: IllegalArgumentException) {
            cnt++
            @Expect(e.message, "WorkingDirectory \"  \" not exist in the file system.")
        }
        @Expect(cnt, 2)

        try {
            let process = Process.start("sleep", "5s", workingDirectory: Path("notExistFilePath"))
        } catch (e: IllegalArgumentException) {
            cnt++
            @Expect(e.message, "WorkingDirectory \"notExistFilePath\" not exist in the file system.")
        }
        @Expect(cnt, 3)
    }
}
