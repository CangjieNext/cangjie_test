/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./empty_arg_echo.cj
// (Windows)EXEC: %compiler %cmp_opt ./empty_arg_echo.cj -o empty_arg_echo.exe
// (Windows)EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// (Windows)EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT:regex-begin .*PASSED.*: 9,.*SKIPPED.*: 0,.*ERROR.*: 0
// ASSERT:regex-next .*FAILED.*: 0

internal import std.collection.*
internal import std.io.*
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
 * public func launch(command: String, arguments: Array<String>, ...): SubProcess
 * public func execute(command: String, arguments: Array<String>, ...): Int64
 * public func executeWithOutput(command: String, arguments: Array<String>, ...): (Int64, Array<Byte>, Array<Byte>)
 * public static func start(command: String, arguments: Array<String>, ...): SubProcess (deprecated)
 *
 * 功能分析：
 * 1. 验证 Windows 平台空字符串参数在进程启动时不会丢失 (issue #619)
 *    escapeArgument 对空串应返回 "\"\""，子进程应能接收到空参数
 * 2. 通过 empty_arg_echo 子进程打印收到的参数个数与内容进行验证
 *    （empty_arg_echo.cj 编译出的辅助程序，随用例一起提交）
 */

// 校验 empty_arg_echo 输出：参数个数与每个参数内容（含空串）
func checkArgsOutput(output: Array<Byte>, expected: Array<String>): Unit {
    var expectBuilder = StringBuilder("argc=${expected.size}\n")
    for (i in 0..expected.size) {
        expectBuilder.append("arg${i}=<${expected[i]}>\n")
    }
    let actual = String.fromUtf8(output)
    // Windows 下行结尾是 \r\n，统一成 \n 后比较
    @Expect(actual.replace("\r\n", "\n"), expectBuilder.toString())
}

@Test
public class Test_empty_argument {
    // launch 传递单个空字符串参数
    @TestCase
    func case_launch_single_empty_arg(): Unit {
        let subProcess = launch(".\\empty_arg_echo.exe", "a", "", "b", stdOut: Pipe, stdErr: Pipe)
        let (_, out, err) = subProcess.waitOutput()
        subProcess.wait()
        checkArgsOutput(out, ["a", "", "b"])
        @Expect(err.size, 0)
    }

    // launch 传递多个连续空字符串参数
    @TestCase
    func case_launch_multiple_empty_args(): Unit {
        let subProcess = launch(".\\empty_arg_echo.exe", "", "", "", stdOut: Pipe, stdErr: Pipe)
        let (_, out, err) = subProcess.waitOutput()
        subProcess.wait()
        checkArgsOutput(out, ["", "", ""])
        @Expect(err.size, 0)
    }

    // launch 传递前缀型空值参数（issue 中场景：--lto-keep-pkg-visibility=）
    @TestCase
    func case_launch_empty_value_option(): Unit {
        let subProcess = launch(".\\empty_arg_echo.exe", "--lto=full", "--lto-keep-pkg-visibility=", "main.cj",
            stdOut: Pipe, stdErr: Pipe)
        let (_, out, err) = subProcess.waitOutput()
        subProcess.wait()
        checkArgsOutput(out, ["--lto=full", "--lto-keep-pkg-visibility=", "main.cj"])
        @Expect(err.size, 0)
    }

    // launch arguments 为空数组（不应产生多余参数）
    @TestCase
    func case_launch_no_args(): Unit {
        let subProcess = launch(".\\empty_arg_echo.exe", Array<String>(), stdOut: Pipe, stdErr: Pipe)
        let (_, out, err) = subProcess.waitOutput()
        subProcess.wait()
        checkArgsOutput(out, [])
        @Expect(err.size, 0)
    }

    // execute 传递空字符串参数，子进程退出码应为 0
    @TestCase
    func case_execute_empty_arg(): Unit {
        let exitCode = execute(".\\empty_arg_echo.exe", "a", "", "b", stdOut: Discard, stdErr: Discard)
        @Expect(exitCode, 0)
    }

    // executeWithOutput 传递空字符串参数并校验输出
    @TestCase
    func case_execute_with_output_empty_arg(): Unit {
        let (exitCode, out, err) = executeWithOutput(".\\empty_arg_echo.exe", "", "x", stdOut: Pipe, stdErr: Pipe)
        @Expect(exitCode, 0)
        checkArgsOutput(out, ["", "x"])
        @Expect(err.size, 0)
    }

    // 已废弃的 Process.start 传递空字符串参数（issue 中提到的接口）
    @TestCase
    func case_process_start_empty_arg(): Unit {
        let subProcess = Process.start(".\\empty_arg_echo.exe", "", "", stdOut: Pipe, stdErr: Pipe)
        let (_, out, err) = subProcess.waitOutput()
        subProcess.wait()
        checkArgsOutput(out, ["", ""])
        @Expect(err.size, 0)
    }

    // 空串与含空格参数混合，确保引号转义互不干扰
    @TestCase
    func case_mixed_empty_and_space_args(): Unit {
        let subProcess = launch(".\\empty_arg_echo.exe", "", "a b", "", stdOut: Pipe, stdErr: Pipe)
        let (_, out, err) = subProcess.waitOutput()
        subProcess.wait()
        checkArgsOutput(out, ["", "a b", ""])
        @Expect(err.size, 0)
    }

    // 空串与含引号参数混合，确保反斜杠转义互不干扰
    @TestCase
    func case_mixed_empty_and_quote_args(): Unit {
        let subProcess = launch(".\\empty_arg_echo.exe", "", "a\"b", stdOut: Pipe, stdErr: Pipe)
        let (_, out, err) = subProcess.waitOutput()
        subProcess.wait()
        checkArgsOutput(out, ["", "a\"b"])
        @Expect(err.size, 0)
    }
}
