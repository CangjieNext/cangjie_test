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
 * Test description: Test the Directory.create
 * Test API: public static func create(path: String, recursive!: Bool = false): Directory
 *           public static func create(path: Path, recursive!: Bool = false): Directory
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.fs.*

@Test
class Test_Dir_Create {
    @TestCase
    func test_create_illegal(): Unit {
        var sum = 0
        var illegal_path_string = ["", "C:\\a\0", ".\\"]
        for (str in illegal_path_string) {
            try {
                Directory.create(str, recursive: false)
            } catch (e: IllegalArgumentException) {
                @Expect(e.message.contains("failed to create directory"))
                sum += 1
            }
            try {
                Directory.create(Path(str), recursive: true)
            } catch (e: IllegalArgumentException) {
                @Expect(e.message.contains("failed to create directory"))
                sum += 1
            }
        }
        @Expect(sum, 6)

        var fs_path_string1 = ["\\\\.\\D1:\\"]
        //异常信息不合理 
        for (str in fs_path_string1) {
            try {
                Directory.create(str, recursive: false)
            } catch (e: FSException) {
                @Expect(e.message, "Failed to create directory `${str}`, parent directory `${str}` does not exist.")
                sum += 1
            }
            try {
                Directory.create(Path(str), recursive: true)
            } catch (e: FSException) {
                @Expect(e.message, "Failed to recursive create directory `${str}` return -2: \"No such file or directory\".")
                sum += 1
            }
        }
        @Expect(sum, 8)
    }

    @TestCase
    func test_existed_dir(): Unit {
        var sum = 0
        Directory.create("tempdir")
        @Assert(exists("tempdir"), true)
        var path0 = canonicalize(Path("tempdir"))
        try {
            Directory.create(path0)
        } catch (e: FSException) {
            @Expect(e.message, "The input path `${path0}` is already exists.")
            println("===============================")
            sum += 1
        }
        @Expect(sum, 1)
        remove("tempdir", recursive: true)
    }

    @TestCase
    func test_recursive_1(): Unit {
        var sum = 0
        @Expect(exists(".\\dir004"), false)
        try {
            Directory.create(".\\dir004\\dir002")
            @Expect("parent dir", "does not exist")
        } catch (e: FSException) {
            @Expect(e.message, "Failed to create directory `.\\dir004\\dir002`, parent directory `.\\dir004` does not exist.")
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_recursive_2(): Unit {
        @Expect(exists(".\\dir003"), false)
        Directory.create(".\\dir003\\dir002", recursive: true)
        @Expect(exists(".\\dir003\\dir002"), true)
        println("===============================")
        remove(".\\dir003\\dir002", recursive: true)
    }
}
