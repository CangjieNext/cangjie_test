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
// (Windows and not OHOS)EXEC: mklink .hidden_link testdir01/file
// (Windows and not OHOS)EXEC: mklink broken_runtime_link missing_runtime_target
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

        var targetInfo = FileInfo("testdir01\\file")
        var followedLinkInfo = FileInfo("symlink02")
        @Expect(followedLinkInfo.creationTime, targetInfo.creationTime)
        @Expect(followedLinkInfo.lastAccessTime, targetInfo.lastAccessTime)
        @Expect(followedLinkInfo.lastModificationTime, targetInfo.lastModificationTime)

        var selfLinkInfo = FileInfo("symlink02", followSymlink: false)
        @Expect(selfLinkInfo.creationTime, selfLinkInfo.creationTime)
        @Expect(selfLinkInfo.lastAccessTime, selfLinkInfo.lastAccessTime)
        @Expect(selfLinkInfo.lastModificationTime, selfLinkInfo.lastModificationTime)
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

        var followedLinkInfo = FileInfo("symlink02")
        var selfLinkInfo = FileInfo("symlink02", followSymlink: false)
        @Expect(followedLinkInfo.size, fileinfo.size)
        @Expect(selfLinkInfo.size != fileinfo.size, true)
    }

    @TestCase
    func test_isSymbolicLink_isRegular_isDirectory(): Unit {
        var fileinfo = FileInfo("testdir01\\file")
        var hid_fileinfo = FileInfo("testdir01\\.file")
        var dirinfo = FileInfo("testdir01")
        var linkinfo1 = FileInfo("symlink01", followSymlink: false)
        var linkinfo2 = FileInfo("symlink02", followSymlink: false)
        var pathLinkInfo = FileInfo(Path("symlink02"), followSymlink: false)
        var followedFileLinkInfo = FileInfo("symlink02")
        var followedDirLinkInfo = FileInfo("symlink04")
        var pathFollowedFileLinkInfo = FileInfo(Path("symlink02"))

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
        @Expect(pathLinkInfo.isSymbolicLink(), true)
        @Expect(pathLinkInfo.isRegular(), false)
        @Expect(pathLinkInfo.isDirectory(), false)

        @Expect(followedFileLinkInfo.isSymbolicLink(), false)
        @Expect(followedFileLinkInfo.isRegular(), true)
        @Expect(followedFileLinkInfo.isDirectory(), false)
        @Expect(followedDirLinkInfo.isSymbolicLink(), false)
        @Expect(followedDirLinkInfo.isRegular(), false)
        @Expect(followedDirLinkInfo.isDirectory(), true)
        @Expect(pathFollowedFileLinkInfo.isSymbolicLink(), false)
        @Expect(pathFollowedFileLinkInfo.isRegular(), true)
        @Expect(pathFollowedFileLinkInfo.isDirectory(), false)
    }

    @TestCase
    func test_enqual_unequal(): Unit {
        var fileinfo = FileInfo("testdir01\\file")
        var dirinfo = FileInfo("testdir01")
        var linkinfo1 = FileInfo("symlink01", followSymlink: false)
        var linkinfo2 = FileInfo("symlink02", followSymlink: false)
        var linkinfo3 = FileInfo("symlink03", followSymlink: false)
        var linkinfo4 = FileInfo("symlink04", followSymlink: false)

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
        var linkinfo2 = FileInfo("symlink02", followSymlink: false)
        var hiddenLinkInfo = FileInfo(".hidden_link")
        var hiddenSelfLinkInfo = FileInfo(".hidden_link", followSymlink: false)
        @Expect(fileinfo.isHidden(), false)
        @Expect(hid_fileinfo.isHidden(), true)
        @Expect(linkinfo2.isHidden(), false)
        @Expect(hiddenLinkInfo.isHidden(), false)
        @Expect(hiddenSelfLinkInfo.isHidden(), true)

        Directory.create(".testdir02")
        var dirinfo = FileInfo(".testdir02")
        @Expect(dirinfo.isHidden(), true)
        remove(".testdir02")
    }

    @TestCase
    func test_symlink_permission_queries_and_setters(): Unit {
        var targetInfo = FileInfo("testdir01\\file")
        var followedLinkInfo = FileInfo("symlink02")
        var selfLinkInfo = FileInfo("symlink02", followSymlink: false)

        @Expect(followedLinkInfo.canRead(), targetInfo.canRead())
        @Expect(followedLinkInfo.canWrite(), targetInfo.canWrite())
        @Expect(followedLinkInfo.canExecute(), targetInfo.canExecute())
        @Expect(followedLinkInfo.isReadOnly(), targetInfo.isReadOnly())

        @Expect(selfLinkInfo.canRead(), true)
        @Expect(selfLinkInfo.canWrite(), true)
        @Expect(selfLinkInfo.canExecute(), false)
        @Expect(selfLinkInfo.isReadOnly(), false)

        @Expect(selfLinkInfo.setReadable(false), true)
        @Expect(selfLinkInfo.setWritable(false), true)
        @Expect(selfLinkInfo.setExecutable(false), false)
        @Expect(targetInfo.canRead(), true)
        @Expect(targetInfo.canWrite(), true)
        @Expect(targetInfo.canExecute(), false)
    }

    @TestCase
    func test_dangling_symlink_queries(): Unit {
        var selfLinkInfo = FileInfo("broken_runtime_link", followSymlink: false)
        @Expect(selfLinkInfo.isSymbolicLink(), true)
        @Expect(selfLinkInfo.isRegular(), false)
        @Expect(selfLinkInfo.isDirectory(), false)
        @Expect(selfLinkInfo.size >= 0, true)
        @Expect(selfLinkInfo.isHidden(), false)
        @Expect(selfLinkInfo.isReadOnly(), false)
        @Expect(selfLinkInfo.canRead(), true)
        @Expect(selfLinkInfo.canWrite(), true)
        @Expect(selfLinkInfo.canExecute(), false)
        @Expect(selfLinkInfo.creationTime, selfLinkInfo.creationTime)
        @Expect(selfLinkInfo.lastAccessTime, selfLinkInfo.lastAccessTime)
        @Expect(selfLinkInfo.lastModificationTime, selfLinkInfo.lastModificationTime)

        @ExpectThrows[FSException](FileInfo("broken_runtime_link").isSymbolicLink())
        @ExpectThrows[FSException](FileInfo("broken_runtime_link").isRegular())
        @ExpectThrows[FSException](FileInfo("broken_runtime_link").isDirectory())
        @ExpectThrows[FSException](FileInfo("broken_runtime_link").isReadOnly())
        @ExpectThrows[FSException](FileInfo("broken_runtime_link").canRead())
        @ExpectThrows[FSException](FileInfo("broken_runtime_link").canWrite())
        @ExpectThrows[FSException](FileInfo("broken_runtime_link").canExecute())
        @ExpectThrows[FSException](FileInfo("broken_runtime_link").size)
        @ExpectThrows[FSException](FileInfo("broken_runtime_link").creationTime)
        @ExpectThrows[FSException](FileInfo("broken_runtime_link").lastAccessTime)
        @ExpectThrows[FSException](FileInfo("broken_runtime_link").lastModificationTime)
    }
}
