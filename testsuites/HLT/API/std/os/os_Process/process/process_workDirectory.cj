/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (not Windows) EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (not Windows) RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 
import std.fs.*
import std.posix.*
import std.process.*
import std.math.*

@When[os == "macOS"]
let expect = "5"
@When[os != "macOS"]
let expect = "5s"

@Test
class test_workDirectory {
    @TestCase
    func test_default(): Unit {
        let process = Process.start("sleep", expect)
        let now_dir = getcwd()
        let path = process.workingDirectory.toString()
        @Expect(path, now_dir)
    }

    @TestCase
    func test_Global_Path(): Unit {
        let process = Process.start("sleep", expect, workingDirectory: Path(getcwd()))
        let path = process.workingDirectory.toString()
        @Expect(path, getcwd())
    }

    @TestCase
    func test_Relative_path(): Unit {
        let process = Process.start("sleep", expect, workingDirectory: Path("./"))
        let path = process.workingDirectory.toString()
        @Expect(path, getcwd())
    }

    @TestCase
    func test_None(): Unit {
        let process = Process.start("sleep", expect, workingDirectory: None)
        let path = process.workingDirectory.toString()
        @Expect(path, getcwd())
    }

    @TestCase
    func test_error_path(): Unit {
        var cnt = 0
        try {
            let process = Process.start("sleep", expect, workingDirectory: Path("\0"))
        } catch (e: IllegalArgumentException) {
            cnt++
        }
        @Expect(cnt, 1)

        try {
            let process = Process.start("sleep", expect, workingDirectory: Path("  "))
        } catch (e: IllegalArgumentException) {
            cnt++
            @Expect(e.message, "WorkingDirectory \"  \" not exist in the file system.")
        }
        @Expect(cnt, 2)

        try {
            let process = Process.start("sleep", expect, workingDirectory: Path("notExistFilePath"))
        } catch (e: IllegalArgumentException) {
            cnt++
            @Expect(e.message, "WorkingDirectory \"notExistFilePath\" not exist in the file system.")
        }
        @Expect(cnt, 3)
    }
}
