/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// (Windows)EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// (Windows)EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT:regex-begin .*PASSED.*: 34,.*SKIPPED.*: 16,.*ERROR.*: 0
// ASSERT:regex-next .*FAILED.*: 0

internal import std.io.*
internal import std.fs.*
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
 * 1. 构造不同 subProcess，检查 subProcess 在以不同方式重定向标准输入、标准输出和标准错误时，返回结果是否正常
 */
func readUtil(inputStream: InputStream): Array<Byte> {
    let tempSize: Int64 = 4096
    var buffer: ByteBuffer = ByteBuffer(tempSize)
    let tempArr: Array<UInt8> = Array<UInt8>(tempSize, repeat: 0)
    while (true) {
        let readLen = inputStream.read(tempArr)
        if (readLen <= 0) {
            break
        } else if (readLen == tempSize) {
            buffer.write(tempArr)
        } else {
            buffer.write(tempArr.slice(0, readLen))
        }
    }

    return readToEnd(buffer)
}

@Test
public class Test_subProcess_stdio {
    @TestCase
    func case_test_stdio_1(): Unit {
        let subProcess = Process.start("cmd.exe", "/c", "echo", "abc")
        var buffer = readUtil(subProcess.stdOut)
        var expect = Array<Byte>()
        subProcess.wait()
        @Expect(buffer, expect)
    }

    @TestCase
    func case_test_stdio_2(): Unit {
        let subProcess = Process.start("cmd.exe", "/c", "echo", "abc", stdOut: Inherit)
        var buffer = readUtil(subProcess.stdOut)
        var expect = Array<Byte>()
        subProcess.wait()
        @Expect(buffer, expect)
    }

    @TestCase
    func case_test_stdio_3(): Unit {
        let subProcess = Process.start("cmd.exe", "/c", "echo", "abc", stdOut: Pipe)
        var buffer = readUtil(subProcess.stdOut)
        subProcess.wait()
        @Expect(String.fromUtf8(buffer), "abc\r\n")
    }

    @TestCase
    func case_test_stdio_4(): Unit {
        let file = File("./stdout.txt", ReadWrite)
        try {
            let subProcess = Process.start("cmd.exe", "/c", "echo", "abc", stdOut: FromFile(file))
            var buffer = readUtil(subProcess.stdOut)
            var expect = Array<Byte>()
            subProcess.wait()
            @Expect(buffer, expect)
            buffer = Array<Byte>(5, repeat: 0)
            file.seek(SeekPosition.Begin(0))
            buffer = readUtil(file)
            @Expect(String.fromUtf8(buffer), "abc\r\n")
        } finally {
            file.close()
            remove("./stdout.txt")
        }
    }

    @TestCase
    func case_test_stdio_5(): Unit {
        let subProcess = Process.start("cmd.exe", "/c", "echo", "abc", stdOut: Discard)
        var buffer = readUtil(subProcess.stdOut)
        var expect = Array<Byte>()
        subProcess.wait()
        @Expect(buffer, expect)
    }

    @TestCase
    func case_test_stdio_6(): Unit {
        let subProcess = Process.start("cmd.exe", "/c", "timeout", "/T", "abc")
        var buffer = readUtil(subProcess.stdErr)
        var expect = Array<Byte>()
        subProcess.wait()
        @Expect(buffer, expect)
    }

    @TestCase
    func case_test_stdio_7(): Unit {
        let subProcess = Process.start("cmd.exe", "/c", "timeout", "/T", "abc", stdErr: Inherit)
        var buffer = readUtil(subProcess.stdErr)
        var expect = Array<Byte>()
        subProcess.wait()
        @Expect(buffer, expect)
    }

    @TestCase
    func case_test_stdio_8(): Unit {
        var subProcess = Process.start("cmd.exe", "/c", "timeout", "/T", "abc", stdErr: Pipe)
        var buffer = readUtil(subProcess.stdErr)
        subProcess.wait()
        @Expect(String.fromUtf8(buffer), "ERROR: Invalid value for timeout (/T) specified. Valid range is -1 to 99999.\r\n")
    }

    @TestCase
    func case_test_stdio_9(): Unit {
        let file = File("./stdout.txt", ReadWrite)
        try {
            let subProcess = Process.start("cmd.exe", "/c", "timeout", "/T", "abc", stdErr: FromFile(file))
            var buffer = readUtil(subProcess.stdErr)
            var expect = Array<Byte>()
            subProcess.wait()
            @Expect(buffer, expect)
            file.seek(SeekPosition.Begin(0))
            buffer = readUtil(file)
            @Expect(String.fromUtf8(buffer), "ERROR: Invalid value for timeout (/T) specified. Valid range is -1 to 99999.\r\n")
        } finally {
            file.close()
            remove("./stdout.txt")
        }
    }

    @TestCase
    func case_test_stdio_10(): Unit {
        let subProcess = Process.start("cmd.exe", "/c", "timeout", "/T", "abc", stdErr: Discard)
        var buffer = readUtil(subProcess.stdErr)
        var expect = Array<Byte>()
        subProcess.wait()
        @Expect(buffer, expect)
    }

    // 传入的文件已被 close
    @TestCase
    func case_test_stdio_11(): Unit {
        let file = File("./stdout.txt", ReadWrite)
        file.close()
        var flag = 0
        try {
            Process.start("cmd.exe", "/c", "echo", "abc", stdOut: FromFile(file))
        } catch (e: ProcessException) {
            @Expect(e.message, "Redirect file closed or not existed, not allow redirect.")
            flag++
        } finally {
            remove("./stdout.txt")
        }
        @Expect(flag, 1)
    }

    // 传入的文件无 write 权限
    @TestCase
    func case_test_stdio_12(): Unit {
        let file1 = File("./stdout.txt", Write)
        file1.close()
        let file = File("./stdout.txt", Read)
        try {
            let subProcess = Process.start("cmd.exe", "/c", "echo", "abc", stdOut: FromFile(file))
            var buffer = readUtil(subProcess.stdOut)
            var expect = Array<Byte>()
            subProcess.wait()
            @Expect(buffer, expect)
            buffer = Array<Byte>(5, repeat: 0)
            expect = Array<Byte>(5, repeat: 0)
            file.seek(SeekPosition.Begin(0))
            file.read(buffer)
            @Expect(buffer, expect)
        } finally {
            file.close()
            remove("./stdout.txt")
        }
    }

    // 传入的文件已被删除
    @TestCase
    func case_test_stdio_13(): Unit {
        let file = File("./stdout.txt", ReadWrite)
        file.close()
        remove("./stdout.txt")
        var flag = 0
        try {
            Process.start("cmd.exe", "/c", "echo", "abc", stdOut: FromFile(file))
        } catch (e: ProcessException) {
            @Expect(e.message, "Redirect file closed or not existed, not allow redirect.")
            flag++
        }
        @Expect(flag, 1)
    }

    // 传入的文件已被 close
    @TestCase
    func case_test_stdio_14(): Unit {
        let file = File("./stderr.txt", ReadWrite)
        file.close()
        var flag = 0
        try {
            Process.start("cmd.exe", "/c", "timeout", "/T", "abc", stdErr: FromFile(file))
        } catch (e: ProcessException) {
            @Expect(e.message, "Redirect file closed or not existed, not allow redirect.")
            flag++
        } finally {
            remove("./stderr.txt")
        }
        @Expect(flag, 1)
    }

    // 传入的文件无 write 权限
    @TestCase
    func case_test_stdio_15(): Unit {
        let file1 = File("./stderr.txt", Write)
        file1.close()
        let file = File("./stderr.txt", Read)
        try {
            let subProcess = Process.start("cmd.exe", "/c", "timeout", "/T", "abc", stdErr: FromFile(file))
            var buffer = readUtil(subProcess.stdErr)
            var expect = Array<Byte>()
            subProcess.wait()
            @Expect(buffer, expect)
            buffer = Array<Byte>(90, repeat: 0)
            expect = Array<Byte>(90, repeat: 0)
            file.seek(SeekPosition.Begin(0))
            file.read(buffer)
            @Expect(buffer, expect)
        } finally {
            file.close()
            remove("./stderr.txt")
        }
    }

    // 传入的文件已被删除
    @TestCase
    func case_test_stdio_16(): Unit {
        let file = File("./stderr.txt", ReadWrite)
        file.close()
        remove("./stderr.txt")
        var flag = 0
        try {
            Process.start("cmd.exe", "/c", "timeout", "/T", "abc", stdErr: FromFile(file))
        } catch (e: ProcessException) {
            @Expect(e.message, "Redirect file closed or not existed, not allow redirect.")
            flag++
        }
        @Expect(flag, 1)
    }

    @TestCase
    @Skip
    func case_test_stdio_17(): Unit {
        let subProcess = Process.start("./console")
        var buffer = readUtil(subProcess.stdOut)
        var expect = Array<Byte>()
        subProcess.wait()
        @Expect(buffer, expect)
    }

    @TestCase
    @Skip
    func case_test_stdio_18(): Unit {
        let subProcess = Process.start("./console", stdIn: Inherit)
        var buffer = readUtil(subProcess.stdOut)
        var expect = Array<Byte>()
        subProcess.wait()
        @Expect(buffer, expect)
    }

    @TestCase
    @Skip
    func case_test_stdio_19(): Unit {
        let file = File("./stdin.txt", ReadWrite)
        var buffer = Array<Byte>(20, repeat: 0)
        var expect = Array<Byte>()
        try {
            let data: Array<Byte> = [49, 10]
            file.write(data)
            file.seek(SeekPosition.Begin(0))
            let subProcess = Process.start("./console", stdIn: FromFile(file))
            buffer = readUtil(subProcess.stdOut)
            subProcess.wait()
        } finally {
            file.close()
            remove("./stdin.txt")
        }
        @Expect(buffer, expect)
    }

    @TestCase
    @Skip
    func case_test_stdio_20(): Unit {
        let subProcess = Process.start("./console", stdIn: Pipe)
        let data: Array<Byte> = [49, 10]
        subProcess.stdIn.write(data)
        var buffer = readUtil(subProcess.stdOut)
        var expect = Array<Byte>()
        subProcess.wait()
        @Expect(buffer, expect)
    }

    @TestCase
    @Skip
    func case_test_stdio_21(): Unit {
        let subProcess = Process.start("./console", stdIn: Discard)
        var buffer = readUtil(subProcess.stdOut)
        var expect = Array<Byte>()
        subProcess.wait()
        @Expect(buffer, expect)
    }

    // 传入的文件已被 close
    @TestCase
    @Skip
    func case_test_stdio_22(): Unit {
        let file = File("./stdin.txt", ReadWrite)
        let data: Array<Byte> = [49, 10]
        file.write(data)
        file.close()
        var flag = 0
        try {
            Process.start("./console", stdIn: FromFile(file))
        } catch (e: ProcessException) {
            @Expect(e.message, "Redirect file closed or not existed, not allow redirect.")
            flag++
        } finally {
            remove("./stdin.txt")
        }
        @Expect(flag, 1)
    }

    // 传入的文件无 read 权限
    @TestCase
    @Skip
    func case_test_stdio_23(): Unit {
        let file1 = File("./stdin.txt", Write)
        let data: Array<Byte> = [49, 10]
        file1.write(data)
        file1.close()
        let file = File("./stdin.txt", Write)
        try {
            let subProcess = Process.start("./console", stdIn: FromFile(file))
            var buffer = readUtil(subProcess.stdOut)
            var expect = Array<Byte>()
            subProcess.wait()
            @Expect(buffer, expect)
        } finally {
            file.close()
            remove("./stdin.txt")
        }
    }

    // 传入的文件已被删除
    @TestCase
    @Skip
    func case_test_stdio_24(): Unit {
        let file = File("./stdin.txt", ReadWrite)
        let data: Array<Byte> = [49, 10]
        file.write(data)
        file.close()
        remove("./stdin.txt")
        var flag = 0
        try {
            Process.start("./console", stdIn: FromFile(file))
        } catch (e: ProcessException) {
            @Expect(e.message, "Redirect file closed or not existed, not allow redirect.")
            flag++
        }
        @Expect(flag, 1)
    }

    /** 
     * command 与 arguments 包含'\"', '\\'特殊字符，需要添加转义符
     */
    @TestCase
    func case_test_cmdLineNeedBackslash(): Unit {
        let subProcess = Process.start("cmd.exe", "/c", "echo", "ab\"c\\d", stdOut: Pipe)
        var buffer = readUtil(subProcess.stdOut)
        subProcess.wait()
        @Expect(String.fromUtf8(buffer), "ab\\\"c\\d\r\n")
    }
}

@Test
public class Test_subProcess_stdio_new {
    @TestCase
    func case_test_stdio_1(): Unit {
        let subProcess = launch("cmd.exe", "/c", "echo", "abc")
        var buffer = readUtil(subProcess.stdOut)
        var expect = Array<Byte>()
        subProcess.wait()
        @Expect(buffer, expect)
    }

    @TestCase
    func case_test_stdio_2(): Unit {
        let subProcess = launch("cmd.exe", "/c", "echo", "abc", stdOut: Inherit)
        var buffer = readUtil(subProcess.stdOut)
        var expect = Array<Byte>()
        subProcess.wait()
        @Expect(buffer, expect)
    }

    @TestCase
    func case_test_stdio_3(): Unit {
        let subProcess = launch("cmd.exe", "/c", "echo", "abc", stdOut: Pipe)
        var buffer = readUtil(subProcess.stdOut)
        subProcess.wait()
        @Expect(String.fromUtf8(buffer), "abc\r\n")
    }

    @TestCase
    func case_test_stdio_4(): Unit {
        let file = File("./stdout.txt", ReadWrite)
        try {
            let subProcess = launch("cmd.exe", "/c", "echo", "abc", stdOut: FromFile(file))
            var buffer = readUtil(subProcess.stdOut)
            var expect = Array<Byte>()
            subProcess.wait()
            @Expect(buffer, expect)
            buffer = Array<Byte>(5, repeat: 0)
            file.seek(SeekPosition.Begin(0))
            buffer = readUtil(file)
            @Expect(String.fromUtf8(buffer), "abc\r\n")
        } finally {
            file.close()
            remove("./stdout.txt")
        }
    }

    @TestCase
    func case_test_stdio_5(): Unit {
        let subProcess = launch("cmd.exe", "/c", "echo", "abc", stdOut: Discard)
        var buffer = readUtil(subProcess.stdOut)
        var expect = Array<Byte>()
        subProcess.wait()
        @Expect(buffer, expect)
    }

    @TestCase
    func case_test_stdio_6(): Unit {
        let subProcess = launch("cmd.exe", "/c", "timeout", "/T", "abc")
        var buffer = readUtil(subProcess.stdErr)
        var expect = Array<Byte>()
        subProcess.wait()
        @Expect(buffer, expect)
    }

    @TestCase
    func case_test_stdio_7(): Unit {
        let subProcess = launch("cmd.exe", "/c", "timeout", "/T", "abc", stdErr: Inherit)
        var buffer = readUtil(subProcess.stdErr)
        var expect = Array<Byte>()
        subProcess.wait()
        @Expect(buffer, expect)
    }

    @TestCase
    func case_test_stdio_8(): Unit {
        var subProcess = launch("cmd.exe", "/c", "timeout", "/T", "abc", stdErr: Pipe)
        var buffer = readUtil(subProcess.stdErr)
        subProcess.wait()
        @Expect(String.fromUtf8(buffer), "ERROR: Invalid value for timeout (/T) specified. Valid range is -1 to 99999.\r\n")
    }

    @TestCase
    func case_test_stdio_9(): Unit {
        let file = File("./stdout.txt", ReadWrite)
        try {
            let subProcess = launch("cmd.exe", "/c", "timeout", "/T", "abc", stdErr: FromFile(file))
            var buffer = readUtil(subProcess.stdErr)
            var expect = Array<Byte>()
            subProcess.wait()
            @Expect(buffer, expect)
            file.seek(SeekPosition.Begin(0))
            buffer = readUtil(file)
            @Expect(String.fromUtf8(buffer), "ERROR: Invalid value for timeout (/T) specified. Valid range is -1 to 99999.\r\n")
        } finally {
            file.close()
            remove("./stdout.txt")
        }
    }

    @TestCase
    func case_test_stdio_10(): Unit {
        let subProcess = launch("cmd.exe", "/c", "timeout", "/T", "abc", stdErr: Discard)
        var buffer = readUtil(subProcess.stdErr)
        var expect = Array<Byte>()
        subProcess.wait()
        @Expect(buffer, expect)
    }

    // 传入的文件已被 close
    @TestCase
    func case_test_stdio_11(): Unit {
        let file = File("./stdout.txt", ReadWrite)
        file.close()
        var flag = 0
        try {
            launch("cmd.exe", "/c", "echo", "abc", stdOut: FromFile(file))
        } catch (e: ProcessException) {
            @Expect(e.message, "Redirect file closed or not existed, not allow redirect.")
            flag++
        } finally {
            remove("./stdout.txt")
        }
        @Expect(flag, 1)
    }

    // 传入的文件无 write 权限
    @TestCase
    func case_test_stdio_12(): Unit {
        let file1 = File("./stdout.txt", Write)
        file1.close()
        let file = File("./stdout.txt", Read)
        try {
            let subProcess = launch("cmd.exe", "/c", "echo", "abc", stdOut: FromFile(file))
            var buffer = readUtil(subProcess.stdOut)
            var expect = Array<Byte>()
            subProcess.wait()
            @Expect(buffer, expect)
            buffer = Array<Byte>(5, repeat: 0)
            expect = Array<Byte>(5, repeat: 0)
            file.seek(SeekPosition.Begin(0))
            file.read(buffer)
            @Expect(buffer, expect)
        } finally {
            file.close()
            remove("./stdout.txt")
        }
    }

    // 传入的文件已被删除
    @TestCase
    func case_test_stdio_13(): Unit {
        let file = File("./stdout.txt", ReadWrite)
        file.close()
        remove("./stdout.txt")
        var flag = 0
        try {
            launch("cmd.exe", "/c", "echo", "abc", stdOut: FromFile(file))
        } catch (e: ProcessException) {
            @Expect(e.message, "Redirect file closed or not existed, not allow redirect.")
            flag++
        }
        @Expect(flag, 1)
    }

    // 传入的文件已被 close
    @TestCase
    func case_test_stdio_14(): Unit {
        let file = File("./stderr.txt", ReadWrite)
        file.close()
        var flag = 0
        try {
            launch("cmd.exe", "/c", "timeout", "/T", "abc", stdErr: FromFile(file))
        } catch (e: ProcessException) {
            @Expect(e.message, "Redirect file closed or not existed, not allow redirect.")
            flag++
        } finally {
            remove("./stderr.txt")
        }
        @Expect(flag, 1)
    }

    // 传入的文件无 write 权限
    @TestCase
    func case_test_stdio_15(): Unit {
        let file1 = File("./stderr.txt", Write)
        file1.close()
        let file = File("./stderr.txt", Read)
        try {
            let subProcess = launch("cmd.exe", "/c", "timeout", "/T", "abc", stdErr: FromFile(file))
            var buffer = readUtil(subProcess.stdErr)
            var expect = Array<Byte>()
            subProcess.wait()
            @Expect(buffer, expect)
            buffer = Array<Byte>(90, repeat: 0)
            expect = Array<Byte>(90, repeat: 0)
            file.seek(SeekPosition.Begin(0))
            file.read(buffer)
            @Expect(buffer, expect)
        } finally {
            file.close()
            remove("./stderr.txt")
        }
    }

    // 传入的文件已被删除
    @TestCase
    func case_test_stdio_16(): Unit {
        let file = File("./stderr.txt", ReadWrite)
        file.close()
        remove("./stderr.txt")
        var flag = 0
        try {
            launch("cmd.exe", "/c", "timeout", "/T", "abc", stdErr: FromFile(file))
        } catch (e: ProcessException) {
            @Expect(e.message, "Redirect file closed or not existed, not allow redirect.")
            flag++
        }
        @Expect(flag, 1)
    }

    @TestCase
    @Skip
    func case_test_stdio_17(): Unit {
        let subProcess = launch("./console")
        var buffer = readUtil(subProcess.stdOut)
        var expect = Array<Byte>()
        subProcess.wait()
        @Expect(buffer, expect)
    }

    @TestCase
    @Skip
    func case_test_stdio_18(): Unit {
        let subProcess = launch("./console", stdIn: Inherit)
        var buffer = readUtil(subProcess.stdOut)
        var expect = Array<Byte>()
        subProcess.wait()
        @Expect(buffer, expect)
    }

    @TestCase
    @Skip
    func case_test_stdio_19(): Unit {
        let file = File("./stdin.txt", ReadWrite)
        var buffer = Array<Byte>(20, repeat: 0)
        var expect = Array<Byte>()
        try {
            let data: Array<Byte> = [49, 10]
            file.write(data)
            file.seek(SeekPosition.Begin(0))
            let subProcess = launch("./console", stdIn: FromFile(file))
            buffer = readUtil(subProcess.stdOut)
            subProcess.wait()
        } finally {
            file.close()
            remove("./stdin.txt")
        }
        @Expect(buffer, expect)
    }

    @TestCase
    @Skip
    func case_test_stdio_20(): Unit {
        let subProcess = launch("./console", stdIn: Pipe)
        let data: Array<Byte> = [49, 10]
        subProcess.stdIn.write(data)
        var buffer = readUtil(subProcess.stdOut)
        var expect = Array<Byte>()
        subProcess.wait()
        @Expect(buffer, expect)
    }

    @TestCase
    @Skip
    func case_test_stdio_21(): Unit {
        let subProcess = launch("./console", stdIn: Discard)
        var buffer = readUtil(subProcess.stdOut)
        var expect = Array<Byte>()
        subProcess.wait()
        @Expect(buffer, expect)
    }

    // 传入的文件已被 close
    @TestCase
    @Skip
    func case_test_stdio_22(): Unit {
        let file = File("./stdin.txt", ReadWrite)
        let data: Array<Byte> = [49, 10]
        file.write(data)
        file.close()
        var flag = 0
        try {
            launch("./console", stdIn: FromFile(file))
        } catch (e: ProcessException) {
            @Expect(e.message, "Redirect file closed or not existed, not allow redirect.")
            flag++
        } finally {
            remove("./stdin.txt")
        }
        @Expect(flag, 1)
    }

    // 传入的文件无 read 权限
    @TestCase
    @Skip
    func case_test_stdio_23(): Unit {
        let file1 = File("./stdin.txt", Write)
        let data: Array<Byte> = [49, 10]
        file1.write(data)
        file1.close()
        let file = File("./stdin.txt", Write)
        try {
            let subProcess = launch("./console", stdIn: FromFile(file))
            var buffer = readUtil(subProcess.stdOut)
            var expect = Array<Byte>()
            subProcess.wait()
            @Expect(buffer, expect)
        } finally {
            file.close()
            remove("./stdin.txt")
        }
    }

    // 传入的文件已被删除
    @TestCase
    @Skip
    func case_test_stdio_24(): Unit {
        let file = File("./stdin.txt", ReadWrite)
        let data: Array<Byte> = [49, 10]
        file.write(data)
        file.close()
        remove("./stdin.txt")
        var flag = 0
        try {
            launch("./console", stdIn: FromFile(file))
        } catch (e: ProcessException) {
            @Expect(e.message, "Redirect file closed or not existed, not allow redirect.")
            flag++
        }
        @Expect(flag, 1)
    }

    /** 
     * command 与 arguments 包含'\"', '\\'特殊字符，需要添加转义符
     */
    @TestCase
    func case_test_cmdLineNeedBackslash(): Unit {
        let subProcess = launch("cmd.exe", "/c", "echo", "ab\"c\\d", stdOut: Pipe)
        var buffer = readUtil(subProcess.stdOut)
        subProcess.wait()
        @Expect(String.fromUtf8(buffer), "ab\\\"c\\d\r\n")
    }
}
