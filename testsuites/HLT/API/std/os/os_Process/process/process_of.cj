/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (not Windows) EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (not Windows) RUN-EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args 
import std.posix.*
import std.process.*
import std.math.*

@When[backend == "cjnative"]
const process_name = "process_of.out"
@When[backend == "cjnative"]
const command = "process_of.out"
@When[backend == "cjnative"]
var arguments: Array<String> = ["--no-progress"]
@When[backend == "cjnative"]
var commandLine = ["process_of.out", "--no-progress"]
@When[backend == "cjnative"]
const workingDirectory = "process_of_cj"

@Test
class Test_of {
    var cnt = 0
    public override func beforeEach(): Unit {
        cnt = 0
    }

    @TestCase
    func test_of_nowpid(): Unit {
        let nowPid = getpid()
        var process = Process.of(Int64(nowPid))
        @Expect(process.name,process_name)
        @Expect(process.command, command)
        @Expect(process.arguments, arguments)
        @Expect(process.commandLine, commandLine)
        println(process.workingDirectory.toString())
        @Expect(process.workingDirectory.toString().contains(workingDirectory))
    }

    @TestCase
    func test_of_one(): Unit {
        var process = Process.of(1)
        @Expect(process.pid, 1)
    }

    @TestCase
    func test_of_Max(): Unit {
        try {
            Process.of(Int64(Int32.Max))
        } catch (e: ProcessException) {
            cnt++
            @Expect(e.message, "Process \"2147483647\" not alive, can not get process.")
        }
        @Expect(cnt, 1)
    }

    @TestCase
    func test_of_Invalid_number(): Unit {
        try {
            Process.of(-1)
        } catch (e: IllegalArgumentException) {
            cnt++
            @Expect(e.message, "Invaild pid: \"-1\", can not get process.")
        }
        @Expect(cnt, 1)

        try {
            Process.of(Int64(Int32.Max) + 1)
        } catch (e: IllegalArgumentException) {
            cnt++
            @Expect(e.message, "Invaild pid: \"2147483648\", can not get process.")
        }
        @Expect(cnt, 2)

        try {
            Process.of(Int64.Max)
        } catch (e: IllegalArgumentException) {
            cnt++
            @Expect(e.message, "Invaild pid: \"9223372036854775807\", can not get process.")
        }
        @Expect(cnt, 3)

        try {
            Process.of(Int64.Min)
        } catch (e: IllegalArgumentException) {
            cnt++
            @Expect(e.message, "Invaild pid: \"-9223372036854775808\", can not get process.")
        }
        @Expect(cnt, 4)
    }
}
