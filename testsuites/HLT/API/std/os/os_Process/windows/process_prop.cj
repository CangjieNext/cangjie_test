/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
import std.fs.*
import std.posix.*
import std.process.*
import std.math.*

@When[backend == "cjnative"]
const process_name = "process_prop.out"
@When[backend == "cjnative"]
const command = "process_prop.out"
@When[backend == "cjnative"]
var arguments = []
@When[backend == "cjnative"]
var commandLine = ["process_prop.out"]
@When[backend == "cjnative"]
const workingDirectory = "process_prop_cj"
@When[backend == "cjvm"]
const process_name = "cj"
@When[backend == "cjvm"]
const command = "cj"
@When[backend == "cjvm"]
var arguments = ["process_prop.cbc"]
@When[backend == "cjvm"]
var commandLine = ["cj", "process_prop.cbc"]
@When[backend == "cjvm"]
const workingDirectory = "process_prop_cj"

@Test
class test_prop {
    @TestCase
    func test_process(): Unit {
        let subprocess = Process.start("sleep", "5s")
        let process = Process.of(subprocess.pid)
        @Expect(process.name,"sleep.exe")
        @Expect(process.command.contains("sleep.exe"))
    }

    @TestCase
    func test_subprocess(): Unit {
        let process = Process.start("sleep", "5s")
        @Expect(process.name,"sleep.exe")
        @Expect(process.command.contains("sleep.exe"))
        let res = process.wait()
        @Expect(res,0)
        @Expect(process.name,"sleep.exe")
        @Expect(process.command.contains("sleep.exe"))
    }

    @TestCase
    func test_currentprocess(): Unit {
        let process = Process.current
        @Expect(process.name,"process_prop.exe")
        @Expect(process.command.contains("process_prop.exe"))
    }
}
