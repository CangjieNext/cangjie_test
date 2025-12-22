/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (not iOS and not Windows or OHOS) EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (not iOS and not Windows or OHOS) RUN-EXEC: mkdir testdir01
// (not iOS and not Windows or OHOS) RUN-EXEC: touch testdir01/file
// (not iOS and not Windows or OHOS) RUN-EXEC: touch testdir01/.file
// (not iOS and not Windows or OHOS) RUN-EXEC: ln -s unexists symlink01
// (not iOS and not Windows or OHOS) RUN-EXEC: ln -s testdir01/file symlink02
// (not iOS and not Windows or OHOS) RUN-EXEC: ln -s testdir01/file symlink03
// (not iOS and not Windows or OHOS) RUN-EXEC: ln -s testdir01 symlink04
// (not iOS and not Windows or OHOS) RUN-EXEC: touch unexists
// (not iOS and not Windows or OHOS) RUN-EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args | compare %f
// (not iOS and not Windows or OHOS) ASSERT: scan-2 match success
// (not iOS and not Windows or OHOS) RUN-EXEC: rm -rf testdir01 symlink01 symlink02 symlink03 symlink04 unexists

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
    private var dir0 = canonicalize(Path("./"))

    private var f1 = FileInfo(dir0.join("testdir01").join("file"))
    private var f1_1 = FileInfo("./testdir01/file")
    private var f1_2 = FileInfo("./testdir01/../testdir01/file")

    private var illegal_paths = ["", "\0", "/home\0", "./testdir01\0", "/home/unexist/aa/bb", "./unexist"]
    private var data = Array<Byte>(100, repeat: 90)

    public override func afterEach(): Unit {
        var dirinfo = FileInfo("testdir01")
        dirinfo.setWritable(true)
        dirinfo.setExecutable(true)
        dirinfo.setReadable(true)

        var fileinfo = FileInfo("testdir01/file")
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
                sum += 1
            }
            try {
                var fileinfo = FileInfo(Path(str))
            } catch (e: FSException | IllegalArgumentException) {
                sum += 1
            }
        }
        @Expect(sum, 12)
    }

    @TestCase
    func test_parentDirectory(): Unit {
        match (FileInfo("/home").parentDirectory) {
            case Some(FileInfo) => println("match success")
            case None => @Expect("1", "2")
        }
        match (FileInfo("/").parentDirectory) {
            case Some(FileInfo) => @Expect("1", "2")
            case None => println("match success")
        }
    }

    @TestCase
    func test_getTime(): Unit {
        var paths = ["symlink01", "symlink02", "testdir01/file", "testdir01"]
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
        var fileinfo = FileInfo("testdir01/file")
        var dirinfo = FileInfo("testdir01")
        var len1 = dirinfo.size
        @Expect(fileinfo.size, 0)

        File.appendTo("testdir01/file", data)
        var len2 = dirinfo.size
        @Expect(fileinfo.size, data.size)
        @Expect(len2, len1 + 100)
    }

    @TestCase
    func test_isSymbolicLink_isFile_isDirectory(): Unit {
        var fileinfo = FileInfo("testdir01/file")
        var hid_fileinfo = FileInfo("testdir01/.file")
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
        var fileinfo = FileInfo(canonicalize("testdir01/file"))
        var dirinfo = FileInfo(canonicalize("testdir01"))
        var linkinfo1 = FileInfo(canonicalize("symlink01"))
        var linkinfo2 = FileInfo(canonicalize("symlink02"))
        var linkinfo3 = FileInfo(canonicalize("symlink03"))
        var linkinfo4 = FileInfo(canonicalize("symlink04"))

        @Expect(linkinfo1 == FileInfo(canonicalize("unexists")), true)
        @Expect(linkinfo2 == fileinfo, true)
        @Expect(linkinfo2 == linkinfo3, true)
        @Expect(linkinfo4 == dirinfo, true)
        @Expect(fileinfo == dirinfo, false)

        @Expect(linkinfo1 != FileInfo(canonicalize("unexists")), false)
        @Expect(linkinfo2 != fileinfo, false)
        @Expect(linkinfo2 != linkinfo3, false)
        @Expect(linkinfo4 != dirinfo, false)
        @Expect(fileinfo != dirinfo, true)
    }

    @TestCase
    func test_isHidden(): Unit {
        var fileinfo = FileInfo("testdir01/file")
        var hid_fileinfo = FileInfo("testdir01/.file")
        var linkinfo2 = FileInfo("symlink02")
        @Expect(fileinfo.isHidden(), false)
        @Expect(hid_fileinfo.isHidden(), true)
        @Expect(linkinfo2.isHidden(), false)

        Directory.create(".testdir02")
        var dirinfo = FileInfo(".testdir02")
        @Expect(dirinfo.isHidden(), true)
        remove(".testdir02")
    }

    @TestCase
    func test_isReadOnly_setReadable(): Unit {
        var fileinfo = FileInfo("testdir01/file")
        var dirinfo = FileInfo("testdir01")
        var linkinfo = FileInfo("symlink02")

        @Expect(fileinfo.isReadOnly(), false)
        @Expect(dirinfo.isReadOnly(), false)
        @Expect(linkinfo.isReadOnly(), false)

        fileinfo.setWritable(false)
        dirinfo.setWritable(false)
        @Expect(fileinfo.isReadOnly(), false)
        @Expect(dirinfo.isReadOnly(), false)
        @Expect(linkinfo.isReadOnly(), false)

        fileinfo.setExecutable(false)
        @Expect(fileinfo.isReadOnly(), true)
        @Expect(linkinfo.isReadOnly(), true)
        fileinfo.setReadable(false)
        @Expect(fileinfo.isReadOnly(), false)
        @Expect(linkinfo.isReadOnly(), false)

        dirinfo.setExecutable(false)
        @Expect(dirinfo.isReadOnly(), true)
        dirinfo.setReadable(false)
        @Expect(dirinfo.isReadOnly(), false)
    }

    @TestCase
    func test_set_can_01(): Unit {
        var fileinfo = FileInfo("testdir01/file")
        var hid_fileinfo = FileInfo("testdir01/.file")
        var dirinfo = FileInfo("testdir01")
        var linkinfo = FileInfo("symlink02")

        var infos: Array<FileInfo> = [fileinfo, hid_fileinfo, linkinfo, dirinfo]
        for (info in infos) {
            @Expect(info.setExecutable(false), true)
            @Expect(info.canExecute(), false)
            @Expect(info.setWritable(false), true)
            @Expect(info.canWrite(), false)
            @Expect(info.setReadable(false), true)
            @Expect(info.canRead(), false)

            @Expect(info.setExecutable(true), true)
            @Expect(info.canExecute(), true)
            @Expect(info.setWritable(true), true)
            @Expect(info.canWrite(), true)
            @Expect(info.setReadable(true), true)
            @Expect(info.canRead(), true)
        }
    }

    @TestCase
    func test_set_can_02(): Unit {
        var fileinfo = FileInfo("testdir01/file")
        var linkinfo1 = FileInfo("symlink02")
        var linkinfo2 = FileInfo("symlink03")

        var infos: Array<FileInfo> = [fileinfo, linkinfo1, linkinfo2]
        @Expect(linkinfo1.setExecutable(false), true)
        @Expect(linkinfo1.setWritable(false), true)
        @Expect(linkinfo1.setReadable(false), true)
        for (info in infos) {
            @Expect(info.canExecute(), false)
            @Expect(info.canWrite(), false)
            @Expect(info.canRead(), false)
        }

        @Expect(fileinfo.setExecutable(true), true)
        @Expect(fileinfo.setWritable(true), true)
        @Expect(fileinfo.setReadable(true), true)
        for (info in infos) {
            @Expect(info.canExecute(), true)
            @Expect(info.canWrite(), true)
            @Expect(info.canRead(), true)
        }
    }
}
