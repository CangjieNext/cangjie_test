/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (not Windows or OHOS)EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (not Windows or OHOS)RUN-EXEC: export USER=`whoami` && %run %run_opt %output %run_utest_opt %run_args

/*
 * Test description: Test the File.readFrom File.appendTo
 * Test API: public static func readFrom(path: String): Array<Byte>
 *           public static func readFrom(path: Path): Array<Byte>
 *           public static func appendTo(path: String, buffer: Array<Byte>): Unit
 *           public static func appendTo(path: Path, buffer: Array<Byte>): Unit
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.fs.*
import std.io.SeekPosition
import std.process.*

var user = Option<String>.None

@Test
class Test_File_ReadFrom_WriteTo {
    public override func beforeAll(): Unit {
        user = Process.current.getEnv("USER")
    }

    private var data = Array<Byte>(100, repeat: 50)

    @TestCase
    func test_illegal(): Unit {
        var illegal_path_string = ["\0", "/home\0"]
        var sum = 0
        try {
            File.readFrom("")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The file path is empty.")
            sum += 1
        }
        try {
            File.appendTo("", data)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The file path is empty.")
            sum += 1
        }
        for (str in illegal_path_string) {
            try {
                File.readFrom(str)
            } catch (e: IllegalArgumentException) {
                @Expect(e.message, "The file path value ${unsafe { str.rawData() }} contains null character.")
                sum += 1
            }
            try {
                File.appendTo(str, data)
            } catch (e: IllegalArgumentException) {
                @Expect(e.message, "The file path value ${unsafe { str.rawData() }} contains null character.")
                sum += 1
            }
        }
        @Expect(sum, 6)
    }

    @TestCase
    func test_fs_exception(): Unit {
        var illegal_path_string = ["/home/nonexist001/a.txt", "./nonexist001/a.txt"]
        var sum = 0
        for (str in illegal_path_string) {
            try {
                File.readFrom(str)
            } catch (e: FSException) {
                var parpath = Path(str).parent.toString()
                @Expect(e.message, "The path `${parpath}` does not exist.")
                sum += 1
            }
            try {
                File.appendTo(str, data)
            } catch (e: FSException) {
                var parpath = Path(str).parent.toString()
                @Expect(e.message, "The path `${parpath}` does not exist.")
                sum += 1
            }
        }
        @Expect(sum, 4)
    }

    @TestCase
    func test_no_permission(): Unit {
        var sum = 0
        File.create("file.txt").close()
        @Assert(exists("file.txt"), true)
        var fileinfo = FileInfo("file.txt")
        fileinfo.setWritable(false)
        @Expect(File.readFrom("file.txt"), Array<Byte>())
        try {
            File.appendTo("file.txt", data)
        } catch (e: FSException) {
            @Expect(e.message.contains("Failed to open the file"))
            sum += 1
        }
        //linux端可读 可改
        fileinfo.setReadable(false)
        @Expect(fileinfo.canRead(), false)
        try {
            File.readFrom("file.txt")
        } catch (e: FSException) {
            @Expect(e.message.contains("Failed to open the file"))
            sum += 1
        }
        fileinfo.setReadable(true)
        fileinfo.setWritable(true)
        remove("file.txt")
        match (user) {
            case Some("root") => @Expect(sum, 0)
            case _ => @Expect(sum, 2)
        }
    }

    @TestCase
    func test_in_open_files(): Unit {
        var paths = ["test_temp.txt"]
        for (str in paths) {
            File.create(str).close()
            var file = File(str, ReadWrite)

            File.appendTo(str, data) // file.write(data)
            var arr = File.readFrom(str)
            @Expect(arr, data)
            //file 仍指向文件开头，需要移动到结尾，否则会覆写 File.appendTo(str, data) 中的内容
            file.seek(SeekPosition.End(0))
            file.write(data) //没有写入且无异常
            file.close()
            var arr1 = File.readFrom(str)
            @Expect(arr1, Array<Byte>(200, repeat: 50)) //报错
            remove(str)
        }
    }
}
