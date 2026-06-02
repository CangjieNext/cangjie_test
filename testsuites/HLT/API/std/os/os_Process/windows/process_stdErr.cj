/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
import std.posix.*
import std.process.*
import std.math.*
import std.time.*
import std.sync.*
import std.fs.*
import std.io.*

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
class Test_stdErr {
    var cnt = 0
    public override func beforeEach(): Unit {
        cnt = 0
    }

    @TestCase
    func test_default(): Unit {
        let subProcess = Process.start("sleep", "fggerw")
        var buffer = Array<Byte>(5, repeat: 0)
        var expect = Array<Byte>(5, repeat: 0)
        subProcess.wait()
        subProcess.stdErr.read(buffer)
        @Expect(buffer, expect)
    }

    @TestCase
    func test_inherit(): Unit {
        let subProcess = Process.start("sleep", "fggerw", stdErr: Inherit)
        var buffer = Array<Byte>(5, repeat: 0)
        var expect = Array<Byte>(5, repeat: 0)
        subProcess.wait()
        subProcess.stdErr.read(buffer)
        @Expect(buffer, expect)
    }

    @TestCase
    func test_pipe(): Unit {
        var subprocess = Process.start("sleep", "fggerw", stdErr: Pipe)
        let buf = readUtil(subprocess.stdErr)
        subprocess.wait()
        @Expect(String.fromUtf8(buf).contains("sleep: invalid time interval ‘fggerw’\nTry 'sleep --help' for more information."))
    }

    @TestCase
    func test_FromFile(): Unit {
        let file = File("./test.txt", ReadWrite)
        try {
            let subProcess = Process.start("sleep", "fggerw", stdErr: FromFile(file))
            var buffer = Array<Byte>(90, repeat: 0)
            var expect = Array<Byte>(90, repeat: 0)
            subProcess.wait()
            subProcess.stdErr.read(buffer)
            @Expect(buffer, expect)
            file.seek(SeekPosition.Begin(0))
            file.read(buffer)
            @Expect(String.fromUtf8(buffer), "sleep: invalid time interval ‘fggerw’\nTry 'sleep --help' for more information.\n\0\0\0\0\0\0\0")
        } finally {
            file.close()
            remove("./test.txt")
        }
    }

    @TestCase
    func test_file_closed(): Unit {
        let file = File("./stdErr.txt", ReadWrite)
        file.close()
        var flag = 0
        try {
            Process.start("sleep", "fggerw", stdErr: FromFile(file))
        } catch (e: ProcessException) {
            @Expect(e.message, "Redirect file closed or not existed, not allow redirect.")
            cnt++
        } finally {
            remove("./stdErr.txt")
        }
        @Expect(cnt, 1)
    }

    @TestCase
    func test_file_delete(): Unit {
        let file = File("./stderr.txt", ReadWrite)
        file.close()
        remove("./stderr.txt")
        var flag = 0
        try {
            Process.start("sleep", "fggerw", stdErr: FromFile(file))
        } catch (e: ProcessException) {
            @Expect(e.message, "Redirect file closed or not existed, not allow redirect.")
            flag++
        }
        @Expect(flag, 1)
    }

    @TestCase
    func test_no_access(): Unit {
        let file1 = File("./stdErr.txt", Write)
        file1.close()
        let file = File("./stdErr.txt", Read)
        try {
            let subProcess = Process.start("sleep", "fggerw", stdErr: FromFile(file))
            var buffer = Array<Byte>(5, repeat: 0)
            var expect = Array<Byte>(5, repeat: 0)
            subProcess.wait()
            subProcess.stdErr.read(buffer)
            @Expect(buffer, expect)
            file.seek(SeekPosition.Begin(0))
            file.read(buffer)
            @Expect(buffer, expect)
        } finally {
            file.close()
            remove("./stdErr.txt")
        }
    }

    @TestCase
    func case_discard(): Unit {
        let subProcess = Process.start("sleep", "fggerw", stdErr: Discard)
        var buffer = Array<Byte>(5, repeat: 0)
        var expect = Array<Byte>(5, repeat: 0)
        subProcess.wait()
        subProcess.stdErr.read(buffer)
        @Expect(buffer, expect)
    }
}
