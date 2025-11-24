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
 * Test description: Test the File.init(OpenMode = Append) and regular file options,
 * such as length, canRead, read, canWrite, write, flush, seek, close, isClosed, etc
 * Test API: public init(path: String, openOption: OpenMode)
 *           public init(path: Path, openOption: OpenMode)
 *           public prop let length: Int64
 *           public func read(buffer: Array<Byte>): Int64
 *           public func write(buffer: Array<Byte>): Unit
 *           public func seek(sp: SeekPosition): Int64
 *           public func canRead(): Bool
 *           public func canWrite(): Bool
 *           public func close(): Unit
 *           public func isClosed(): Bool
 *           public func flush(): Unit
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.fs.*
import std.io.*
import std.regex.*

@Test
class Test_Init_Append {
    public override func beforeAll(): Unit {
        var path0 = canonicalize(Path("./"))
        var dir_file_path = path0.join("file_temp_01")
        if (exists(dir_file_path)) {
            remove(dir_file_path, recursive: true)
        }
        Directory.create(dir_file_path, recursive: true)
        @Assert(exists(dir_file_path), true)
        File.create(dir_file_path.join("file_append.txt")).close()
        @Assert(exists(dir_file_path.join("file_append.txt")), true)
    }

    public override func afterAll(): Unit {
        var path0 = canonicalize(Path("./"))
        var dir_file_path = path0.join("file_temp_01")
        if (exists(dir_file_path)) {
            remove(dir_file_path, recursive: true)
        }
    }

    @TestCase
    func test_init_illegal(): Unit {
        var sum = 0
        var illegal_str = ["\0", "/home\0"]
        try {
            var file = File("", OpenMode.Append)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The file path is empty.")
            sum += 1
        }
        for (str in illegal_str) {
            try {
                var file = File(str, OpenMode.Append)
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
                var file = File(Path(str), OpenMode.Append)
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
        var sum = 0
        var file = File("./file_temp_01/file_append.txt", OpenMode.Append)
        try {
            file.seek(SeekPosition.Begin(0))
        } catch (e: FSException) {
            @Assert(Regex("^The file `.+` can not seek.$").matches(e.message))
            sum += 1
        }
        file.close()
        @Expect(sum, 1)
    }

    @TestCase
    func test_write(): Unit {
        var file = File("./file_temp_01/file_append.txt", OpenMode.Append)
        @Expect(file.canWrite(), true)
        var data = Array<Byte>(20, repeat: 90)
        file.write(Array<Byte>())
        file.write(data)
        file.flush()
        @Expect(file.isClosed(), false)
        file.close()
        @Expect(file.isClosed(), true)

        var arr = File.readFrom("./file_temp_01/file_append.txt")
        @Expect(arr, data)
    }

    @TestCase
    func test_read(): Unit {
        var buf = Array<Byte>(100, repeat: 0)
        var sum = 0
        var file = File("./file_temp_01/file_append.txt", OpenMode.Append)
        @Expect(file.canRead(), false)
        try {
            file.read(buf)
        } catch (e: FSException) {
            @Assert(Regex("^The file `.+` does not have the read permission.$").matches(e.message))
            sum += 1
        }
        file.close()
        @Expect(sum, 1)
    }
}
