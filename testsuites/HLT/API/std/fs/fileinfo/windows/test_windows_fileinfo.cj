/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (Windows and not OHOS)EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (Windows and not OHOS)EXEC: mkdir testdir01
// (Windows and not OHOS)EXEC: type nul>testdir01/file
// (Windows and not OHOS)EXEC: type nul>testdir01/.file
// (Windows and not OHOS)EXEC: mklink symlink01 unexists 
// (Windows and not OHOS)EXEC: mklink symlink02 testdir01/file 
// (Windows and not OHOS)EXEC: mklink symlink03 testdir01/file
// (Windows and not OHOS)EXEC: mklink /d symlink04 testdir01 
// (Windows and not OHOS)EXEC: type nul>unexists
// (Windows and not OHOS)RUN-EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args | compare %f
// (Windows and not OHOS)ASSERT: scan-2 match success

/*
 * Test description: Test the basic function for FileInfo.apis
 * Test API: Apis in Class FileInfo
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.fs.*
import std.time.*

@Test
class Test_FileInfo {
    private var dir0 = canonicalize(Path(".\\"))

    private var f1 = FileInfo(dir0.join("testdir01").join("file"))
    private var f1_1 = FileInfo(".\\testdir01\\file")
    private var f1_2 = FileInfo(".\\testdir01\\..\\testdir01\\file")

    private var illegal_paths = ["", "\0", "C:\\\0", ".\\testdir01\0", "C:\\unexist\\aa\\bb", ".\\unexist"]
    private var data = Array<Byte>(100, repeat: 90)

    public override func afterEach(): Unit {
        var dirinfo = FileInfo("testdir01")
        dirinfo.setWritable(true)
        dirinfo.setExecutable(true)
        dirinfo.setReadable(true)

        var fileinfo = FileInfo("testdir01\\file")
        fileinfo.setWritable(true)
        fileinfo.setExecutable(true)
        fileinfo.setReadable(true)
    }

    @TestCase
    func test_init_pathkinds(): Unit {
        @Expect(f1.path == f1_1.path, true)
        @Expect(f1.path == f1_2.path, true)
    }

    @TestCase
    func test_init_illegal_path(): Unit {
        var sum = 0
        for (str in illegal_paths) {
            try {
                var fileinfo = FileInfo(str)
            } catch (e: FSException | IllegalArgumentException) {
                println(e.message)
                @Expect(e.message.contains("The path `${str}` does not exist") || e.message.contains("The path cannot"))
                sum += 1
            }
            try {
                var fileinfo = FileInfo(Path(str))
            } catch (e: FSException | IllegalArgumentException) {
                println(e.message)
                @Expect(e.message.contains("The path `${str}` does not exist") || e.message.contains("The path cannot"))
                sum += 1
            }
        }
        @Expect(sum, 12)
    }

    @TestCase
    func test_parentDirectory(): Unit {
        match (FileInfo(".\\").parentDirectory) {
            case Some(FileInfo) => println("match success")
            case None => @Expect("1", "2")
        }
        match (FileInfo("C:\\").parentDirectory) {
            case Some(FileInfo) => @Expect("1", "2")
            case None => println("match success")
        }
    }

    @TestCase
    func test_getTime(): Unit {
        var paths = ["symlink01", "symlink02", "testdir01\\file", "testdir01"]
        var callapis: Array<(FileInfo) -> DateTime> = [
            {fileinfo: FileInfo => fileinfo.creationTime},
            {fileinfo: FileInfo => fileinfo.lastAccessTime},
            {fileinfo: FileInfo => fileinfo.lastModificationTime}
        ]
        for (str in paths) {
            var fileinfo = FileInfo(str)
            for (callapi in callapis) {
                var time1: DateTime = callapi(fileinfo)
                var time2: DateTime = callapi(fileinfo)
                @Expect(time1, time2)
            }
        }
    }

    @TestCase
    func test_length(): Unit {
        var fileinfo = FileInfo("testdir01\\file")
        var dirinfo = FileInfo("testdir01")
        var len1 = dirinfo.size
        @Expect(fileinfo.size, 0)

        File.appendTo("testdir01\\file", data)
        var dirinfo1 = FileInfo("testdir01")
        var len2 = dirinfo1.size
        @Expect(fileinfo.size, data.size)
        @Expect(len2, len1 + 100)
    }

    @TestCase
    func test_isSymbolicLink_isRegular_isDirectory(): Unit {
        var fileinfo = FileInfo("testdir01\\file")
        var hid_fileinfo = FileInfo("testdir01\\.file")
        var dirinfo = FileInfo("testdir01")
        var linkinfo1 = FileInfo("symlink01")
        var linkinfo2 = FileInfo("symlink02")

        @Expect(fileinfo.isSymbolicLink(), false)
        @Expect(fileinfo.isRegular(), true)
        @Expect(fileinfo.isDirectory(), false)

        @Expect(hid_fileinfo.isSymbolicLink(), false)
        @Expect(hid_fileinfo.isRegular(), true)
        @Expect(hid_fileinfo.isDirectory(), false)

        @Expect(dirinfo.isSymbolicLink(), false)
        @Expect(dirinfo.isRegular(), false)
        @Expect(dirinfo.isDirectory(), true)

        @Expect(linkinfo1.isSymbolicLink(), true)
        @Expect(linkinfo1.isRegular(), false)
        @Expect(linkinfo1.isDirectory(), false)
        @Expect(linkinfo2.isSymbolicLink(), true)
        @Expect(linkinfo2.isRegular(), false)
        @Expect(linkinfo2.isDirectory(), false)
    }

    @TestCase
    func test_enqual_unequal(): Unit {
        var fileinfo = FileInfo("testdir01\\file")
        var dirinfo = FileInfo("testdir01")
        var linkinfo1 = FileInfo("symlink01")
        var linkinfo2 = FileInfo("symlink02")
        var linkinfo3 = FileInfo("symlink03")
        var linkinfo4 = FileInfo("symlink04")

        @Expect(linkinfo1 == FileInfo("unexists"), false)
        @Expect(linkinfo2 == fileinfo, false)
        @Expect(linkinfo2 == linkinfo3, false)
        @Expect(linkinfo4 == dirinfo, false)
        @Expect(fileinfo == dirinfo, false)

        @Expect(linkinfo1 != FileInfo("unexists"), true)
        @Expect(linkinfo2 != fileinfo, true)
        @Expect(linkinfo2 != linkinfo3, true)
        @Expect(linkinfo4 != dirinfo, true)
        @Expect(fileinfo != dirinfo, true)
    }

    @TestCase
    func test_isHidden(): Unit {
        var fileinfo = FileInfo("testdir01\\file")
        var hid_fileinfo = FileInfo("testdir01\\.file")
        var linkinfo2 = FileInfo("symlink02")
        @Expect(fileinfo.isHidden(), false)
        @Expect(hid_fileinfo.isHidden(), true)
        @Expect(linkinfo2.isHidden(), false)

        Directory.create(".testdir02")
        var dirinfo = FileInfo(".testdir02")
        @Expect(dirinfo.isHidden(), true)
        remove(".testdir02")
    }
}
