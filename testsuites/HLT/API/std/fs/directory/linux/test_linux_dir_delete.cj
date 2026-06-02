/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (not Windows or OHOS) EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (not Windows or OHOS) RUN-EXEC: export USER=`whoami` && %run %run_opt %output %run_utest_opt %run_args

/*
 * Test description: Test the remove
 * Test API: public static func delete(path: String, recursive!: Bool = false): Unit
 *           public static func delete(path: Path, recursive!: Bool = false): Unit
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.fs.*
import std.process.*

var user = Option<String>.None

@Test
class Test_Dir_Delete {
    public override func beforeAll(): Unit {
        user = Process.current.getEnv("USER")
    }

    @TestCase
    func test_illegal(): Unit {
        var s1 = String.fromUtf8(Array<UInt8>(4096, repeat: 10))
        var illegal_paths = ["", "\0", "/home/a/b\0", "./home/a/b\0", s1]
        var sum = 0
        for (path in illegal_paths) {
            try {
                remove(path)
            } catch (e: IllegalArgumentException | FSException) {
                sum += 1
            }
            try {
                remove(Path(path), recursive: true)
            } catch (e: IllegalArgumentException | FSException) {
                sum += 1
            }
        }
        @Expect(sum, 10)
    }

    @TestCase
    func test_fs_exception(): Unit {
        @Assert(exists("/home/unexistdir/test"), false)
        @Assert(exists("./unexistdir/test"), false)
        var fs_paths = ["/home/unexistdir/test", "./unexistdir/test"]
        var sum = 0
        for (path in fs_paths) {
            try {
                remove(path)
            } catch (e: FSException) {
                sum += 1
            }
            try {
                remove(path.toString(), recursive: true)
            } catch (e: FSException) {
                sum += 1
            }
        }
        try {
            Directory.create("testdir")
        } catch (_: FSException) {
            ()
        }
        try {
            Directory.createTemp("testdir")
        } catch (_: FSException) {
            ()
        }

        try {
            remove("testdir")
        } catch (e: FSException) {
            sum += 1
        }
        @Expect(sum, 5)

        try {
            remove("testdir", recursive: true)
        } catch (_: FSException) {
            ()
        }
    }

    @TestCase
    func test_delete_success(): Unit {
        Directory.create("dir1")
        @Assert(exists("dir1"), true)
        Directory.create("dir2")
        @Assert(exists("dir2"), true)
        File.create("dir1/temp").close()

        remove("dir2")
        remove("dir1", recursive: true)
        @Expect(exists("dir1"), false)
        @Expect(exists("dir2"), false)
    }

    @TestCase
    func test_delete_change_permission(): Unit {
        var sum = 0
        Directory.create("dir1")
        @Assert(exists("dir1"), true)
        File.create("dir1/temp").close()
        var fileinfo = FileInfo("dir1/temp")
        fileinfo.setWritable(false)
        fileinfo.setReadable(false)
        fileinfo.setExecutable(false)
        var dirinfo = FileInfo("dir1")
        dirinfo.setExecutable(false)
        dirinfo.setReadable(false)
        dirinfo.setWritable(false)
        try {
            remove("dir1", recursive: false)
        } catch (e: FSException) {
            sum += 1
        }
        try {
            remove("dir1", recursive: true)
        } catch (e: FSException) {
            sum += 1
        }
        match (user) {
            case Some("root") => @Expect(sum, 1)
            case _ =>
                dirinfo.setExecutable(true)
                dirinfo.setReadable(true)
                dirinfo.setWritable(true)
                remove("dir1", recursive: true)
                @Expect(sum, 2)
        }
    }
}
