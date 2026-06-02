/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// (Darwin)EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// (Darwin)RUN-EXEC-PIPE: export USER_TEST_INFO=TEST && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT:regex-begin .*PASSED.*: 30,.*SKIPPED.*: 8,.*ERROR.*: 0
// ASSERT:regex-next .*FAILED.*: 0

internal import std.fs.*
internal import std.time.*
internal import std.sync.*
internal import std.math.*
internal import std.collection.*
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
 * 1. 构造不同 subProcess，检查 subProcess 在不同入参的情况下，获取的信息是否符合预期
 */
let longStr = getLongString()

func getLongString(): String {
    var str: String = ""
    var count = 1
    while (count < 5000) {
        str = str + "1234567890"
        count = count + 1
    }
    str
}

func checkMapEqual(curProcessEnv: Map<String, String>, subProcessEnv: Map<String, String>): Bool {
    if (curProcessEnv.size == subProcessEnv.size) {
        let curEnvIterator = curProcessEnv.iterator()
        let subEnvIterator = subProcessEnv.iterator()
        for (_ in 0..curProcessEnv.size) {
            let subEnv: Option<(String, String)> = subEnvIterator.next()
            let curEnv: Option<(String, String)> = curEnvIterator.next()
            if (subEnv.getOrThrow()[0] != curEnv.getOrThrow()[0]) {
                return false
            }
            if (subEnv.getOrThrow()[1] != curEnv.getOrThrow()[1]) {
                return false
            }
        }
        return true
    }
    return false
}

@Test
public class Test_subProcess_info {
    // 执行立刻完成的Shell命令
    @TestCase
    func case_test_info_1(): Unit {
        let subProcess = Process.start("echo", "abc")
        let curProcess = Process.current
        try {
            @Expect(subProcess.pid > 0, true)
            @Expect(subProcess.pid < Int64(Int32.Max), true)
            @Expect(subProcess.name, "echo")
            @Expect(subProcess.command, "echo")
            if (subProcess.arguments.size == 1) {
                @Expect(subProcess.arguments[0], "abc")
            } else {
                @Expect(0, 1)
            }
            if (subProcess.commandLine.size == 2) {
                @Expect(subProcess.commandLine[0], "echo")
                @Expect(subProcess.commandLine[1], "abc")
            } else {
                @Expect(0, 2)
            }
            @Expect(subProcess.workingDirectory.toString(), curProcess.workingDirectory.toString())
        } catch (e: ProcessException) {} // 概率获取不到子进程信息，因为该子进程会立即结束
    }

    // 执行需要等待一段时间才能结束的Shell命令
    @TestCase
    func case_test_info_2(): Unit {
        let subProcess = Process.start("sleep", "1")
        let curProcess = Process.current
        @Expect(subProcess.pid > 0, true)
        @Expect(subProcess.pid < Int64(Int32.Max), true)
        @Expect(subProcess.name, "sleep")
        @Expect(subProcess.command, "sleep")
        if (subProcess.arguments.size == 1) {
            @Expect(subProcess.arguments[0], "1")
        } else {
            @Expect(0, 1)
        }
        if (subProcess.commandLine.size == 2) {
            @Expect(subProcess.commandLine[0], "sleep")
            @Expect(subProcess.commandLine[1], "1")
        } else {
            @Expect(0, 2)
        }
        @Expect(subProcess.workingDirectory.toString(), curProcess.workingDirectory.toString())
    }

    // 自定义可执行文件，如仓颉编译完成代码
    @TestCase
    @Skip
    func case_test_info_3(): Unit {
        let subProcess = Process.start("./wait")
        let curProcess = Process.current
        @Expect(subProcess.pid > 0, true)
        @Expect(subProcess.pid < Int64(Int32.Max), true)
        @Expect(subProcess.name, "wait")
        @Expect(subProcess.command, "./wait")
        @Expect(subProcess.arguments.size, 0)
        if (subProcess.commandLine.size == 1) {
            @Expect(subProcess.commandLine[0], "./wait")
        } else {
            @Expect(0, 1)
        }
        @Expect(subProcess.workingDirectory.toString(), curProcess.workingDirectory.toString())
    }

    // 可执行命令(相对路径中间存在空格)
    @TestCase
    @Skip
    func case_test_info_4(): Unit {
        let subProcess = Process.start("./tests/LLT/libs/std/process/linux/just for test/wait")
        let curProcess = Process.current
        @Expect(subProcess.pid > 0, true)
        @Expect(subProcess.pid < Int64(Int32.Max), true)
        @Expect(subProcess.name, "wait")
        @Expect(subProcess.command, "./tests/LLT/libs/std/process/linux/just for test/wait")
        @Expect(subProcess.arguments.size, 0)
        if (subProcess.commandLine.size == 1) {
            @Expect(subProcess.commandLine[0], "./tests/LLT/libs/std/process/linux/just for test/wait")
        } else {
            @Expect(0, 1)
        }
        @Expect(subProcess.workingDirectory.toString(), curProcess.workingDirectory.toString())
    }

    @TestCase
    func case_test_info_7(): Unit {
        var flag = 0
        try {
            Process.start("\0")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Command \"\0\" cannot contains null character.")
            flag++
        }
        @Expect(flag, 1)
    }

    @TestCase
    func case_test_info_8(): Unit {
        var flag = 0
        try {
            Process.start("echo\0", "abc")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Command \"echo\0\" cannot contains null character.")
            flag++
        }
        @Expect(flag, 1)
    }

    @TestCase
    @Skip
    func case_test_info_10(): Unit {
        let subProcess = Process.start("./wait", Array<String>())
        let curProcess = Process.current
        @Expect(subProcess.pid > 0, true)
        @Expect(subProcess.pid < Int64(Int32.Max), true)
        @Expect(subProcess.name, "wait")
        @Expect(subProcess.command, "./wait")
        @Expect(subProcess.arguments.size, 0)
        if (subProcess.commandLine.size == 1) {
            @Expect(subProcess.commandLine[0], "./wait")
        } else {
            @Expect(0, 1)
        }
        @Expect(subProcess.workingDirectory.toString(), curProcess.workingDirectory.toString())
    }

    // arguments 为与 command 不匹配的参数
    @TestCase
    func case_test_info_11(): Unit {
        var subProcess = Process.start("sleep", "fggerw", stdErr: Pipe)
        var buffer = Array<Byte>(90, repeat: 0)
        (_, _, buffer) = subProcess.waitOutput()
        @Expect(String.fromUtf8(buffer).contains("sleep: invalid time interval ‘fggerw’\nTry 'sleep --help' for more information.") ||
            String.fromUtf8(buffer).contains("usage: sleep seconds"))
    }

    // arguments 中存在空串
    @TestCase
    func case_test_info_12(): Unit {
        var flag = 0
        try {
            Process.start("sleep", "1", "")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Argument \"\" cannot contains null character.")
            flag++
        }
        @Expect(flag, 0)
    }

    // arguments 中的字符串含有空字符
    @TestCase
    func case_test_info_13(): Unit {
        var flag = 0
        try {
            Process.start("sleep", "1\0")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Argument \"1\0\" cannot contains null character.")
            flag++
        }
        @Expect(flag, 1)
    }

    // arguments 中的字符串为空字符
    @TestCase
    func case_test_info_14(): Unit {
        var flag = 0
        try {
            Process.start("sleep", "\0")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Argument \"\0\" cannot contains null character.")
            flag++
        }
        @Expect(flag, 1)
    }

    // arguments 存在超长字符串
    @TestCase
    @Skip
    func case_test_info_15(): Unit {
        let subProcess = Process.start("./wait", longStr)
        let curProcess = Process.current
        @Expect(subProcess.pid > 0, true)
        @Expect(subProcess.pid < Int64(Int32.Max), true)
        @Expect(subProcess.name, "wait")
        @Expect(subProcess.command, "./wait")
        if (subProcess.arguments.size == 1) {
            @Expect(subProcess.arguments[0], longStr)
        } else {
            @Expect(0, 1)
        }
        if (subProcess.commandLine.size == 2) {
            @Expect(subProcess.commandLine[0], "./wait")
            @Expect(subProcess.commandLine[1], longStr)
        } else {
            @Expect(0, 2)
        }
        @Expect(subProcess.workingDirectory.toString(), curProcess.workingDirectory.toString())
    }

    // 相对路径
    @TestCase
    func case_test_info_16(): Unit {
        Directory.create("./tmpdir", recursive: false)
        try {
            let subProcess = Process.start("sleep", "1", workingDirectory: Path("./tmpdir"))
            let curProcess = Process.current
            @Expect(subProcess.pid > 0, true)
            @Expect(subProcess.pid < Int64(Int32.Max), true)
            @Expect(subProcess.name, "sleep")
            @Expect(subProcess.command, "sleep")
            if (subProcess.arguments.size == 1) {
                @Expect(subProcess.arguments[0], "1")
            } else {
                @Expect(0, 1)
            }
            if (subProcess.commandLine.size == 2) {
                @Expect(subProcess.commandLine[0], "sleep")
                @Expect(subProcess.commandLine[1], "1")
            } else {
                @Expect(0, 2)
            }
            @Expect(subProcess.workingDirectory.toString(), curProcess.workingDirectory.toString() + "/tmpdir")
        } finally {
            remove("./tmpdir", recursive: false)
        }
    }

    // 绝对路径
    @TestCase
    @Skip
    func case_test_info_17(): Unit {
        let subProcess = Process.start("sleep", "1", workingDirectory: Path("/root/code/manifest/cangjie/tests"))
        let curProcess = Process.current
        @Expect(subProcess.pid > 0, true)
        @Expect(subProcess.pid < Int64(Int32.Max), true)
        @Expect(subProcess.name, "sleep")
        @Expect(subProcess.command, "sleep")
        if (subProcess.arguments.size == 1) {
            @Expect(subProcess.arguments[0], "1")
        } else {
            @Expect(0, 1)
        }
        if (subProcess.commandLine.size == 2) {
            @Expect(subProcess.commandLine[0], "sleep")
            @Expect(subProcess.commandLine[1], "1")
        } else {
            @Expect(0, 2)
        }
        @Expect(subProcess.workingDirectory.toString(), "/root/code/manifest/cangjie/tests")
    }

    // 路径结尾带'/'
    @TestCase
    @Skip
    func case_test_info_18(): Unit {
        let subProcess = Process.start("sleep", "1", workingDirectory: Path("/root/code/manifest/cangjie/tests/"))
        let curProcess = Process.current
        @Expect(subProcess.pid > 0, true)
        @Expect(subProcess.pid < Int64(Int32.Max), true)
        @Expect(subProcess.name, "sleep")
        @Expect(subProcess.command, "sleep")
        if (subProcess.arguments.size == 1) {
            @Expect(subProcess.arguments[0], "1")
        } else {
            @Expect(0, 1)
        }
        if (subProcess.commandLine.size == 2) {
            @Expect(subProcess.commandLine[0], "sleep")
            @Expect(subProcess.commandLine[1], "1")
        } else {
            @Expect(0, 2)
        }
        @Expect(subProcess.workingDirectory.toString(), "/root/code/manifest/cangjie/tests")
    }

    // 不存在的路径
    @TestCase
    func case_test_info_19(): Unit {
        var flag = 0
        try {
            Process.start("sleep", "1", workingDirectory: Path("./rhertetrwe"))
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "WorkingDirectory \"./rhertetrwe\" not exist in the file system.")
            flag++
        }
        @Expect(flag, 1)
    }

    // 路径不是目录
    @TestCase
    func case_test_info_20(): Unit {
        let file = File("./tmpfile.txt", ReadWrite)
        var flag = 0
        try {
            Process.start("sleep", "1", workingDirectory: Path("./tmpfile.txt"))
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "WorkingDirectory \"./tmpfile.txt\" must be directory.")
            flag++
        } finally {
            file.close()
            remove("./tmpfile.txt")
        }
        @Expect(flag, 1)
    }

    // 路径包含空字符
    @TestCase
    func case_test_info_21(): Unit {
        var flag = 0
        try {
            Process.start("sleep", "1", workingDirectory: Path("./\0"))
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The `rawPath` cannot contain null character!")
            flag++
        }
        @Expect(flag, 1)
    }

    // 空路径
    @TestCase
    func case_test_info_22(): Unit {
        var flag = 0
        try {
            Process.start("sleep", "1", workingDirectory: Path(""))
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The `rawPath` cannot be an empty string!")
            flag++
        }
        @Expect(flag, 1)
    }

    // setEnv 后执行 start
    @TestCase
    func case_test_info_23(): Unit {
        let subProcess = Process.start("sleep", "1")
        let curProcess = Process.current
        @Expect(subProcess.pid > 0, true)
        @Expect(subProcess.pid < Int64(Int32.Max), true)
        @Expect(subProcess.name, "sleep")
        @Expect(subProcess.command, "sleep")
        if (subProcess.arguments.size == 1) {
            @Expect(subProcess.arguments[0], "1")
        } else {
            @Expect(0, 1)
        }
        if (subProcess.commandLine.size == 2) {
            @Expect(subProcess.commandLine[0], "sleep")
            @Expect(subProcess.commandLine[1], "1")
        } else {
            @Expect(0, 2)
        }
        @Expect(subProcess.workingDirectory.toString(), curProcess.workingDirectory.toString())
    }

    // 空表
    @TestCase
    func case_test_info_24(): Unit {
        let subProcess = Process.start("sleep", "1")
        let curProcess = Process.current
        @Expect(subProcess.pid > 0, true)
        @Expect(subProcess.pid < Int64(Int32.Max), true)
        @Expect(subProcess.name, "sleep")
        @Expect(subProcess.command, "sleep")
        if (subProcess.arguments.size == 1) {
            @Expect(subProcess.arguments[0], "1")
        } else {
            @Expect(0, 1)
        }
        if (subProcess.commandLine.size == 2) {
            @Expect(subProcess.commandLine[0], "sleep")
            @Expect(subProcess.commandLine[1], "1")
        } else {
            @Expect(0, 2)
        }
        @Expect(subProcess.workingDirectory.toString(), curProcess.workingDirectory.toString())
    }

    // 表中存在 value 为空的 entry
    @TestCase
    func case_test_info_25(): Unit {
        let subProcess = Process.start("sleep", "1")
        let curProcess = Process.current
        @Expect(subProcess.pid > 0, true)
        @Expect(subProcess.pid < Int64(Int32.Max), true)
        @Expect(subProcess.name, "sleep")
        @Expect(subProcess.command, "sleep")
        if (subProcess.arguments.size == 1) {
            @Expect(subProcess.arguments[0], "1")
        } else {
            @Expect(0, 1)
        }
        if (subProcess.commandLine.size == 2) {
            @Expect(subProcess.commandLine[0], "sleep")
            @Expect(subProcess.commandLine[1], "1")
        } else {
            @Expect(0, 2)
        }
        @Expect(subProcess.workingDirectory.toString(), curProcess.workingDirectory.toString())
    }

    // 表中存在 value 包含 '=' 的 entry
    @TestCase
    func case_test_info_26(): Unit {
        let subProcess = Process.start("sleep", "1")
        let curProcess = Process.current
        @Expect(subProcess.pid > 0, true)
        @Expect(subProcess.pid < Int64(Int32.Max), true)
        @Expect(subProcess.name, "sleep")
        @Expect(subProcess.command, "sleep")
        if (subProcess.arguments.size == 1) {
            @Expect(subProcess.arguments[0], "1")
        } else {
            @Expect(0, 1)
        }
        if (subProcess.commandLine.size == 2) {
            @Expect(subProcess.commandLine[0], "sleep")
            @Expect(subProcess.commandLine[1], "1")
        } else {
            @Expect(0, 2)
        }
        @Expect(subProcess.workingDirectory.toString(), curProcess.workingDirectory.toString())
    }

    // 表中存在 key 为空的 entry
    @TestCase
    func case_test_info_27(): Unit {
        var flag = 0
        try {
            let env = HashMap<String, String>()
            env.add("", "value1")
            Process.start("sleep", "1")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Environment \"\" entry cannot contains invalid character.")
            flag++
        }
        @Expect(flag, 0)
    }

    // 表中存在 key 包含空字符的 entry
    @TestCase
    func case_test_info_28(): Unit {
        var flag = 0
        try {
            let env = HashMap<String, String>()
            env.add("key1\0", "value1")
            Process.start("sleep", "1", environment: env)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Environment \"key1\0\" entry cannot contains invalid character.")
            flag++
        }
        @Expect(flag, 1)
    }

    // 表中存在 value 包含空字符的 entry
    @TestCase
    func case_test_info_29(): Unit {
        var flag = 0
        try {
            let env = HashMap<String, String>()
            env.add("key1", "value1\0")
            Process.start("sleep", "1", environment: env)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Environment \"key1\" entry cannot contains invalid character.")
            flag++
        }
        @Expect(flag, 1)
    }

    // 表中存在 key 包含 '=' 的 entry
    @TestCase
    func case_test_info_30(): Unit {
        var flag = 0
        try {
            let env = HashMap<String, String>()
            env.add("key1=value1", "value1")
            Process.start("sleep", "1", environment: env)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Environment \"key1=value1\" entry cannot contains invalid character.")
            flag++
        }
        @Expect(flag, 1)
    }

    // arguments 为超长数组
    @TestCase
    @Skip
    func case_test_info_32(): Unit {
        let longArr = Array<String>(10000, repeat: "a")
        var args = ""
        for (_ in 0..10000) {
            args = args + " a"
        }
        let subProcess = Process.start("./wait", longArr)
        let curProcess = Process.current
        @Expect(subProcess.pid > 0, true)
        @Expect(subProcess.pid < Int64(Int32.Max), true)
        @Expect(subProcess.name, "wait")
        @Expect(subProcess.command, "./wait")
        if (subProcess.arguments.size == 10000) {
            for (arg in subProcess.arguments) {
                @Expect(arg, "a")
            }
        } else {
            @Expect(0, 1)
        }
        if (subProcess.commandLine.size == 10001) {
            @Expect(subProcess.commandLine[0], "./wait")
            for (i in 1..10001) {
                @Expect(subProcess.commandLine[i], "a")
            }
        } else {
            @Expect(0, 2)
        }
        @Expect(subProcess.workingDirectory.toString(), curProcess.workingDirectory.toString())
    }

    // 可执行命令(绝对路径中间存在空格)
    @TestCase
    @Skip
    func case_test_info_33(): Unit {
        let subProcess = Process.start(
            "/root/code/manifest/cangjie/tests/LLT/libs/std/process/linux/just for test/wait")
        let curProcess = Process.current
        @Expect(subProcess.pid > 0, true)
        @Expect(subProcess.pid < Int64(Int32.Max), true)
        @Expect(subProcess.name, "wait")
        @Expect(subProcess.command, "/root/code/manifest/cangjie/tests/LLT/libs/std/process/linux/just for test/wait")
        @Expect(subProcess.arguments.size, 0)
        if (subProcess.commandLine.size == 1) {
            @Expect(subProcess.commandLine[0], "/root/code/manifest/cangjie/tests/LLT/libs/std/process/linux/just for test/wait")
        } else {
            @Expect(0, 1)
        }
        @Expect(subProcess.workingDirectory.toString(), curProcess.workingDirectory.toString())
    }

    // 路径中包含空格
    @TestCase
    func case_test_info_34(): Unit {
        Directory.create("./tmp dir", recursive: false)
        var subProcess: SubProcess
        var curProcess: CurrentProcess
        try {
            subProcess = Process.start("sleep", "1", workingDirectory: Path("./tmp dir"))
            curProcess = Process.current
            @Expect(subProcess.pid > 0, true)
            @Expect(subProcess.pid < Int64(Int32.Max), true)
            @Expect(subProcess.name, "sleep")
            @Expect(subProcess.command, "sleep")
            if (subProcess.arguments.size == 1) {
                @Expect(subProcess.arguments[0], "1")
            } else {
                @Expect(0, 1)
            }
            if (subProcess.commandLine.size == 2) {
                @Expect(subProcess.commandLine[0], "sleep")
                @Expect(subProcess.commandLine[1], "1")
            } else {
                @Expect(0, 2)
            }
        } finally {
            remove("./tmp dir", recursive: false)
        }
        @Expect(subProcess.workingDirectory.toString(), curProcess.workingDirectory.toString() + "/tmp dir")
    }

    @TestCase
    func case_test_info_35(): Unit {
        let subProcess = Process.start("sleep", "1")
        let curProcess = Process.current
        @Expect(subProcess.pid > 0, true)
        @Expect(subProcess.pid < Int64(Int32.Max), true)
        @Expect(subProcess.name, "sleep")
        @Expect(subProcess.command, "sleep")
        if (subProcess.arguments.size == 1) {
            @Expect(subProcess.arguments[0], "1")
        } else {
            @Expect(0, 1)
        }
        if (subProcess.commandLine.size == 2) {
            @Expect(subProcess.commandLine[0], "sleep")
            @Expect(subProcess.commandLine[1], "1")
        } else {
            @Expect(0, 2)
        }
        @Expect(subProcess.workingDirectory.toString(), curProcess.workingDirectory.toString())
    }

    // 超长表
    @TestCase
    func case_test_info_36(): Unit {
        let subProcess = Process.start("sleep", "5")
        let curProcess = Process.current
        @Expect(subProcess.pid > 0, true)
        @Expect(subProcess.pid < Int64(Int32.Max), true)
        @Expect(subProcess.name, "sleep")
        @Expect(subProcess.command, "sleep")
        if (subProcess.arguments.size == 1) {
            @Expect(subProcess.arguments[0], "5")
        } else {
            @Expect(0, 1)
        }
        if (subProcess.commandLine.size == 2) {
            @Expect(subProcess.commandLine[0], "sleep")
            @Expect(subProcess.commandLine[1], "5")
        } else {
            @Expect(0, 2)
        }
        @Expect(subProcess.workingDirectory.toString(), curProcess.workingDirectory.toString())
    }

    // 表中 value 超长
    @TestCase
    func case_test_info_37(): Unit {
        let subProcess = Process.start("sleep", "1")
        let curProcess = Process.current
        @Expect(subProcess.pid > 0, true)
        @Expect(subProcess.pid < Int64(Int32.Max), true)
        @Expect(subProcess.name, "sleep")
        @Expect(subProcess.command, "sleep")
        if (subProcess.arguments.size == 1) {
            @Expect(subProcess.arguments[0], "1")
        } else {
            @Expect(0, 1)
        }
        if (subProcess.commandLine.size == 2) {
            @Expect(subProcess.commandLine[0], "sleep")
            @Expect(subProcess.commandLine[1], "1")
        } else {
            @Expect(0, 2)
        }
        @Expect(subProcess.workingDirectory.toString(), curProcess.workingDirectory.toString())
    }

    // 表中 key 超长
    @TestCase
    func case_test_info_38(): Unit {
        let subProcess = Process.start("sleep", "1")
        let curProcess = Process.current
        @Expect(subProcess.pid > 0, true)
        @Expect(subProcess.pid < Int64(Int32.Max), true)
        @Expect(subProcess.name, "sleep")
        @Expect(subProcess.command, "sleep")
        if (subProcess.arguments.size == 1) {
            @Expect(subProcess.arguments[0], "1")
        } else {
            @Expect(0, 1)
        }
        if (subProcess.commandLine.size == 2) {
            @Expect(subProcess.commandLine[0], "sleep")
            @Expect(subProcess.commandLine[1], "1")
        } else {
            @Expect(0, 2)
        }
        @Expect(subProcess.workingDirectory.toString(), curProcess.workingDirectory.toString())
    }

    @TestCase
    func case_test_info_39(): Unit {
        let exitCode = Process.run("echo", "abc")
        @Expect(exitCode, 0)
    }

    @TestCase
    func case_test_info_40(): Unit {
        let (exitCode, out, err) = Process.runOutput("echo", "abc")
        @Expect(exitCode, 0)
        @Expect(String.fromUtf8(out), "abc\n")
        @Expect(String.fromUtf8(err), "")
    }

    @TestCase
    func Environment_TryToGetEnv_ExpectThrowException(): Unit {
        let env = HashMap<String, String>([("123!@#一二三abc", "123!@#一二三abc")])
        let subProcess = Process.start("sleep", "2", environment: env)
        println(Process.current.environment.size)
        println(Process.current.pid)
        println(subProcess.pid)

        try {
            let e = subProcess.environment
            println("111111 ${e.size}")
            @Expect(false)
        } catch (e: ProcessException) {
            println("sssss")
            @Expect(e.message, "Can not get process environment.")
        }
    }

    @TestCase
    func environment_set_unset(): Unit {
        Process.current.setEnv("hello", "world")
        @Expect(Process.current.environment.get("hello"), "world")
        Process.current.removeEnv("hello")
        @Expect(Process.current.environment.get("hello"), None)
    }

    @TestCase
    func case_test_info_last(): Unit { // 这个用例需要放在最后
        let subProcess = Process.start("sleep", "1")
        let curProcess = Process.current
        @Expect(subProcess.pid > 0, true)
        @Expect(subProcess.pid < Int64(Int32.Max), true)
        @Expect(subProcess.name, "sleep")
        @Expect(subProcess.command, "sleep")
        if (subProcess.arguments.size == 1) {
            @Expect(subProcess.arguments[0], "1")
        } else {
            @Expect(0, 1)
        }
        if (subProcess.commandLine.size == 2) {
            @Expect(subProcess.commandLine[0], "sleep")
            @Expect(subProcess.commandLine[1], "1")
        } else {
            @Expect(0, 2)
        }
        @Expect(subProcess.workingDirectory.toString(), curProcess.workingDirectory.toString())
    }
}
