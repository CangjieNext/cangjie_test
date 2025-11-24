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
 * Test description: Test the rename
 * Test API: public static func move(sourceDirPath: String, destinationDirPath: String, overwrite: Bool): Unit
 *           public static func move(sourceDirPath: Path, destinationDirPath: Path, overwrite: Bool): Unit
 *           public static func copy(sourceDirPath: String, destinationDirPath: String, overwrite: Bool): Unit
 *           public static func copy(sourceDirPath: Path, destinationDirPath: Path, overwrite: Bool): Unit
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.fs.*
import std.process.*

let root: Bool = (Process.current.getEnv("USER") == "root")

@Test
class Test_Dir_Move_Copy {
    private var dirpath = canonicalize(Path("./")).join("tmp").toString()
    private var dirpaths = [dirpath + "/dir1", "./tmp/dir2"]
    private var sum = 0

    public override func beforeEach(): Unit {
        Directory.create(dirpath)
        @Assert(exists(dirpath), true)
        sum = 0
    }

    public override func afterEach(): Unit {
        remove(dirpath, recursive: true)
    }

    @TestCase
    func test_path_copy_move(): Unit {
        Directory.create(dirpaths[0], recursive: true)
        @Assert(exists(dirpaths[0]), true)

        rename(dirpaths[0], to: dirpaths[1], overwrite: false)
        @Expect(exists(dirpaths[0]), false)
        @Expect(exists(dirpaths[1]), true)

        copy(dirpaths[1], to: dirpaths[0], overwrite: true) //无异常
        @Expect(exists(dirpaths[0]), true)
        @Expect(exists(dirpaths[1]), true)
    }

    @TestCase
    func test_move_withfile(): Unit {
        Directory.create(dirpaths[0])
        @Assert(exists(dirpaths[0]), true)
        Directory.create("./tmp/dir1/dir")
        @Assert(exists("./tmp/dir1/dir"), true)
        File.create("./tmp/dir1/file").close()
        var fileinfo = FileInfo("./tmp/dir1/file")
        @Expect(fileinfo.canWrite(), true)
        fileinfo.setWritable(false)

        rename(dirpaths[0], to: dirpaths[1], overwrite: false)
        @Expect(exists("./tmp/dir1/file"), false)
        @Expect(exists("./tmp/dir1/dir"), false)
        @Expect(exists("./tmp/dir2/file"), true)
        @Expect(exists("./tmp/dir2/dir"), true)

        rename(dirpaths[1], to: dirpaths[0], overwrite: true)
        @Expect(exists("./tmp/dir1/file"), true)
        @Expect(exists("./tmp/dir1/dir"), true)
        @Expect(exists("./tmp/dir2/file"), false)
        @Expect(exists("./tmp/dir2/dir"), false)

        var fileinfo1 = FileInfo("./tmp/dir1/file")
        @Expect(fileinfo1.canWrite(), false)

        Directory.create(dirpaths[1])
        @Assert(exists(dirpaths[1]), true)
        try {
            rename(dirpaths[0], to: dirpaths[1], overwrite: false)
        } catch (e: FSException) {
            @Expect(e.message, "Destination path 'to' `${dirpaths[1]}` is already exists and overwrite is false.")
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_copy_withfile(): Unit {
        Directory.create(dirpaths[0])
        @Assert(exists(dirpaths[0]), true)
        Directory.create("./tmp/dir1/dir")
        @Assert(exists("./tmp/dir1/dir"), true)
        File.create("./tmp/dir1/file").close()
        var fileinfo = FileInfo("./tmp/dir1/file")
        fileinfo.setWritable(false)

        copy(dirpaths[0], to: dirpaths[1], overwrite: true)
        @Expect(exists("./tmp/dir1/file"), true)
        @Expect(exists("./tmp/dir1/dir"), true)
        @Expect(exists("./tmp/dir2/file"), true)
        @Expect(exists("./tmp/dir2/dir"), true)
        var fileinfo1 = FileInfo("./tmp/dir2/file")
        @Expect(fileinfo1.canWrite(), false)
        fileinfo1.setWritable(true)

        try {
            copy(dirpaths[1], to: dirpaths[0], overwrite: false)
        } catch (e: FSException) {
            sum += 1
        }
        if (root) {
            copy(dirpaths[1], to: dirpaths[0], overwrite: true)
            @Expect(exists("./tmp/dir1/file"), true)
            @Expect(exists("./tmp/dir1/dir"), true)
            @Expect(exists("./tmp/dir2/file"), true)
            @Expect(exists("./tmp/dir2/dir"), true)

            var fileinfo2 = FileInfo("./tmp/dir1/file")
            @Expect(fileinfo2.canWrite(), true)
            @Expect(sum, 1)
        } else {
            try {
                copy(dirpaths[1], to: dirpaths[0], overwrite: true)
            } catch (e: FSException) {
                @Expect(e.message, "Failed to copy `${dirpaths[1]}` to `${dirpaths[0]}`!")
                sum += 1
            }
            @Expect(sum, 2)
        }
    }

    @TestCase
    func test_copy_to_self(): Unit {
        Directory.create(dirpaths[0])
        @Assert(exists(dirpaths[0]), true)
        try {
            copy(dirpaths[0], to: dirpaths[0], overwrite: false)
        } catch (e: FSException) {
            sum += 1
        }

        @Expect(sum, 1)
    }

    @TestCase
    func test_move_to_self(): Unit {
        Directory.create(dirpaths[0])
        @Assert(exists(dirpaths[0]), true)
        File.create("./tmp/dir1/file").close()
        try {
            rename(dirpaths[0], to: dirpaths[0], overwrite: false)
        } catch (_: FSException) {
            @Expect(exists("./tmp/dir1/file"), true)
            return
        }

        @Expect(false)
    }

    @TestCase
    func test_copy_to_subdir(): Unit {
        Directory.create(dirpaths[0])
        @Assert(exists(dirpaths[0]), true)
        try {
            copy(dirpath, to: dirpaths[0], overwrite: false)
        } catch (e: FSException) {
            sum += 1
        }
        try {
            copy(dirpath, to: dirpaths[0], overwrite: true)
        } catch (e: FSException) {
            @Expect(e.message, "The destinationDirPath `${dirpaths[0]}` is in the sourceDirPath `${dirpath}`.")
            sum += 1
        }
        @Expect(sum, 2)
    }

    @TestCase
    func test_move_to_subdir(): Unit {
        Directory.create(dirpaths[0])
        @Assert(exists(dirpaths[0]), true)
        try {
            copy(dirpath, to: dirpaths[0], overwrite: false)
        } catch (e: FSException) {
            sum += 1
        }
        try {
            copy(dirpath, to: dirpaths[0], overwrite: true)
        } catch (e: FSException) {
            @Expect(e.message, "The destinationDirPath `${dirpaths[0]}` is in the sourceDirPath `${dirpath}`.")
            sum += 1
        }
        @Expect(sum, 2)
    }
}
