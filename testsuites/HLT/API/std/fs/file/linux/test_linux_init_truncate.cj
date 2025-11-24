/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (not Windows or OHOS)EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (not Windows or OHOS)RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 

/*
 * Test description: Test the File.init(OpenMode = ReadWrite | Read | Write) and regular file options,
 * such as length, canRead, read, canWrite, write, flush, seek, close, isClosed, etc
 * Test API: public init(path: String, openMode: OpenMode)
 *           public init(path: Path, openMode: OpenMode)
 *           public prop let length: Int64
 *           public func read(buffer: Array<Byte>): Int64
 *           public func write(buffer: Array<Byte>): Unit
 *           public func seek(sp: SeekPosition): Int64
 *           public func canRead(): Bool
 *           public func canWrite(): Bool
 *           public func close(): Unit
 *           public func isClosed(): Bool
 *           public static func delete(path: String): Unit
 *           public static func delete(path: Path): Unit
 *           public func flush(): Unit
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.fs.*
import std.io.*
import std.regex.*

@Test
class Test_Init_Truncate {
    public override func beforeAll(): Unit {
        if (!exists("file_truncate.txt")) {
            File.create("file_truncate.txt").close()
        }
        @Assert(exists("file_truncate.txt"), true)
    }

    public override func afterAll(): Unit {
        if (exists("file_truncate.txt")) {
            remove("file_truncate.txt")
        }
        @Assert(exists("file_truncate.txt"), false)
    }

    @TestCase
    func test_init_illegal(): Unit {
        var sum = 0
        var illegal_str = ["\0", "/home\0"]
        try {
            File("", Read)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The file path is empty.")
            sum += 1
        }
        for (str in illegal_str) {
            try {
                File(str, Read)
            } catch (e: IllegalArgumentException) {
                @Expect(e.message, "The file path value ${unsafe { str.rawData() }} contains null character.")
                sum += 1
            }
        }
        @Expect(sum, 3)
    }

    @TestCase
    func test_init_fsexc(): Unit {
        var sum = 0
        var illegal_str = ["/a/b/c/none", "./a/b/c/none"]
        for (str in illegal_str) {
            try {
                File(Path(str), Read)
            } catch (e: FSException) {
                var parpath = Path(str).parent.toString()
                @Expect(e.message, "The path `${parpath}` does not exist.")
                sum += 1
            }
        }
        @Expect(sum, 2)
    }

    @TestCase
    func test_init_seek(): Unit {
        var file = File("file_truncate.txt", Write)
        var num = file.seek(SeekPosition.Begin(0))
        @Expect(num, 0)
        @Expect(file.length, 0)
        file.write(Array<Byte>(20, repeat: 90))
        file.seek(SeekPosition.Begin(100))
        @Expect(file.remainLength, -80)
        file.close()

        File("file_truncate.txt", Write).close()
    }

    @TestCase
    func test_write_and_read(): Unit {
        var sum = 0
        var data = Array<Byte>(25, repeat: 90)
        var buf = Array<Byte>(10, repeat: 0)
        var buf1 = Array<Byte>(10, repeat: 0)
        var file = File("file_truncate.txt", ReadWrite)
        @Expect(file.canRead(), true)
        @Expect(file.canWrite(), true)
        file.write(data)

        file.seek(SeekPosition.Begin(0))
        var datasize = file.read(buf)
        @Expect(datasize, 10)
        @Expect(file.read(buf), 10)
        @Expect(file.read(buf1), 5)
        file.flush()
        @Expect(buf, Array<Byte>(10, repeat: 90))
        @Expect(buf1, [90u8, 90u8, 90u8, 90u8, 90u8, 0u8, 0u8, 0u8, 0u8, 0u8])
        file.close()

        try {
            file.read(buf)
        } catch (e: FSException) {
            @Assert(Regex("^The file `.+` not opened, can not to read.$").matches(e.message))
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_write_no_read(): Unit {
        var sum = 0
        var data = Array<Byte>(20, repeat: 90)
        var buf = Array<Byte>(100, repeat: 0)
        var file = File("file_truncate.txt", Write)
        @Expect(file.canRead(), false)
        @Expect(file.canWrite(), true)
        file.write(data)

        file.seek(SeekPosition.Begin(0))
        try {
            file.read(buf)
        } catch (e: FSException) {
            @Assert(Regex("^The file `.+` does not have the read permission.$").matches(e.message))
            sum += 1
        }
        file.close()
        @Expect(sum, 1)
    }

    @TestCase
    func test_no_data(): Unit {
        var data = Array<Byte>(20, repeat: 90)
        File.appendTo("file_truncate.txt", data)
        var file = File("file_truncate.txt", Write)
        file.seek(SeekPosition.Begin(0))
        @Expect(file.length, 0)
        file.close()
    }
}
