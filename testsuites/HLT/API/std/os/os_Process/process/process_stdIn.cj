/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: console.cj
// DEPENDENCE: echo_environment.sh
// (not Windows and not MAC) EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (not Windows and not MAC) RUN-EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f
// (not Windows and not MAC) ASSERT: scan 123
// (not Windows and not MAC) ASSERT: scan 一二三456!@#$%^&*()_+/*-+

import std.posix.*
import std.process.*
import std.math.*
import std.fs.{File, OpenMode}
import std.io.*

@When[backend == "cjnative"]
const out_name = "console.out"
@When[backend == "cjnative"]
const command = "./console.out"
@When[backend == "cjnative"]
const arguement = ""

@Test
class Test_stdIn {
    var cnt = 0

    public override func beforeEach(): Unit {
        cnt = 0
    }

    @TestCase
    func test_default(): Unit {
        let subProcess = Process.start("sleep", "2s")
        var buffer = Array<Byte>(5, repeat: 0)
        try {
            subProcess.stdIn.write(buffer)
        } catch (e: ProcessException) {
            cnt++
            @Expect(e.message, "Invaild outputStream.")
        }
        subProcess.wait()
        @Expect(cnt, 1)
    }

    @TestCase
    func test_inherit(): Unit {
        let subProcess = Process.start("sleep", "2s", stdIn: Inherit)
        var buffer = Array<Byte>(5, repeat: 0)
        try {
            subProcess.stdIn.write(buffer)
        } catch (e: ProcessException) {
            cnt++
            @Expect(e.message, "Invaild outputStream.")
        }
        subProcess.wait()
        @Expect(cnt, 1)
    }

    @TestCase
    func test_pipe(): Unit {
        Process.run("cjc", "console.cj", "-o", out_name)
        var subprocess = Process.start(command, arguement, stdIn: Pipe)
        println(subprocess.commandLine)
        var buffer = "123\n".toArray()
        subprocess.stdIn.write(buffer)
        subprocess.wait()
    }

    @TestCase
    func test_FromFile(): Unit {
        Process.run("cjc", "console.cj", "-o", out_name)
        var buffer = "一二三456!@#$%^&*()_+/*-+\0\n".toArray()
        let file = File("./test.txt", ReadWrite)
        file.write(buffer)
        file.seek(SeekPosition.Begin(0))
        var subprocess = Process.start(command, arguement, stdIn: FromFile(file))
        subprocess.wait()
        file.close()
        remove("./test.txt")
    }

    @TestCase
    func case_discard(): Unit {
        let subProcess = Process.start("sleep", "2s", stdIn: Discard)
        var buffer = Array<Byte>(5, repeat: 0)
        try {
            subProcess.stdIn.write(buffer)
        } catch (e: ProcessException) {
            cnt++
            @Expect(e.message, "Invaild outputStream.")
        }
        subProcess.wait()
        @Expect(cnt, 1)
    }
}
