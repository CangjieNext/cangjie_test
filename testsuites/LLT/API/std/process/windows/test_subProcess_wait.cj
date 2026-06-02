/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: sleep.cj
// (Windows)EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (Windows)EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT:regex-begin .*PASSED.*: 42,.*SKIPPED.*: 0,.*ERROR.*: 0
// ASSERT:regex-next .*FAILED.*: 0

internal import std.fs.*
internal import std.time.*
internal import std.sync.*
internal import std.process.*
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
 * public static func start(command: String, arguments: Array<String>,
 *       workingDirectory!: ?Path = None,
 *       environment!: ?Map<String, String> = None,
 *       stdIn!: ProcessRedirect = Inherit,
 *       stdOut!: ProcessRedirect = Inherit,
 *       stdErr!: ProcessRedirect = Inherit): SubProcess
 * 功能分析：
 * 1. 构造不同 subProcess，等待 subProcess 并获取返回值
 */
@Test
public class Test_subProcess_wait {
    @BeforeAll
    func compileSleepProg(): Unit {
        Process.run("cjc", "sleep.cj", "-o", "sleep.exe")
    }

    @TestCase
    func case_test_wait_1(): Unit {
        let subProcess = Process.start("sleep.exe")
        @Expect(subProcess.wait(), 0)
    }

    @TestCase
    func case_test_wait_2(): Unit {
        let subProcess = Process.start("sleep.exe")
        @Expect(subProcess.wait(timeout: None), 0)
    }

    @TestCase
    func case_test_wait_3(): Unit {
        let subProcess = Process.start("cmd.exe", "/c", "sdadsafwe")
        @Expect(subProcess.wait(), 1)
    }

    @TestCase
    func case_test_wait_4(): Unit {
        let subProcess = Process.start("cmd.exe", "/c", "echo", "abc")
        @Expect(subProcess.wait(timeout: Duration.second), 0)
    }

    @TestCase
    func case_test_wait_5(): Unit {
        let subProcess = Process.start("sleep.exe")
        @Expect(subProcess.wait(timeout: Duration.minute), 0)
    }

    @TestCase
    func case_test_wait_6(): Unit {
        let subProcess = Process.start("sleep.exe")
        @Expect(subProcess.wait(timeout: Duration.Min), 0)
    }

    @TestCase
    func case_test_wait_7(): Unit {
        let subProcess = Process.start("sleep.exe")
        @Expect(subProcess.wait(timeout: Duration.Zero), 0)
    }

    @TestCase
    func case_test_wait_8(): Unit {
        var flag = 0
        let subProcess = Process.start("sleep.exe")
        try {
            subProcess.wait(timeout: Duration.nanosecond)
        } catch (e: TimeoutException) {
            flag++
        }
        @Expect(flag, 1)
    }

    @TestCase
    func case_test_wait_9(): Unit {
        let subProcess = Process.start("sleep.exe")
        @Expect(subProcess.wait(timeout: Duration.Max), 0)
    }

    @TestCase
    func case_test_wait_10(): Unit {
        let subProcess = Process.start("cmd.exe", "/c", "echo", "abc")
        let (exitCode, out, err) = subProcess.waitOutput()
        @Expect(exitCode, 0)
        @Expect(String.fromUtf8(out), "")
        @Expect(String.fromUtf8(err), "")
    }

    @TestCase
    func case_test_wait_11(): Unit {
        let subProcess = Process.start("cmd.exe", "/c", "echo", "abc", stdOut: Inherit)
        let (exitCode, out, err) = subProcess.waitOutput()
        @Expect(exitCode, 0)
        @Expect(String.fromUtf8(out), "")
        @Expect(String.fromUtf8(err), "")
    }

    @TestCase
    func case_test_wait_12(): Unit {
        let subProcess = Process.start("cmd.exe", "/c", "echo", "abc", stdOut: Pipe)
        let (exitCode, out, err) = subProcess.waitOutput()
        @Expect(exitCode, 0)
        @Expect(String.fromUtf8(out), "abc\r\n")
        @Expect(String.fromUtf8(err), "")
    }

    @TestCase
    func case_test_wait_13(): Unit {
        let file = File("./stdout.txt", ReadWrite)
        try {
            let subProcess = Process.start("cmd.exe", "/c", "echo", "abc", stdOut: FromFile(file))
            let (exitCode, out, err) = subProcess.waitOutput()
            @Expect(exitCode, 0)
            @Expect(String.fromUtf8(out), "")
            @Expect(String.fromUtf8(err), "")
        } finally {
            file.close()
            remove("./stdout.txt")
        }
    }

    @TestCase
    func case_test_wait_14(): Unit {
        let subProcess = Process.start("cmd.exe", "/c", "echo", "abc", stdOut: Discard)
        let (exitCode, out, err) = subProcess.waitOutput()
        @Expect(exitCode, 0)
        @Expect(String.fromUtf8(out), "")
        @Expect(String.fromUtf8(err), "")
    }

    @TestCase
    func case_test_wait_15(): Unit {
        let subProcess = Process.start("cmd.exe", "/c", "timeout", "/T", "abc")
        let (exitCode, out, err) = subProcess.waitOutput()
        @Expect(exitCode, 1)
        @Expect(String.fromUtf8(out), "")
        @Expect(String.fromUtf8(err), "")
    }

    @TestCase
    func case_test_wait_16(): Unit {
        let subProcess = Process.start("cmd.exe", "/c", "timeout", "/T", "abc", stdErr: Inherit)
        let (exitCode, out, err) = subProcess.waitOutput()
        @Expect(exitCode, 1)
        @Expect(String.fromUtf8(out), "")
        @Expect(String.fromUtf8(err), "")
    }

    @TestCase
    func case_test_wait_17(): Unit {
        let subProcess = Process.start("cmd.exe", "/c", "timeout", "/T", "abc", stdErr: Pipe)
        let (exitCode, out, err) = subProcess.waitOutput()
        @Expect(exitCode, 1)
        @Expect(String.fromUtf8(out), "")
        @Expect(String.fromUtf8(err), "ERROR: Invalid value for timeout (/T) specified. Valid range is -1 to 99999.\r\n")
    }

    @TestCase
    func case_test_wait_18(): Unit {
        let file = File("./stdout.txt", ReadWrite)
        try {
            let subProcess = Process.start("cmd.exe", "/c", "timeout", "/T", "abc", stdErr: FromFile(file))
            let (exitCode, out, err) = subProcess.waitOutput()
            @Expect(exitCode, 1)
            @Expect(String.fromUtf8(out), "")
            @Expect(String.fromUtf8(err), "")
        } finally {
            file.close()
            remove("./stdout.txt")
        }
    }

    @TestCase
    func case_test_wait_19(): Unit {
        let subProcess = Process.start("cmd.exe", "/c", "timeout", "/T", "abc", stdErr: Discard)
        let (exitCode, out, err) = subProcess.waitOutput()
        @Expect(exitCode, 1)
        @Expect(String.fromUtf8(out), "")
        @Expect(String.fromUtf8(err), "")
    }

    // wait中的monitor先被运行，subProcess中的monitor后被运行
    @TestCase
    func case_test_wait_20(): Unit {
        var flag = 0
        let subProcess = Process.start("sleep.exe")
        try {
            subProcess.wait(timeout: Duration.second)
        } catch (e: TimeoutException) {
            flag++
        }
        @Expect(flag, 1)
    }

    // subProcess中的monitor先被运行，wait中的monitor后被运行
    @TestCase
    func case_test_wait_21(): Unit {
        var flag = 0
        let subProcess = Process.start("sleep.exe")
        try {
            sleep(Duration.millisecond * 500)
            subProcess.wait(timeout: Duration.second)
        } catch (e: TimeoutException) {
            flag++
        }
        @Expect(flag, 1)
    }
}

@Test
public class Test_subProcess_wait_new {
    @BeforeAll
    func compileSleepProg(): Unit {
        Process.run("cjc", "sleep.cj", "-o", "sleep.exe")
    }

    @TestCase
    func case_test_wait_1(): Unit {
        let subProcess = launch("sleep.exe")
        @Expect(subProcess.wait(), 0)
    }

    @TestCase
    func case_test_wait_2(): Unit {
        let subProcess = launch("sleep.exe")
        @Expect(subProcess.wait(timeout: None), 0)
    }

    @TestCase
    func case_test_wait_3(): Unit {
        let subProcess = launch("cmd.exe", "/c", "sdadsafwe")
        @Expect(subProcess.wait(), 1)
    }

    @TestCase
    func case_test_wait_4(): Unit {
        let subProcess = launch("cmd.exe", "/c", "echo", "abc")
        @Expect(subProcess.wait(timeout: Duration.second), 0)
    }

    @TestCase
    func case_test_wait_5(): Unit {
        let subProcess = launch("sleep.exe")
        @Expect(subProcess.wait(timeout: Duration.minute), 0)
    }

    @TestCase
    func case_test_wait_6(): Unit {
        let subProcess = launch("sleep.exe")
        @Expect(subProcess.wait(timeout: Duration.Min), 0)
    }

    @TestCase
    func case_test_wait_7(): Unit {
        let subProcess = launch("sleep.exe")
        @Expect(subProcess.wait(timeout: Duration.Zero), 0)
    }

    @TestCase
    func case_test_wait_8(): Unit {
        var flag = 0
        let subProcess = launch("sleep.exe")
        try {
            subProcess.wait(timeout: Duration.nanosecond)
        } catch (e: TimeoutException) {
            flag++
        }
        @Expect(flag, 1)
    }

    @TestCase
    func case_test_wait_9(): Unit {
        let subProcess = launch("sleep.exe")
        @Expect(subProcess.wait(timeout: Duration.Max), 0)
    }

    @TestCase
    func case_test_wait_10(): Unit {
        let subProcess = launch("cmd.exe", "/c", "echo", "abc")
        let (exitCode, out, err) = subProcess.waitOutput()
        @Expect(exitCode, 0)
        @Expect(String.fromUtf8(out), "")
        @Expect(String.fromUtf8(err), "")
    }

    @TestCase
    func case_test_wait_11(): Unit {
        let subProcess = launch("cmd.exe", "/c", "echo", "abc", stdOut: Inherit)
        let (exitCode, out, err) = subProcess.waitOutput()
        @Expect(exitCode, 0)
        @Expect(String.fromUtf8(out), "")
        @Expect(String.fromUtf8(err), "")
    }

    @TestCase
    func case_test_wait_12(): Unit {
        let subProcess = launch("cmd.exe", "/c", "echo", "abc", stdOut: Pipe)
        let (exitCode, out, err) = subProcess.waitOutput()
        @Expect(exitCode, 0)
        @Expect(String.fromUtf8(out), "abc\r\n")
        @Expect(String.fromUtf8(err), "")
    }

    @TestCase
    func case_test_wait_13(): Unit {
        let file = File("./stdout.txt", ReadWrite)
        try {
            let subProcess = launch("cmd.exe", "/c", "echo", "abc", stdOut: FromFile(file))
            let (exitCode, out, err) = subProcess.waitOutput()
            @Expect(exitCode, 0)
            @Expect(String.fromUtf8(out), "")
            @Expect(String.fromUtf8(err), "")
        } finally {
            file.close()
            remove("./stdout.txt")
        }
    }

    @TestCase
    func case_test_wait_14(): Unit {
        let subProcess = launch("cmd.exe", "/c", "echo", "abc", stdOut: Discard)
        let (exitCode, out, err) = subProcess.waitOutput()
        @Expect(exitCode, 0)
        @Expect(String.fromUtf8(out), "")
        @Expect(String.fromUtf8(err), "")
    }

    @TestCase
    func case_test_wait_15(): Unit {
        let subProcess = launch("cmd.exe", "/c", "timeout", "/T", "abc")
        let (exitCode, out, err) = subProcess.waitOutput()
        @Expect(exitCode, 1)
        @Expect(String.fromUtf8(out), "")
        @Expect(String.fromUtf8(err), "")
    }

    @TestCase
    func case_test_wait_16(): Unit {
        let subProcess = launch("cmd.exe", "/c", "timeout", "/T", "abc", stdErr: Inherit)
        let (exitCode, out, err) = subProcess.waitOutput()
        @Expect(exitCode, 1)
        @Expect(String.fromUtf8(out), "")
        @Expect(String.fromUtf8(err), "")
    }

    @TestCase
    func case_test_wait_17(): Unit {
        let subProcess = launch("cmd.exe", "/c", "timeout", "/T", "abc", stdErr: Pipe)
        let (exitCode, out, err) = subProcess.waitOutput()
        @Expect(exitCode, 1)
        @Expect(String.fromUtf8(out), "")
        @Expect(String.fromUtf8(err), "ERROR: Invalid value for timeout (/T) specified. Valid range is -1 to 99999.\r\n")
    }

    @TestCase
    func case_test_wait_18(): Unit {
        let file = File("./stdout.txt", ReadWrite)
        try {
            let subProcess = launch("cmd.exe", "/c", "timeout", "/T", "abc", stdErr: FromFile(file))
            let (exitCode, out, err) = subProcess.waitOutput()
            @Expect(exitCode, 1)
            @Expect(String.fromUtf8(out), "")
            @Expect(String.fromUtf8(err), "")
        } finally {
            file.close()
            remove("./stdout.txt")
        }
    }

    @TestCase
    func case_test_wait_19(): Unit {
        let subProcess = launch("cmd.exe", "/c", "timeout", "/T", "abc", stdErr: Discard)
        let (exitCode, out, err) = subProcess.waitOutput()
        @Expect(exitCode, 1)
        @Expect(String.fromUtf8(out), "")
        @Expect(String.fromUtf8(err), "")
    }

    // wait中的monitor先被运行，subProcess中的monitor后被运行
    @TestCase
    func case_test_wait_20(): Unit {
        var flag = 0
        let subProcess = launch("sleep.exe")
        try {
            subProcess.wait(timeout: Duration.second)
        } catch (e: TimeoutException) {
            flag++
        }
        @Expect(flag, 1)
    }

    // subProcess中的monitor先被运行，wait中的monitor后被运行
    @TestCase
    func case_test_wait_21(): Unit {
        var flag = 0
        let subProcess = launch("sleep.exe")
        try {
            sleep(Duration.millisecond * 500)
            subProcess.wait(timeout: Duration.second)
        } catch (e: TimeoutException) {
            flag++
        }
        @Expect(flag, 1)
    }
}
