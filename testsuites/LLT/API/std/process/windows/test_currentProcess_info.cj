/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// (Windows)EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// (Windows)EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT:regex-begin .*PASSED.*: 3,.*SKIPPED.*: 0,.*ERROR.*: 0
// ASSERT:regex-next .*FAILED.*: 0

internal import std.math.*
internal import std.collection.*
internal import std.posix.*
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
 * public static prop current: CurrentProcess
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
@When[backend == "cjnative"]
let argCount = 0
let current_pid: Int64 = Int64(getpid())

func checkMapEqual(envFromOs: Map<String, String>, envFromCurProcess: Map<String, String>): Bool {
    if (envFromOs.size == envFromCurProcess.size) {
        let envFromOsIterator = envFromOs.iterator()
        let envFromCurProcessIterator = envFromCurProcess.iterator()
        for (_ in 0..envFromOs.size) {
            let curProcessEnv: Option<(String, String)> = envFromCurProcessIterator.next()
            let curOsEnv: Option<(String, String)> = envFromOsIterator.next()
            if (curProcessEnv.getOrThrow()[0] != curOsEnv.getOrThrow()[0]) {
                return false
            }
            if (curProcessEnv.getOrThrow()[1] != curOsEnv.getOrThrow()[1]) {
                return false
            }
        }
        return true
    }
    return false
}

@Test
public class Test_currentProcess_info {
    // 获取当前Process信息通过os原有函数获取信息进行对比
    @TestCase
    func case_test_info_1(): Unit {
        let currentProcess: CurrentProcess = Process.current
        @Expect(currentProcess.pid > 0, true)
        @Expect(currentProcess.pid < Int64(Int32.Max), true)
        @Expect(currentProcess.pid, current_pid)
        @Expect(currentProcess.name.size > 0, true)
        @Expect(currentProcess.command.size > 0, true)
        @Expect(currentProcess.commandLine.size > 0, true)
    }

    // 调用Process.current重复获取信息，对比前后是否一致
    @TestCase
    func case_test_info_2(): Unit {
        let currentProcess1: CurrentProcess = Process.current
        let currentProcess2: CurrentProcess = Process.current
        @Expect(currentProcess1.pid > 0, true)
        @Expect(currentProcess1.pid < Int64(Int32.Max), true)
        @Expect(currentProcess1.pid, currentProcess2.pid)
        @Expect(currentProcess1.name, currentProcess2.name)
        @Expect(currentProcess1.command, currentProcess2.command)
        @Expect(currentProcess1.commandLine, currentProcess2.commandLine)
        @Expect(currentProcess1.workingDirectory.toString(), currentProcess2.workingDirectory.toString())
        @Expect(checkMapEqual(currentProcess1.environment, currentProcess2.environment), true)
    }

    // 调用os原有函数设置当前进程环境变量信息，调用CurrentProcess查询environment进行对比
    @TestCase
    func case_test_info_3(): Unit {
        Process.current.setEnv("currentProcess", "test")
        let currentProcess: CurrentProcess = Process.current
        @Expect(currentProcess.pid > 0, true)
        @Expect(currentProcess.pid < Int64(Int32.Max), true)
        @Expect(currentProcess.pid, current_pid)
        @Expect(currentProcess.name.size > 0, true)
        @Expect(currentProcess.command.size > 0, true)
        @Expect(currentProcess.commandLine.size > 0, true)
        @Expect(currentProcess.environment.get("currentProcess"), "test" )
        currentProcess.removeEnv("currentProcess")
        @Expect(currentProcess.environment.get("currentProcess"), None)
    }
}
