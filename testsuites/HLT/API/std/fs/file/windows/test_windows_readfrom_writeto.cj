/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (Windows and not OHOS)EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (Windows and not OHOS)RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 

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

@Test
class Test_File_ReadFrom_WriteTo {
    private var data = Array<Byte>(100, repeat: 50)

    @TestCase
    func test_illegal(): Unit {
        var illegal_path_string = ["\0", "\\\\.\\C:\\\0"]
        var sum = 0
        try {
            File.readFrom("")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input path is empty.")
            sum += 1
        }
        try {
            File.appendTo("", data)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input path is empty.")
            sum += 1
        }
        for (str in illegal_path_string) {
            try {
                File.readFrom(str)
            } catch (e: IllegalArgumentException) {
                @Expect(e.message.contains("contains null character."))
                sum += 1
            }
            try {
                File.appendTo(str, data)
            } catch (e: IllegalArgumentException) {
                @Expect(e.message.contains("contains null character."))
                sum += 1
            }
        }
        @Expect(sum, 6)
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
        //Windows端可读不可改
        fileinfo.setReadable(false)
        @Expect(fileinfo.canRead(), true)
        @Expect(File.readFrom("file.txt"), Array<Byte>())
        fileinfo.setReadable(true)
        fileinfo.setWritable(true)
        @Expect(sum, 1)
    }

    @TestCase
    func test_in_open_files(): Unit {
        var paths = ["test_temp.txt"]
        for (str in paths) {
            File.create(str).close()
            @Assert(exists(str), true)
            var file = File(str, ReadWrite)

            File.appendTo(str, data) // file.write(data)
            var arr = File.readFrom(str)
            @Expect(arr, data)
            //file 仍指向文件开头，需要移动到结尾，否则会覆写 File.appendTo(str, data) 中的内容
            file.seek(SeekPosition.End(0))
            file.write(data)
            file.close()
            var arr1 = File.readFrom(str)
            @Expect(arr1, Array<Byte>(200, repeat: 50))
            remove(str)
        }
    }
}
