/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// (Unix)EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// (Unix)EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT:regex-begin .*PASSED.*: 4,.*SKIPPED.*: 4,.*ERROR.*: 0
// ASSERT:regex-next .*FAILED.*: 0

import std.math.*
import std.collection.*
import std.posix.*
import std.process.*
import std.unittest.*
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
 * public func terminate(force!: Bool = false): Unit
 *
 * 功能分析：
 * 1. 构造 Process 实例，通过 Process.terminate() 方法杀死对应进程，查看进程已不存在。
 */
@Test
public class Test_process_terminate {
    // 创建子进程，通过of获取Process实例，terminate强制杀死子进程，子进程成为僵尸进程，wait()后杀死，重新获取抛异常
    @TestCase
    func case_test_terminate_1(): Unit {
        let subProcess: SubProcess = Process.start("sleep", "20")
        let ofProcess: Process = Process.of(subProcess.pid)
        try {
            @Expect(ofProcess.pid > 0, true)
            @Expect(ofProcess.pid < Int64(Int32.Max), true)
            ofProcess.terminate(force: true)
            let waitCode = subProcess.wait()
            @Expect(waitCode, 9)
            try {
                Process.of(subProcess.pid)
                @Expect(0, 1)
            } catch (e: ProcessException) {
                @Expect(e.message, "Process \"${ofProcess.pid}\" not alive, can not get process.")
            }
        } catch (e: ProcessException) {}
    }

    // 创建子进程，通过of获取Process实例，terminate结束子进程，子进程成为僵尸进程，wait()后杀死，重新获取抛异常
    @TestCase
    func case_test_terminate_2(): Unit {
        let subProcess: SubProcess = Process.start("sleep", "20")
        let ofProcess: Process = Process.of(subProcess.pid)
        try {
            @Expect(ofProcess.pid > 0, true)
            @Expect(ofProcess.pid < Int64(Int32.Max), true)
            ofProcess.terminate(force: false)
            let waitCode = subProcess.wait()
            @Expect(waitCode, 15)
            try {
                Process.of(subProcess.pid)
                @Expect(0, 1)
            } catch (e: ProcessException) {
                @Expect(e.message, "Process \"${ofProcess.pid}\" not alive, can not get process.")
            }
        } catch (e: ProcessException) {}
    }

    // 创建子进程，通过of获取Process实例，terminate强制杀死子进程，子进程成为僵尸进程，重新of可获取实例，但信息不存在
    @TestCase
    @Skip
    func case_test_terminate_3(): Unit {
        let subProcess: SubProcess = Process.start("sleep", "20")
        let ofProcess: Process = Process.of(subProcess.pid)
        try {
            @Expect(ofProcess.pid > 0, true)
            @Expect(ofProcess.pid < Int64(Int32.Max), true)
            ofProcess.terminate(force: true)
            let waitCode = subProcess.wait()
            @Expect(waitCode, 9)
            try {
                let ofProcess_new: Process = Process.of(subProcess.pid)
                @Expect(1, 1)
                ofProcess_new.name
            } catch (e: ProcessException) {
                @Expect(e.message, "Can not get process name.")
            }
        } catch (e: ProcessException) {}
    }

    // 创建子进程，通过of获取Process实例，terminate结束子进程，子进程成为僵尸进程，重新of可获取实例，但信息不存在
    @TestCase
    @Skip
    func case_test_terminate_4(): Unit {
        let subProcess: SubProcess = Process.start("sleep", "20")
        let ofProcess: Process = Process.of(subProcess.pid)
        try {
            @Expect(ofProcess.pid > 0, true)
            @Expect(ofProcess.pid < Int64(Int32.Max), true)
            ofProcess.terminate(force: false)
            let waitCode = subProcess.wait()
            @Expect(waitCode, 15)
            try {
                let ofProcess_new: Process = Process.of(subProcess.pid)
                @Expect(1, 1)
                ofProcess_new.name
            } catch (e: ProcessException) {
                @Expect(e.message, "Can not get process name.")
            }
        } catch (e: ProcessException) {}
    }
}

@Test
public class Test_process_terminate_new {
    // 创建子进程，通过of获取Process实例，terminate强制杀死子进程，子进程成为僵尸进程，wait()后杀死，重新获取抛异常
    @TestCase
    func case_test_terminate_1(): Unit {
        let subProcess: SubProcess = launch("sleep", "20")
        let ofProcess: Process = findProcess(subProcess.pid)
        try {
            @Expect(ofProcess.pid > 0, true)
            @Expect(ofProcess.pid < Int64(Int32.Max), true)
            ofProcess.terminate(force: true)
            let waitCode = subProcess.wait()
            @Expect(waitCode, 9)
            try {
                findProcess(subProcess.pid)
                @Expect(0, 1)
            } catch (e: ProcessException) {
                @Expect(e.message, "Process \"${ofProcess.pid}\" not alive, can not get process.")
            }
        } catch (e: ProcessException) {}
    }

    // 创建子进程，通过of获取Process实例，terminate结束子进程，子进程成为僵尸进程，wait()后杀死，重新获取抛异常
    @TestCase
    func case_test_terminate_2(): Unit {
        let subProcess: SubProcess = launch("sleep", "20")
        let ofProcess: Process = findProcess(subProcess.pid)
        try {
            @Expect(ofProcess.pid > 0, true)
            @Expect(ofProcess.pid < Int64(Int32.Max), true)
            ofProcess.terminate(force: false)
            let waitCode = subProcess.wait()
            @Expect(waitCode, 15)
            try {
                findProcess(subProcess.pid)
                @Expect(0, 1)
            } catch (e: ProcessException) {
                @Expect(e.message, "Process \"${ofProcess.pid}\" not alive, can not get process.")
            }
        } catch (e: ProcessException) {}
    }

    // 创建子进程，通过of获取Process实例，terminate强制杀死子进程，子进程成为僵尸进程，重新of可获取实例，但信息不存在
    @TestCase
    @Skip
    func case_test_terminate_3(): Unit {
        let subProcess: SubProcess = launch("sleep", "20")
        let ofProcess: Process = findProcess(subProcess.pid)
        try {
            @Expect(ofProcess.pid > 0, true)
            @Expect(ofProcess.pid < Int64(Int32.Max), true)
            ofProcess.terminate(force: true)
            let waitCode = subProcess.wait()
            @Expect(waitCode, 9)
            try {
                let ofProcess_new: Process = findProcess(subProcess.pid)
                @Expect(1, 1)
                ofProcess_new.name
            } catch (e: ProcessException) {
                @Expect(e.message, "Can not get process name.")
            }
        } catch (e: ProcessException) {}
    }

    // 创建子进程，通过of获取Process实例，terminate结束子进程，子进程成为僵尸进程，重新of可获取实例，但信息不存在
    @TestCase
    @Skip
    func case_test_terminate_4(): Unit {
        let subProcess: SubProcess = launch("sleep", "20")
        let ofProcess: Process = findProcess(subProcess.pid)
        try {
            @Expect(ofProcess.pid > 0, true)
            @Expect(ofProcess.pid < Int64(Int32.Max), true)
            ofProcess.terminate(force: false)
            let waitCode = subProcess.wait()
            @Expect(waitCode, 15)
            try {
                let ofProcess_new: Process = findProcess(subProcess.pid)
                @Expect(1, 1)
                ofProcess_new.name
            } catch (e: ProcessException) {
                @Expect(e.message, "Can not get process name.")
            }
        } catch (e: ProcessException) {}
    }
}
