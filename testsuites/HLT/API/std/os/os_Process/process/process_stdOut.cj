/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (not Windows) EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (not Windows) RUN-EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f
// (not Windows) ASSERT: scan abc1
// (not Windows) ASSERT: scan abc2
// (not Windows) ASSERT: scan Bad file descriptor
import std.posix.*
import std.process.*
import std.math.*
import std.fs.{File, OpenMode}
import std.io.*

@Test
class Test_stdOut {
    var cnt = 0
    public override func beforeEach(): Unit {
        cnt = 0
    }

    @TestCase
    func test_default(): Unit {
        let subProcess = Process.start("echo", "abc1")
        var buffer = Array<Byte>(5, repeat: 0)
        var expect = Array<Byte>(5, repeat: 0)
        subProcess.wait()
        subProcess.stdOut.read(buffer)
        @Expect(buffer, expect)
    }

    @TestCase
    func test_inherit(): Unit {
        let subProcess = Process.start("echo", "abc2", stdOut: Inherit)
        var buffer = Array<Byte>(5, repeat: 0)
        var expect = Array<Byte>(5, repeat: 0)
        subProcess.wait()
        subProcess.stdOut.read(buffer)
        @Expect(buffer, expect)
    }

    @TestCase
    func test_pipe(): Unit {
        var subprocess = Process.start("echo", "hello(,/),$、%、{}, []123一二三", stdOut: Pipe)
        let buf = Array<UInt8>(36, repeat: 0)
        subprocess.stdOut.read(buf)
        subprocess.wait()
        @Expect(String.fromUtf8(buf),"hello(,/),$、%、{}, []123一二三")
    }

    @TestCase
    func test_FromFile(): Unit {
        let file = File("./test.txt", ReadWrite)
        try {
            let subProcess = Process.start("echo", "hello(,/),$、%、{}, []123一二三", stdOut: FromFile(file))
            var buffer = Array<Byte>(36, repeat: 0)
            var expect = Array<Byte>(36, repeat: 0)
            subProcess.wait()
            subProcess.stdOut.read(buffer)
            @Expect(buffer, expect)
            file.seek(SeekPosition.Begin(0))
            file.read(buffer)
            @Expect(String.fromUtf8(buffer), "hello(,/),$、%、{}, []123一二三")
        } finally {
            file.close()
            remove("./test.txt")
        }
    }

    @TestCase
    func test_file_closed(): Unit {
        let file = File("./stdout.txt", ReadWrite)
        file.close()
        var flag = 0
        try {
            Process.start("echo", "abc", stdOut: FromFile(file))
        } catch (e: ProcessException) {
            @Expect(e.message, "Redirect file closed or not existed, not allow redirect.")
            cnt++
        } finally {
            remove("./stdout.txt")
        }
        @Expect(cnt, 1)
    }

    @TestCase
    func test_file_delete(): Unit {
        let file = File("./stderr.txt", ReadWrite)
        file.close()
        remove("./stderr.txt")
        try {
            Process.start("sleep", "fggerw", stdErr: FromFile(file))
        } catch (e: ProcessException) {
            @Expect(e.message, "Redirect file closed or not existed, not allow redirect.")
            cnt++
        }
        @Expect(cnt, 1)
    }

    @TestCase
    func test_no_access(): Unit {
        let file1 = File("./stdout.txt", ReadWrite)
        file1.close()
        let file = File("./stdout.txt", Read)
        try {
            let subProcess = Process.start("echo", "abc", stdOut: FromFile(file))
            var buffer = Array<Byte>(5, repeat: 0)
            var expect = Array<Byte>(5, repeat: 0)
            subProcess.wait()
            subProcess.stdOut.read(buffer)
            @Expect(buffer, expect)
            file.seek(SeekPosition.Begin(0))
            file.read(buffer)
            @Expect(buffer, expect)
        } finally {
            file.close()
            remove("./stdout.txt")
        }
    }

    @TestCase
    func case_discard(): Unit {
        let subProcess = Process.start("echo", "abc", stdOut: Discard)
        var buffer = Array<Byte>(5, repeat: 0)
        var expect = Array<Byte>(5, repeat: 0)
        subProcess.wait()
        subProcess.stdOut.read(buffer)
        @Expect(buffer, expect)
    }
}
