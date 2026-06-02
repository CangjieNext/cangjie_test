/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1 
// (not Windows) EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (not Windows) RUN-EXEC-PIPE: %run %run_opt %output %run_args %run_utest_opt
import std.fs.*
import std.posix.*
import std.process.*
import std.math.*

@When[backend == "cjnative"]
const process_name = "process_prop.out"
@When[backend == "cjnative"]
const command = "process_prop.out"
@When[backend == "cjnative"]
var arguments: Array<String> = ["--no-progress"]
@When[backend == "cjnative"]
var commandLine = ["process_prop.out", "--no-progress"]
@When[backend == "cjnative"]
const workingDirectory = "process_prop_cj"

@Test
class test_prop {
    @TestCase
    func test_process(): Unit {
        let subprocess = Process.start("sleep", "5")
        let process = Process.of(subprocess.pid)
        @Expect(process.name,"sleep")
        @Expect(process.command,"sleep")
        @Expect(process.arguments,["5"])
        @Expect(process.commandLine, ["sleep","5"])
        @Expect(process.workingDirectory.toString().contains("process_prop_cj"))
    }

    @TestCase
    func test_subprocess(): Unit {
        let process = Process.start("sleep", "5")
        @Expect(process.name,"sleep")
        @Expect(process.command,"sleep")
        @Expect(process.arguments,["5"])
        @Expect(process.commandLine, ["sleep","5"])
        @Expect(process.workingDirectory.toString().contains("process_prop_cj"))
        let res = process.wait()
        @Expect(res,0)
        @Expect(process.name,"sleep")
        @Expect(process.command,"sleep")
        @Expect(process.arguments, ["5"])
        @Expect(process.commandLine, ["sleep","5"])
        @Expect(process.workingDirectory.toString().contains("process_prop_cj"))
    }

    @TestCase
    func test_currentprocess(): Unit {
        let process = Process.current
        @Expect(process.name,process_name)
        @Expect(process.command, command)
        @Expect(process.arguments, arguments)
        @Expect(process.commandLine, commandLine)
        @Expect(process.workingDirectory.toString().contains(workingDirectory))
    }
}
