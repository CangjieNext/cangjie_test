/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./testHelper/test_process_time.c
// (Windows)EXEC: gcc ./test_process_time.c -o test_process_time_windows_helper.exe
// (Windows)EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (Windows)EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f
// ASSERT:regex-begin .*PASSED.*: 17,.*SKIPPED.*: 0,.*ERROR.*: 0
// ASSERT:regex-next .*FAILED.*: 0

internal import std.math.*
internal import std.collection.*
internal import std.process.*
internal import std.posix.*
internal import std.convert.*
internal import std.time.*
internal import std.regex.*
internal import std.unittest.*
import std.unittest.testmacro.*

/**
 * 测试头说明
 * line 1 EXEC: %compiler %cmp_opt %f --test -o %output
 * 编译指令，增加--test选项
 * line 2 EXEC-PIPE-NUM: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f
 * 执行测试用例并比较结果，test的返回值是 失败用例数量 + 错误用例数量
 * line 3-4 ASSERT:regex-begin
 * 对测试结果进行比较，通过个数，跳过，错误和失败
 *
 * 测试用例说明
 * 测试接口：
 * public static prop of: Process
 * public prop pid: Int64
 * public prop name: String
 * public prop command: String
 * public prop arguments: Array<String>
 * public prop commandLine: Array<String>
 * public prop workingDirectory: Path
 * public prop environment: Map<String, String>
 *
 * 功能分析：
 * 1. 构造 CurrentProcess 实例，检查 CurrentProcess 返回的进程信息结果是否符合预期
 */
@Test
public class Test_process_info {
    // 创建subProcess,通过Process.of()获取到Process实例，对比信息一致
    @TestCase
    func case_test_info_1(): Unit {
        let subProcess: SubProcess = Process.start("cmd.exe", "timeout", "/T", "20")
        let ofProcess: Process = Process.of(subProcess.pid)
        try {
            @Expect(ofProcess.pid > 0, true)
            @Expect(ofProcess.pid < Int64(Int32.Max), true)
            @Expect(ofProcess.pid, subProcess.pid)
            @Expect(ofProcess.name, subProcess.name)
            @Expect(ofProcess.command, subProcess.command)
            subProcess.terminate(force: true)
        } catch (e: ProcessException) {}
    }

    // 创建subProcess,通过Process.of()多次获取到Process实例，对比信息一致
    @TestCase
    func case_test_info_2(): Unit {
        let subProcess: SubProcess = Process.start("cmd.exe", "timeout", "/T", "20")
        let ofProcess1: Process = Process.of(subProcess.pid)
        let ofProcess2: Process = Process.of(subProcess.pid)
        try {
            @Expect(ofProcess1.pid > 0, true)
            @Expect(ofProcess1.pid < Int64(Int32.Max), true)
            @Expect(ofProcess1.pid, ofProcess2.pid)
            @Expect(ofProcess1.name, ofProcess2.name)
            @Expect(ofProcess1.command, ofProcess2.command)
            subProcess.terminate(force: true)
        } catch (e: ProcessException) {}
    }

    // of获取不合法进程号-1，抛出异常
    @TestCase
    func case_test_info_3(): Unit {
        var flag = 0
        try {
            Process.of(-1)
            @Expect(0, 1)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invaild pid: \"-1\", can not get process.")
            flag++
        }
        @Expect(flag, 1)
    }

    // of获取不合法进程号大于Int32.Max，抛出异常
    @TestCase
    func case_test_info_4(): Unit {
        var flag = 0
        try {
            Process.of(Int64.Max)
            @Expect(0, 1)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invaild pid: \"${Int64.Max}\", can not get process.")
            flag++
        }
        @Expect(flag, 1)
    }

    // of获取不存在进程号，抛出异常
    @TestCase
    func case_test_info_5(): Unit {
        var flag = 0
        try {
            Process.of(Int64(Int32.Max))
            @Expect(0, 1)
        } catch (e: ProcessException) {
            @Expect(e.message, "Process \"${Int32.Max}\" not alive, can not get process.")
            flag++
        }
        @Expect(flag, 1)
    }

    // of获取不合法进程号Int32.Max + 1，抛出异常
    @TestCase
    func case_test_info_6(): Unit {
        var flag = 0
        try {
            Process.of(Int64(Int32.Max) + 1)
            @Expect(0, 1)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invaild pid: \"${Int64(Int32.Max) + 1}\", can not get process.")
            flag++
        }
        @Expect(flag, 1)
    }

    // of获取0号进程idle，不存在抛出异常
    @TestCase
    func case_test_info_7(): Unit {
        var flag = 0
        try {
            let ofProcess: Process = Process.of(0)
            @Expect(ofProcess.pid > 0, true)
            @Expect(ofProcess.pid < Int64(Int32.Max), true)
            @Expect(ofProcess.pid, 1)
            @Expect(ofProcess.name, "zsh")
            @Expect(ofProcess.command, "/bin/zsh")
            @Expect(ofProcess.arguments.toString(), "[]")
            @Expect(ofProcess.commandLine.toString(), "[/bin/zsh]")
            @Expect(ofProcess.workingDirectory.toString(), "/root/tools")
        } catch (e: ProcessException) {
            @Expect(e.message, "Process \"0\" not alive, can not get process.")
            flag++
        }
        @Expect(flag, 1)
    }

    // of获取2号进程kthreadd，不存在抛出异常
    @TestCase
    func case_test_info_8(): Unit {
        var flag = 0
        try {
            let ofProcess: Process = Process.of(2)
            @Expect(ofProcess.pid > 0, true)
            @Expect(ofProcess.pid < Int64(Int32.Max), true)
            @Expect(ofProcess.pid, 1)
            @Expect(ofProcess.name, "zsh")
            @Expect(ofProcess.command, "/bin/zsh")
            @Expect(ofProcess.arguments.toString(), "[]")
            @Expect(ofProcess.commandLine.toString(), "[/bin/zsh]")
            @Expect(ofProcess.workingDirectory.toString(), "/root/tools")
        } catch (e: ProcessException) {
            @Expect(e.message, "Process \"2\" not alive, can not get process.")
            flag++
        }
        @Expect(flag, 1)
    }
}

@Test
public class Test_process_info_new {
    // 创建subProcess,通过findProcess()获取到Process实例，对比信息一致
    @TestCase
    func case_test_info_1(): Unit {
        let subProcess: SubProcess = launch("cmd.exe", "timeout", "/T", "20")
        let ofProcess: Process = findProcess(subProcess.pid)
        try {
            @Expect(ofProcess.pid > 0, true)
            @Expect(ofProcess.pid < Int64(Int32.Max), true)
            @Expect(ofProcess.pid, subProcess.pid)
            @Expect(ofProcess.name, subProcess.name)
            @Expect(ofProcess.command, subProcess.command)
            subProcess.terminate(force: true)
        } catch (e: ProcessException) {}
    }

    // 创建subProcess,通过findProcess()多次获取到Process实例，对比信息一致
    @TestCase
    func case_test_info_2(): Unit {
        let subProcess: SubProcess = launch("cmd.exe", "timeout", "/T", "20")
        let ofProcess1: Process = findProcess(subProcess.pid)
        let ofProcess2: Process = findProcess(subProcess.pid)
        try {
            @Expect(ofProcess1.pid > 0, true)
            @Expect(ofProcess1.pid < Int64(Int32.Max), true)
            @Expect(ofProcess1.pid, ofProcess2.pid)
            @Expect(ofProcess1.name, ofProcess2.name)
            @Expect(ofProcess1.command, ofProcess2.command)
            subProcess.terminate(force: true)
        } catch (e: ProcessException) {}
    }

    // of获取不合法进程号-1，抛出异常
    @TestCase
    func case_test_info_3(): Unit {
        var flag = 0
        try {
            findProcess(-1)
            @Expect(0, 1)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invaild pid: \"-1\", can not get process.")
            flag++
        }
        @Expect(flag, 1)
    }

    // of获取不合法进程号大于Int32.Max，抛出异常
    @TestCase
    func case_test_info_4(): Unit {
        var flag = 0
        try {
            findProcess(Int64.Max)
            @Expect(0, 1)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invaild pid: \"${Int64.Max}\", can not get process.")
            flag++
        }
        @Expect(flag, 1)
    }

    // of获取不存在进程号，抛出异常
    @TestCase
    func case_test_info_5(): Unit {
        var flag = 0
        try {
            findProcess(Int64(Int32.Max))
            @Expect(0, 1)
        } catch (e: ProcessException) {
            @Expect(e.message, "Process \"${Int32.Max}\" not alive, can not get process.")
            flag++
        }
        @Expect(flag, 1)
    }

    // of获取不合法进程号Int32.Max + 1，抛出异常
    @TestCase
    func case_test_info_6(): Unit {
        var flag = 0
        try {
            findProcess(Int64(Int32.Max) + 1)
            @Expect(0, 1)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invaild pid: \"${Int64(Int32.Max) + 1}\", can not get process.")
            flag++
        }
        @Expect(flag, 1)
    }

    // of获取0号进程idle，不存在抛出异常
    @TestCase
    func case_test_info_7(): Unit {
        var flag = 0
        try {
            let ofProcess: Process = findProcess(0)
            @Expect(ofProcess.pid > 0, true)
            @Expect(ofProcess.pid < Int64(Int32.Max), true)
            @Expect(ofProcess.pid, 1)
            @Expect(ofProcess.name, "zsh")
            @Expect(ofProcess.command, "/bin/zsh")
            @Expect(ofProcess.arguments.toString(), "[]")
            @Expect(ofProcess.commandLine.toString(), "[/bin/zsh]")
            @Expect(ofProcess.workingDirectory.toString(), "/root/tools")
        } catch (e: ProcessException) {
            @Expect(e.message, "Process \"0\" not alive, can not get process.")
            flag++
        }
        @Expect(flag, 1)
    }

    // of获取2号进程kthreadd，不存在抛出异常
    @TestCase
    func case_test_info_8(): Unit {
        var flag = 0
        try {
            let ofProcess: Process = findProcess(2)
            @Expect(ofProcess.pid > 0, true)
            @Expect(ofProcess.pid < Int64(Int32.Max), true)
            @Expect(ofProcess.pid, 1)
            @Expect(ofProcess.name, "zsh")
            @Expect(ofProcess.command, "/bin/zsh")
            @Expect(ofProcess.arguments.toString(), "[]")
            @Expect(ofProcess.commandLine.toString(), "[/bin/zsh]")
            @Expect(ofProcess.workingDirectory.toString(), "/root/tools")
        } catch (e: ProcessException) {
            @Expect(e.message, "Process \"2\" not alive, can not get process.")
            flag++
        }
        @Expect(flag, 1)
    }

    @TestCase
    func test_process_time() {
        func wmic_to_rfc3339(wmic_date: String) {
            let date = wmic_date.replace(".", " ")
            let zone = Int64.parse(date.split("+")[1]) / 60
            return DateTime.parse(date[..21] + "GMT" + date[21..=21] + zone.toString(), "yyyyMMddHHmmss SSZ")
        }
        let p = launch("./test_process_time_windows_helper.exe")
        sleep(2 * Duration.second) // wait for calculation.
        @Expect(p.isAlive(), true)
        let (ret, out, err) = executeWithOutput("wmic",
            ["process", "where", "processId=${p.pid}", "get", "ProcessId,", "KernelModeTime,", "UserModeTime,",
                "CreationDate", "/format:list"], stdOut: Pipe)
        @Assert(ret == 0)

        let output = String.fromUtf8(out)
        println(output)
        try {
            let startTime = wmic_to_rfc3339(
                Regex(#"CreationDate=(\d+\.\d+\+\d+)"#).matcher(output).find().getOrThrow().matchString(1))
            let processId = Int64.parse(Regex(#"ProcessId=(\d+)"#).matcher(output).find().getOrThrow().matchString(1))
            let systemTime = Int64.parse(
                Regex(#"KernelModeTime=(\d+)"#).matcher(output).find().getOrThrow().matchString(1)) * Duration
                .microsecond / 10
            let userTime = Int64.parse(Regex(#"UserModeTime=(\d+)"#).matcher(output).find().getOrThrow().matchString(1)) *
                Duration.microsecond / 10
            println("startTime: ${startTime}, userTime: ${userTime}, systemTime: ${systemTime}")
            println("pStartTime: ${p.startTime}, pUserTime: ${p.userTime}, pSystemTime: ${p.systemTime}")
            @Assert(p.userTime != -1 * Duration.millisecond)
            @Assert(p.systemTime!= -1 * Duration.millisecond)
            @Assert((startTime - p.startTime).abs() < Duration.millisecond * 10)
            @Assert((systemTime - p.systemTime).abs() < Duration.millisecond * 10)
            @Assert((userTime - p.userTime).abs() < Duration.millisecond * 10)
            p.wait()
            @Expect(p.isAlive(), false)
        } catch (e: Exception) {
            @Assert(false)
        }
    }
}
