/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// (Windows)EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// (Windows)EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT:regex-begin .*PASSED.*: 70,.*SKIPPED.*: 16,.*ERROR.*: 0
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

@Test
public class Test_subProcess_info {
    func checkInfo(process: Process) {
        var flag = 0
        try {
            process.arguments
        } catch (e: ProcessException) {
            @Expect(e.message, "Can not get process arguments.")
            flag++
        }
        try {
            process.commandLine
        } catch (e: ProcessException) {
            @Expect(e.message, "Can not get process commandLine.")
            flag++
        }
        try {
            process.workingDirectory
        } catch (e: ProcessException) {
            @Expect(e.message, "Can not get process workingDirectory.")
            flag++
        }
        try {
            process.environment
        } catch (e: ProcessException) {
            @Expect(e.message, "Can not get process environment.")
            flag++
        }
        @Expect(flag, 4)
    }

    // 执行立刻完成的Shell命令
    @TestCase
    func case_test_info_1(): Unit {
        let subProcess = Process.start("cmd", "/c", "echo", "abc")
        try {
            @Expect(subProcess.pid > 0, true)
            @Expect(subProcess.pid < Int64(Int32.Max), true)
            @Expect(subProcess.name, "cmd.exe")
            @Expect(subProcess.command, "C:\\Windows\\System32\\cmd.exe")
            checkInfo(subProcess)
        } catch (e: ProcessException) {} // 概率获取不到子进程信息，因为该子进程会立即结束
    }

    // 执行需要等待一段时间才能结束的Shell命令
    @TestCase
    func case_test_info_2(): Unit {
        let subProcess = Process.start("cmd.exe", "/c", "timeout", "/T", "1")
        @Expect(subProcess.pid > 0, true)
        @Expect(subProcess.pid < Int64(Int32.Max), true)
        @Expect(subProcess.name, "cmd.exe")
        @Expect(subProcess.command, "C:\\Windows\\System32\\cmd.exe")
        checkInfo(subProcess)
    }

    // 自定义可执行文件，如仓颉编译完成代码
    @TestCase
    @Skip
    func case_test_info_3(): Unit {
        let subProcess = Process.start("./wait")
        @Expect(subProcess.pid > 0, true)
        @Expect(subProcess.pid < Int64(Int32.Max), true)
        @Expect(subProcess.name, "wait")
        @Expect(subProcess.command, "./wait")
        checkInfo(subProcess)
    }

    // 可执行命令(相对路径中间存在空格)
    @TestCase
    @Skip
    func case_test_info_4(): Unit {
        let subProcess = Process.start("./tests/LLT/libs/std/process/linux/just for test/wait")
        @Expect(subProcess.pid > 0, true)
        @Expect(subProcess.pid < Int64(Int32.Max), true)
        @Expect(subProcess.name, "wait")
        @Expect(subProcess.command, "./tests/LLT/libs/std/process/linux/just for test/wait")
        checkInfo(subProcess)
    }

    // 不存在的 shell 命令
    @TestCase
    func case_test_info_5(): Unit {
        var flag = 0
        try {
            Process.start("abc")
        } catch (e: ProcessException) {
            @Expect((e.message.contains("The system cannot find the file specified.")))
            flag++
        }
        @Expect(flag, 1)
    }

    @TestCase
    func case_test_info_6(): Unit {
        var flag = 0
        try {
            Process.start("")
        } catch (e: ProcessException) {
            @Expect((e.message.contains("The parameter is incorrect.")))
            flag++
        }
        @Expect(flag, 1)
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
            Process.start("cmd\0", "/c", "echo", "abc")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Command \"cmd\0\" cannot contains null character.")
            flag++
        }
        @Expect(flag, 1)
    }

    // 对应工作路径下不存在对应的可执行文件
    @TestCase
    func case_test_info_9(): Unit {
        var flag = 0
        try {
            Process.start("./jrdtdaryjuykwsasda")
        } catch (e: ProcessException) {
            @Expect((e.message.contains("The system cannot find the file specified.")))
            flag++
        }
        @Expect(flag, 1)
    }

    @TestCase
    @Skip
    func case_test_info_10(): Unit {
        let subProcess = Process.start("./wait", Array<String>())
        @Expect(subProcess.pid > 0, true)
        @Expect(subProcess.pid < Int64(Int32.Max), true)
        @Expect(subProcess.name, "wait")
        @Expect(subProcess.command, "./wait")
        checkInfo(subProcess)
    }

    // arguments 为与 command 不匹配的参数
    @TestCase
    func case_test_info_11(): Unit {
        var subProcess = Process.start("cmd.exe", "/c", "timeout", "/T", "fggerw", stdErr: Pipe)
        var (_, _, buffer) = subProcess.waitOutput()
        @Expect(String.fromUtf8(buffer), "ERROR: Invalid value for timeout (/T) specified. Valid range is -1 to 99999.\r\n")
    }

    // arguments 中存在空串
    @TestCase
    func case_test_info_12(): Unit {
        var flag = 0
        try {
            Process.start("cmd.exe", "/c", "timeout", "/T", "")
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
            Process.start("cmd.exe", "/c", "timeout", "/T", "1\0")
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
            Process.start("cmd.exe", "/c", "timeout", "/T", "\0")
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
        @Expect(subProcess.pid > 0, true)
        @Expect(subProcess.pid < Int64(Int32.Max), true)
        @Expect(subProcess.name, "wait")
        @Expect(subProcess.command, "./wait")
        checkInfo(subProcess)
    }

    // 相对路径
    @TestCase
    func case_test_info_16(): Unit {
        Directory.create("./tmpdir", recursive: false)
        try {
            let subProcess = Process.start("cmd.exe", "/c", "timeout", "/T", "1", workingDirectory: Path("./tmpdir"))
            @Expect(subProcess.pid > 0, true)
            @Expect(subProcess.pid < Int64(Int32.Max), true)
            @Expect(subProcess.name, "cmd.exe")
            @Expect(subProcess.command, "C:\\Windows\\System32\\cmd.exe")
            checkInfo(subProcess)
            subProcess.wait()
        } finally {
            remove("./tmpdir", recursive: false)
        }
    }

    // 绝对路径
    @TestCase
    @Skip
    func case_test_info_17(): Unit {
        let subProcess = Process.start("cmd.exe", "/c", "timeout", "/T", "1",
            workingDirectory: Path("/root/code/manifest/cangjie/tests"))
        @Expect(subProcess.pid > 0, true)
        @Expect(subProcess.pid < Int64(Int32.Max), true)
        @Expect(subProcess.name, "cmd.exe")
        @Expect(subProcess.command, "C:\\Windows\\System32\\cmd.exe")
        checkInfo(subProcess)
    }

    // 路径结尾带'/'
    @TestCase
    @Skip
    func case_test_info_18(): Unit {
        let subProcess = Process.start("cmd.exe", "/c", "timeout", "/T", "1",
            workingDirectory: Path("/root/code/manifest/cangjie/tests/"))
        @Expect(subProcess.pid > 0, true)
        @Expect(subProcess.pid < Int64(Int32.Max), true)
        @Expect(subProcess.name, "cmd.exe")
        @Expect(subProcess.command, "C:\\Windows\\System32\\cmd.exe")
    }

    // 不存在的路径
    @TestCase
    func case_test_info_19(): Unit {
        var flag = 0
        try {
            Process.start("cmd.exe", "/c", "timeout", "/T", "1", workingDirectory: Path("./rhertetrwe"))
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
            Process.start("cmd.exe", "/c", "timeout", "/T", "1", workingDirectory: Path("./tmpfile.txt"))
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
            Process.start("cmd.exe", "/c", "timeout", "/T", "1", workingDirectory: Path("./\0"))
        } catch (e: IllegalArgumentException) {
            flag++
        }
        @Expect(flag, 1)
    }

    // 空路径
    @TestCase
    func case_test_info_22(): Unit {
        var flag = 0
        try {
            Process.start("cmd.exe", "/c", "timeout", "/T", "1", workingDirectory: Path(""))
        } catch (e: IllegalArgumentException) {
            flag++
        }
        @Expect(flag, 1)
    }

    // Process.current.setEnv 后执行 start
    @TestCase
    func case_test_info_23(): Unit {
        Process.current.setEnv("key1", "value1")
        let subProcess = Process.start("cmd.exe", "/c", "timeout", "/T", "1")
        @Expect(subProcess.pid > 0, true)
        @Expect(subProcess.pid < Int64(Int32.Max), true)
        @Expect(subProcess.name, "cmd.exe")
        @Expect(subProcess.command, "C:\\Windows\\System32\\cmd.exe")
        checkInfo(subProcess)
        Process.current.removeEnv("key1")
    }

    // 空表
    @TestCase
    func case_test_info_24(): Unit {
        let env = HashMap<String, String>()
        let subProcess = Process.start("cmd.exe", "/c", "timeout", "/T", "1", environment: env)
        @Expect(subProcess.pid > 0, true)
        @Expect(subProcess.pid < Int64(Int32.Max), true)
        @Expect(subProcess.name, "cmd.exe")
        @Expect(subProcess.command, "C:\\Windows\\System32\\cmd.exe")
        checkInfo(subProcess)
    }

    // 表中存在 value 为空的 entry
    @TestCase
    func case_test_info_25(): Unit {
        let env = HashMap<String, String>()
        env.add("key1", "value1")
        env.add("key2", "")
        let subProcess = Process.start("cmd.exe", "/c", "timeout", "/T", "1", environment: env)
        @Expect(subProcess.pid > 0, true)
        @Expect(subProcess.pid < Int64(Int32.Max), true)
        @Expect(subProcess.name, "cmd.exe")
        @Expect(subProcess.command, "C:\\Windows\\System32\\cmd.exe")
        checkInfo(subProcess)
    }

    // 表中存在 value 包含 '=' 的 entry
    @TestCase
    func case_test_info_26(): Unit {
        let env = HashMap<String, String>()
        env.add("key1", "value1")
        env.add("key2", "key2=value2")
        let subProcess = Process.start("cmd.exe", "/c", "timeout", "/T", "1", environment: env)
        @Expect(subProcess.pid > 0, true)
        @Expect(subProcess.pid < Int64(Int32.Max), true)
        @Expect(subProcess.name, "cmd.exe")
        @Expect(subProcess.command, "C:\\Windows\\System32\\cmd.exe")
        checkInfo(subProcess)
    }

    // 表中存在 key 为空的 entry
    @TestCase
    func case_test_info_27(): Unit {
        var flag = 0
        try {
            let env = HashMap<String, String>()
            env.add("", "value1")
            Process.start("cmd.exe", "/c", "timeout", "/T", "1", environment: env)
        } catch (e: ProcessException) {
            @Expect((e.message.contains("The parameter is incorrect.")))
            flag++
        }
        @Expect(flag, 1)
    }

    // 表中存在 key 包含空字符的 entry
    @TestCase
    func case_test_info_28(): Unit {
        var flag = 0
        try {
            let env = HashMap<String, String>()
            env.add("key1\0", "value1")
            Process.start("cmd.exe", "/c", "timeout", "/T", "1", environment: env)
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
            Process.start("cmd.exe", "/c", "timeout", "/T", "1", environment: env)
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
            Process.start("cmd.exe", "/c", "timeout", "/T", "1", environment: env)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Environment \"key1=value1\" entry cannot contains invalid character.")
            flag++
        }
        @Expect(flag, 1)
    }

    // command 为超长字符串
    @TestCase
    func case_test_info_31(): Unit {
        var flag = 0
        try {
            Process.start(longStr)
        } catch (e: ProcessException) {
            @Expect((e.message.contains("The filename or extension is too long.")))
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
        @Expect(subProcess.pid > 0, true)
        @Expect(subProcess.pid < Int64(Int32.Max), true)
        @Expect(subProcess.name, "wait.exe")
        @Expect(subProcess.command, "./wait.exe")
        checkInfo(subProcess)
    }

    // 可执行命令(绝对路径中间存在空格)
    @TestCase
    @Skip
    func case_test_info_33(): Unit {
        let subProcess = Process.start(
            "/root/code/manifest/cangjie/tests/LLT/libs/std/process/linux/just for test/wait")
        @Expect(subProcess.pid > 0, true)
        @Expect(subProcess.pid < Int64(Int32.Max), true)
        @Expect(subProcess.name, "wait")
        @Expect(subProcess.command, "/root/code/manifest/cangjie/tests/LLT/libs/std/process/linux/just for test/wait")
        checkInfo(subProcess)
    }

    // 路径中包含空格
    @TestCase
    func case_test_info_34(): Unit {
        Directory.create("./tmp dir", recursive: false)
        try {
            var subProcess = Process.start("cmd.exe", "/c", "timeout", "/T", "1", workingDirectory: Path("./tmp dir"))
            @Expect(subProcess.pid > 0, true)
            @Expect(subProcess.pid < Int64(Int32.Max), true)
            @Expect(subProcess.name, "cmd.exe")
            @Expect(subProcess.command, "C:\\Windows\\System32\\cmd.exe")
            checkInfo(subProcess)
            subProcess.wait()
        } finally {
            remove("./tmp dir", recursive: false)
        }
    }

    @TestCase
    func case_test_info_35(): Unit {
        Process.current.setEnv("key1", longStr)
        let subProcess = Process.start("cmd.exe", "/c", "timeout", "/T", "1")
        @Expect(subProcess.pid > 0, true)
        @Expect(subProcess.pid < Int64(Int32.Max), true)
        @Expect(subProcess.name, "cmd.exe")
        @Expect(subProcess.command, "C:\\Windows\\System32\\cmd.exe")
        checkInfo(subProcess)
        Process.current.removeEnv("key1")
    }

    // 超长表
    @TestCase
    func case_test_info_36(): Unit {
        let env = HashMap<String, String>(100000)
        for (i in 0..100000) {
            env.add("${i}", "${i}")
        }
        let subProcess = Process.start("cmd.exe", "/c", "timeout", "/T", "1", environment: env)
        @Expect(subProcess.pid > 0, true)
        @Expect(subProcess.pid < Int64(Int32.Max), true)
        @Expect(subProcess.name, "cmd.exe")
        @Expect(subProcess.command, "C:\\Windows\\System32\\cmd.exe")
        checkInfo(subProcess)
    }

    // 表中 value 超长
    @TestCase
    func case_test_info_37(): Unit {
        let env = HashMap<String, String>()
        env.add("key1", longStr)
        let subProcess = Process.start("cmd.exe", "/c", "timeout", "/T", "1", environment: env)
        @Expect(subProcess.pid > 0, true)
        @Expect(subProcess.pid < Int64(Int32.Max), true)
        @Expect(subProcess.name, "cmd.exe")
        @Expect(subProcess.command, "C:\\Windows\\System32\\cmd.exe")
        checkInfo(subProcess)
    }

    // 表中 key 超长
    @TestCase
    func case_test_info_38(): Unit {
        let env = HashMap<String, String>()
        env.add(longStr, "value1")
        let subProcess = Process.start("cmd.exe", "/c", "timeout", "/T", "1", environment: env)
        @Expect(subProcess.pid > 0, true)
        @Expect(subProcess.pid < Int64(Int32.Max), true)
        @Expect(subProcess.name, "cmd.exe")
        @Expect(subProcess.command, "C:\\Windows\\System32\\cmd.exe")
        checkInfo(subProcess)
    }

    @TestCase
    func case_test_info_39(): Unit {
        let exitCode = Process.run("cmd.exe", "/c", "echo", "abc")
        @Expect(exitCode, 0)
    }

    @TestCase
    func case_test_info_39_execute(): Unit {
        let exitCode = execute("cmd.exe", "/c", "echo", "abc")
        @Expect(exitCode, 0)
    }

    @TestCase
    func case_test_info_40(): Unit {
        let (exitCode, out, err) = Process.runOutput("cmd.exe", "/c", "echo", "abc")
        @Expect(exitCode, 0)
        @Expect(String.fromUtf8(out), "abc\r\n")
        @Expect(String.fromUtf8(err), "")
    }

    @TestCase
    func case_test_info_40_execute(): Unit {
        let (exitCode, out, err) = executeWithOutput("cmd.exe", "/c", "echo", "abc")
        @Expect(exitCode, 0)
        @Expect(String.fromUtf8(out), "abc\r\n")
        @Expect(String.fromUtf8(err), "")
    }

    @TestCase
    func case_test_info_41(): Unit {
        let env = HashMap<String, String>([("123!@#一二三abc", "123!@#一二三abc")])
        let subProcess = Process.start("cmd.exe", "/c", "timeout", "/T", "1", environment: env)
        @Expect(subProcess.name, "cmd.exe")
        @Expect(subProcess.command, "C:\\Windows\\System32\\cmd.exe")
        checkInfo(subProcess)
    }

    // removeEnv 后执行 start
    @TestCase
    func case_test_info_last(): Unit { // 这个用例需要放在最后
        Process.current.removeEnv("USER")
        let subProcess = Process.start("cmd.exe", "/c", "timeout", "/T", "1")
        @Expect(subProcess.pid > 0, true)
        @Expect(subProcess.pid < Int64(Int32.Max), true)
        @Expect(subProcess.name, "cmd.exe")
        @Expect(subProcess.command, "C:\\Windows\\System32\\cmd.exe")
        checkInfo(subProcess)
    }
}

@Test
public class Test_subProcess_info_new {
    func checkInfo(process: Process) {
        var flag = 0
        try {
            process.arguments
        } catch (e: ProcessException) {
            @Expect(e.message, "Can not get process arguments.")
            flag++
        }
        try {
            process.commandLine
        } catch (e: ProcessException) {
            @Expect(e.message, "Can not get process commandLine.")
            flag++
        }
        try {
            process.workingDirectory
        } catch (e: ProcessException) {
            @Expect(e.message, "Can not get process workingDirectory.")
            flag++
        }
        try {
            process.environment
        } catch (e: ProcessException) {
            @Expect(e.message, "Can not get process environment.")
            flag++
        }
        @Expect(flag, 4)
    }

    // 执行立刻完成的Shell命令
    @TestCase
    func case_test_info_1(): Unit {
        let subProcess = launch("cmd", "/c", "echo", "abc")
        try {
            @Expect(subProcess.pid > 0, true)
            @Expect(subProcess.pid < Int64(Int32.Max), true)
            @Expect(subProcess.name, "cmd.exe")
            @Expect(subProcess.command, "C:\\Windows\\System32\\cmd.exe")
            checkInfo(subProcess)
        } catch (e: ProcessException) {} // 概率获取不到子进程信息，因为该子进程会立即结束
    }

    // 执行需要等待一段时间才能结束的Shell命令
    @TestCase
    func case_test_info_2(): Unit {
        let subProcess = launch("cmd.exe", "/c", "timeout", "/T", "1")
        @Expect(subProcess.pid > 0, true)
        @Expect(subProcess.pid < Int64(Int32.Max), true)
        @Expect(subProcess.name, "cmd.exe")
        @Expect(subProcess.command, "C:\\Windows\\System32\\cmd.exe")
        checkInfo(subProcess)
    }

    // 自定义可执行文件，如仓颉编译完成代码
    @TestCase
    @Skip
    func case_test_info_3(): Unit {
        let subProcess = launch("./wait")
        @Expect(subProcess.pid > 0, true)
        @Expect(subProcess.pid < Int64(Int32.Max), true)
        @Expect(subProcess.name, "wait")
        @Expect(subProcess.command, "./wait")
        checkInfo(subProcess)
    }

    // 可执行命令(相对路径中间存在空格)
    @TestCase
    @Skip
    func case_test_info_4(): Unit {
        let subProcess = launch("./tests/LLT/libs/std/process/linux/just for test/wait")
        @Expect(subProcess.pid > 0, true)
        @Expect(subProcess.pid < Int64(Int32.Max), true)
        @Expect(subProcess.name, "wait")
        @Expect(subProcess.command, "./tests/LLT/libs/std/process/linux/just for test/wait")
        checkInfo(subProcess)
    }

    // 不存在的 shell 命令
    @TestCase
    func case_test_info_5(): Unit {
        var flag = 0
        try {
            launch("abc")
        } catch (e: ProcessException) {
            @Expect((e.message.contains("The system cannot find the file specified.")))
            flag++
        }
        @Expect(flag, 1)
    }

    @TestCase
    func case_test_info_6(): Unit {
        var flag = 0
        try {
            launch("")
        } catch (e: ProcessException) {
            @Expect((e.message.contains("The parameter is incorrect.")))
            flag++
        }
        @Expect(flag, 1)
    }

    @TestCase
    func case_test_info_7(): Unit {
        var flag = 0
        try {
            launch("\0")
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
            launch("cmd\0", "/c", "echo", "abc")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Command \"cmd\0\" cannot contains null character.")
            flag++
        }
        @Expect(flag, 1)
    }

    // 对应工作路径下不存在对应的可执行文件
    @TestCase
    func case_test_info_9(): Unit {
        var flag = 0
        try {
            launch("./jrdtdaryjuykwsasda")
        } catch (e: ProcessException) {
            @Expect((e.message.contains("The system cannot find the file specified.")))
            flag++
        }
        @Expect(flag, 1)
    }

    @TestCase
    @Skip
    func case_test_info_10(): Unit {
        let subProcess = launch("./wait", Array<String>())
        @Expect(subProcess.pid > 0, true)
        @Expect(subProcess.pid < Int64(Int32.Max), true)
        @Expect(subProcess.name, "wait")
        @Expect(subProcess.command, "./wait")
        checkInfo(subProcess)
    }

    // arguments 为与 command 不匹配的参数
    @TestCase
    func case_test_info_11(): Unit {
        var subProcess = launch("cmd.exe", "/c", "timeout", "/T", "fggerw", stdErr: Pipe)
        var (_, _, buffer) = subProcess.waitOutput()
        @Expect(String.fromUtf8(buffer), "ERROR: Invalid value for timeout (/T) specified. Valid range is -1 to 99999.\r\n")
    }

    // arguments 中存在空串
    @TestCase
    func case_test_info_12(): Unit {
        var flag = 0
        try {
            launch("cmd.exe", "/c", "timeout", "/T", "")
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
            launch("cmd.exe", "/c", "timeout", "/T", "1\0")
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
            launch("cmd.exe", "/c", "timeout", "/T", "\0")
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
        let subProcess = launch("./wait", longStr)
        @Expect(subProcess.pid > 0, true)
        @Expect(subProcess.pid < Int64(Int32.Max), true)
        @Expect(subProcess.name, "wait")
        @Expect(subProcess.command, "./wait")
        checkInfo(subProcess)
    }

    // 相对路径
    @TestCase
    func case_test_info_16(): Unit {
        Directory.create("./tmpdir", recursive: false)
        try {
            let subProcess = launch("cmd.exe", "/c", "timeout", "/T", "1", workingDirectory: Path("./tmpdir"))
            @Expect(subProcess.pid > 0, true)
            @Expect(subProcess.pid < Int64(Int32.Max), true)
            @Expect(subProcess.name, "cmd.exe")
            @Expect(subProcess.command, "C:\\Windows\\System32\\cmd.exe")
            checkInfo(subProcess)
            subProcess.wait()
        } finally {
            remove("./tmpdir", recursive: false)
        }
    }

    // 绝对路径
    @TestCase
    @Skip
    func case_test_info_17(): Unit {
        let subProcess = launch("cmd.exe", "/c", "timeout", "/T", "1",
            workingDirectory: Path("/root/code/manifest/cangjie/tests"))
        @Expect(subProcess.pid > 0, true)
        @Expect(subProcess.pid < Int64(Int32.Max), true)
        @Expect(subProcess.name, "cmd.exe")
        @Expect(subProcess.command, "C:\\Windows\\System32\\cmd.exe")
        checkInfo(subProcess)
    }

    // 路径结尾带'/'
    @TestCase
    @Skip
    func case_test_info_18(): Unit {
        let subProcess = launch("cmd.exe", "/c", "timeout", "/T", "1",
            workingDirectory: Path("/root/code/manifest/cangjie/tests/"))
        @Expect(subProcess.pid > 0, true)
        @Expect(subProcess.pid < Int64(Int32.Max), true)
        @Expect(subProcess.name, "cmd.exe")
        @Expect(subProcess.command, "C:\\Windows\\System32\\cmd.exe")
    }

    // 不存在的路径
    @TestCase
    func case_test_info_19(): Unit {
        var flag = 0
        try {
            launch("cmd.exe", "/c", "timeout", "/T", "1", workingDirectory: Path("./rhertetrwe"))
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
            launch("cmd.exe", "/c", "timeout", "/T", "1", workingDirectory: Path("./tmpfile.txt"))
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
            launch("cmd.exe", "/c", "timeout", "/T", "1", workingDirectory: Path("./\0"))
        } catch (e: IllegalArgumentException) {
            flag++
        }
        @Expect(flag, 1)
    }

    // 空路径
    @TestCase
    func case_test_info_22(): Unit {
        var flag = 0
        try {
            launch("cmd.exe", "/c", "timeout", "/T", "1", workingDirectory: Path(""))
        } catch (e: IllegalArgumentException) {
            flag++
        }
        @Expect(flag, 1)
    }

    // Process.current.setEnv 后执行 start
    @TestCase
    func case_test_info_23(): Unit {
        Process.current.setEnv("key1", "value1")
        let subProcess = launch("cmd.exe", "/c", "timeout", "/T", "1")
        @Expect(subProcess.pid > 0, true)
        @Expect(subProcess.pid < Int64(Int32.Max), true)
        @Expect(subProcess.name, "cmd.exe")
        @Expect(subProcess.command, "C:\\Windows\\System32\\cmd.exe")
        checkInfo(subProcess)
        Process.current.removeEnv("key1")
    }

    // 空表
    @TestCase
    func case_test_info_24(): Unit {
        let env = HashMap<String, String>()
        let subProcess = launch("cmd.exe", "/c", "timeout", "/T", "1", environment: env)
        @Expect(subProcess.pid > 0, true)
        @Expect(subProcess.pid < Int64(Int32.Max), true)
        @Expect(subProcess.name, "cmd.exe")
        @Expect(subProcess.command, "C:\\Windows\\System32\\cmd.exe")
        checkInfo(subProcess)
    }

    // 表中存在 value 为空的 entry
    @TestCase
    func case_test_info_25(): Unit {
        let env = HashMap<String, String>()
        env.add("key1", "value1")
        env.add("key2", "")
        let subProcess = launch("cmd.exe", "/c", "timeout", "/T", "1", environment: env)
        @Expect(subProcess.pid > 0, true)
        @Expect(subProcess.pid < Int64(Int32.Max), true)
        @Expect(subProcess.name, "cmd.exe")
        @Expect(subProcess.command, "C:\\Windows\\System32\\cmd.exe")
        checkInfo(subProcess)
    }

    // 表中存在 value 包含 '=' 的 entry
    @TestCase
    func case_test_info_26(): Unit {
        let env = HashMap<String, String>()
        env.add("key1", "value1")
        env.add("key2", "key2=value2")
        let subProcess = launch("cmd.exe", "/c", "timeout", "/T", "1", environment: env)
        @Expect(subProcess.pid > 0, true)
        @Expect(subProcess.pid < Int64(Int32.Max), true)
        @Expect(subProcess.name, "cmd.exe")
        @Expect(subProcess.command, "C:\\Windows\\System32\\cmd.exe")
        checkInfo(subProcess)
    }

    // 表中存在 key 为空的 entry
    @TestCase
    func case_test_info_27(): Unit {
        var flag = 0
        try {
            let env = HashMap<String, String>()
            env.add("", "value1")
            launch("cmd.exe", "/c", "timeout", "/T", "1", environment: env)
        } catch (e: ProcessException) {
            @Expect((e.message.contains("The parameter is incorrect.")))
            flag++
        }
        @Expect(flag, 1)
    }

    // 表中存在 key 包含空字符的 entry
    @TestCase
    func case_test_info_28(): Unit {
        var flag = 0
        try {
            let env = HashMap<String, String>()
            env.add("key1\0", "value1")
            launch("cmd.exe", "/c", "timeout", "/T", "1", environment: env)
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
            launch("cmd.exe", "/c", "timeout", "/T", "1", environment: env)
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
            launch("cmd.exe", "/c", "timeout", "/T", "1", environment: env)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Environment \"key1=value1\" entry cannot contains invalid character.")
            flag++
        }
        @Expect(flag, 1)
    }

    // command 为超长字符串
    @TestCase
    func case_test_info_31(): Unit {
        var flag = 0
        try {
            launch(longStr)
        } catch (e: ProcessException) {
            @Expect((e.message.contains("The filename or extension is too long.")))
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
        let subProcess = launch("./wait", longArr)
        @Expect(subProcess.pid > 0, true)
        @Expect(subProcess.pid < Int64(Int32.Max), true)
        @Expect(subProcess.name, "wait.exe")
        @Expect(subProcess.command, "./wait.exe")
        checkInfo(subProcess)
    }

    // 可执行命令(绝对路径中间存在空格)
    @TestCase
    @Skip
    func case_test_info_33(): Unit {
        let subProcess = launch("/root/code/manifest/cangjie/tests/LLT/libs/std/process/linux/just for test/wait")
        @Expect(subProcess.pid > 0, true)
        @Expect(subProcess.pid < Int64(Int32.Max), true)
        @Expect(subProcess.name, "wait")
        @Expect(subProcess.command, "/root/code/manifest/cangjie/tests/LLT/libs/std/process/linux/just for test/wait")
        checkInfo(subProcess)
    }

    // 路径中包含空格
    @TestCase
    func case_test_info_34(): Unit {
        Directory.create("./tmp dir", recursive: false)
        try {
            var subProcess = launch("cmd.exe", "/c", "timeout", "/T", "1", workingDirectory: Path("./tmp dir"))
            @Expect(subProcess.pid > 0, true)
            @Expect(subProcess.pid < Int64(Int32.Max), true)
            @Expect(subProcess.name, "cmd.exe")
            @Expect(subProcess.command, "C:\\Windows\\System32\\cmd.exe")
            checkInfo(subProcess)
            subProcess.wait()
        } finally {
            remove("./tmp dir", recursive: false)
        }
    }

    @TestCase
    func case_test_info_35(): Unit {
        Process.current.setEnv("key1", longStr)
        let subProcess = launch("cmd.exe", "/c", "timeout", "/T", "1")
        @Expect(subProcess.pid > 0, true)
        @Expect(subProcess.pid < Int64(Int32.Max), true)
        @Expect(subProcess.name, "cmd.exe")
        @Expect(subProcess.command, "C:\\Windows\\System32\\cmd.exe")
        checkInfo(subProcess)
        Process.current.removeEnv("key1")
    }

    // 超长表
    @TestCase
    func case_test_info_36(): Unit {
        let env = HashMap<String, String>(100000)
        for (i in 0..100000) {
            env.add("${i}", "${i}")
        }
        let subProcess = launch("cmd.exe", "/c", "timeout", "/T", "1", environment: env)
        @Expect(subProcess.pid > 0, true)
        @Expect(subProcess.pid < Int64(Int32.Max), true)
        @Expect(subProcess.name, "cmd.exe")
        @Expect(subProcess.command, "C:\\Windows\\System32\\cmd.exe")
        checkInfo(subProcess)
    }

    // 表中 value 超长
    @TestCase
    func case_test_info_37(): Unit {
        let env = HashMap<String, String>()
        env.add("key1", longStr)
        let subProcess = launch("cmd.exe", "/c", "timeout", "/T", "1", environment: env)
        @Expect(subProcess.pid > 0, true)
        @Expect(subProcess.pid < Int64(Int32.Max), true)
        @Expect(subProcess.name, "cmd.exe")
        @Expect(subProcess.command, "C:\\Windows\\System32\\cmd.exe")
        checkInfo(subProcess)
    }

    // 表中 key 超长
    @TestCase
    func case_test_info_38(): Unit {
        let env = HashMap<String, String>()
        env.add(longStr, "value1")
        let subProcess = launch("cmd.exe", "/c", "timeout", "/T", "1", environment: env)
        @Expect(subProcess.pid > 0, true)
        @Expect(subProcess.pid < Int64(Int32.Max), true)
        @Expect(subProcess.name, "cmd.exe")
        @Expect(subProcess.command, "C:\\Windows\\System32\\cmd.exe")
        checkInfo(subProcess)
    }

    @TestCase
    func case_test_info_39(): Unit {
        let exitCode = execute("cmd.exe", "/c", "echo", "abc")
        @Expect(exitCode, 0)
    }

    @TestCase
    func case_test_info_40(): Unit {
        let (exitCode, out, err) = executeWithOutput("cmd.exe", "/c", "echo", "abc")
        @Expect(exitCode, 0)
        @Expect(String.fromUtf8(out), "abc\r\n")
        @Expect(String.fromUtf8(err), "")
    }

    @TestCase
    func case_test_info_41(): Unit {
        let env = HashMap<String, String>([("123!@#一二三abc", "123!@#一二三abc")])
        let subProcess = launch("cmd.exe", "/c", "timeout", "/T", "1", environment: env)
        @Expect(subProcess.name, "cmd.exe")
        @Expect(subProcess.command, "C:\\Windows\\System32\\cmd.exe")
        checkInfo(subProcess)
    }

    // removeEnv 后执行 start
    @TestCase
    func case_test_info_last(): Unit { // 这个用例需要放在最后
        Process.current.removeEnv("USER")
        let subProcess = launch("cmd.exe", "/c", "timeout", "/T", "1")
        @Expect(subProcess.pid > 0, true)
        @Expect(subProcess.pid < Int64(Int32.Max), true)
        @Expect(subProcess.name, "cmd.exe")
        @Expect(subProcess.command, "C:\\Windows\\System32\\cmd.exe")
        checkInfo(subProcess)
    }
}
