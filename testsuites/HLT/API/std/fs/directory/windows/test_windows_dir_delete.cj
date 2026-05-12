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
 * Test description: Test the remove
 * Test API: public static func delete(path: String, recursive!: Bool = false): Unit
 *           public static func delete(path: Path, recursive!: Bool = false): Unit
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.fs.*

@Test
class Test_Dir_Delete {
    @TestCase
    func test_illegal(): Unit {
        var s1 = String.fromUtf8(Array<UInt8>(4096, repeat: 10))
        var illegal_paths = ["\0", "C:\\\0", ".\\a\\b\0", s1]
        var sum = 0
        for (path in illegal_paths) {
            try {
                remove(path)
            } catch (e: IllegalArgumentException) {
                sum += 1
                @Expect(e.message.contains("contains null character."))
            } catch (e: FSException) {
                sum += 1
                @Expect(e.message.contains("The system cannot find the path specified"))
            }
            try {
                remove(Path(path), recursive: true)
            } catch (e: IllegalArgumentException) {
                sum += 1
                @Expect(e.message.contains("contains null character."))
            } catch (e: FSException) {
                sum += 1
                @Expect(e.message.contains("The system cannot find the path specified"))
            }
        }
        @Expect(sum, 8)

        var illegal_path = ["", s1]
        for (path in illegal_path) {
            try {
                remove(path)
            } catch (e: IllegalArgumentException) {
                sum += 1
                @Expect(e.message,"The input path is empty.")
            } catch (e: FSException) {
                sum += 1
                @Expect(e.message.contains("The system cannot find the path specified"))
            }
            try {
                remove(Path(path), recursive: true)
            } catch (e: IllegalArgumentException) {
                sum += 1
                @Expect(e.message,"The input path is empty.")
            } catch (e: FSException) {
                sum += 1
                @Expect(e.message.contains("The system cannot find the path specified"))
            }
        }
        @Expect(sum, 12)
    }

    @TestCase
    func test_fs_exception(): Unit {
        var path1 = canonicalize(Path(".\\")).join("unexistdir").join("test")
        @Assert(exists(path1), false)
        @Assert(exists(path1), false)
        var fs_paths = [path1.toString(), ".\\unexistdir\\test"]
        var sum = 0
        for (path in fs_paths) {
            try {
                remove(path)
            } catch (e: FSException) {
                @Expect(e.message.contains("The system cannot find the path specified"))
                sum += 1
            }
            try {
                remove(path.toString(), recursive: true)
            } catch (e: FSException) {
                @Expect(e.message.contains("The system cannot find the path specified"))
                sum += 1
            }
        }
        Directory.create("testdir")
        @Assert(exists("testdir"), true)
        var cretemp = Directory.createTemp("testdir")
        @Assert(exists(cretemp), true)
        try {
            remove("testdir")
        } catch (e: FSException) {
            @Expect(e.message.contains("The directory is not empty"))
            sum += 1
        }
        @Expect(sum, 5)
    }

    @TestCase
    func test_delete_success(): Unit {
        Directory.create("dir1")
        @Assert(exists("dir1"), true)
        Directory.create("dir2")
        @Assert(exists("dir2"), true)
        File.create("dir1\\temp").close()

        var path1 = "\\\\.\\" + canonicalize(Path("dir2")).toString()
        remove(path1)
        remove("dir1", recursive: true)
        @Expect(exists("dir1"), false)
        @Expect(exists(path1), false)
    }
}
