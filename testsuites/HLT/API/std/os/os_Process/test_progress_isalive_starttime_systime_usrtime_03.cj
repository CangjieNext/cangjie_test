/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (not Windows) EXEC: %compiler %cmp_opt %f -o %output --test
// (not Windows) RUN-EXEC: %run %run_opt %output %run_args 

import std.math.*
import std.collection.*
import std.process.*
import std.posix.*
import std.process.*
import std.convert.*
import std.time.*
import std.fs.*

@Test
public class Test_process_info_new {
    @TestCase
    func case_test_info_1(): Unit {
        let subProcess: SubProcess = launch("sleep", "20", environment: HashMap<String, String>([("FOO", "BAR")]),
            workingDirectory: Path("./"))
        @Expect(subProcess.isAlive(), true)
        println(subProcess.startTime)
        let ofProcess: Process = findProcess(subProcess.pid)
        try {
            @Expect(ofProcess.pid > 0, true)
            @Expect(ofProcess.pid < Int64(Int32.Max), true)
            @Expect(ofProcess.pid, subProcess.pid)
            @Expect(ofProcess.name, subProcess.name)
            @Expect(ofProcess.command, subProcess.command)
            @Expect(ofProcess.arguments.toString(), subProcess.arguments.toString())
            @Expect(ofProcess.commandLine.toString(), subProcess.commandLine.toString())
            @Expect(ofProcess.workingDirectory.toString(), subProcess.workingDirectory.toString())
            subProcess.terminate(force: true)
        } catch (e: ProcessException) {}
    }

    @TestCase
    func test_process_time() {
        let p = launch("sleep", "5", environment: HashMap<String, String>([("FOO", "BAR")]),
            workingDirectory: Path("./"))
        var pSystemTime = -1 * Duration.millisecond
        var pUserTime = -1 * Duration.millisecond
        var pStartTime = None<DateTime>

        try {
            p.wait(timeout: 3 * Duration.second)
        } catch (_: TimeoutException) {
            pUserTime = p.userTime
            pSystemTime = p.systemTime
            pStartTime = p.startTime
            @Assert(true)
        }
        println("111")
        @Assert(pStartTime.isSome())
        println("222")
        @Expect(p.isAlive(), true)

        let buffer = Array<Byte>(256, repeat: 0)
        p.stdOut.read(buffer)

        try {
            let output = String.fromUtf8(buffer)
            let startTime = DateTime.fromUnixTimeStamp(Float64.parse(output.split("\n")[0]) * Duration.millisecond)
            let userTime = Float64.parse(output.split("\n")[1]) * Duration.second
            let systemTime = Float64.parse(output.split("\n")[2]) * Duration.second
            @Assert((startTime - pStartTime.getOrThrow()).abs() < Duration.second * 5)
            @Assert(p.pid > 0)
            @Assert((systemTime - pSystemTime).abs() < Duration.second)
            @Assert((userTime - pUserTime).abs() < Duration.second)
            p.wait()
            @Expect(p.isAlive(), false)
            p.terminate(force: true)
        } catch (_: Exception) {
        }
    }
}
