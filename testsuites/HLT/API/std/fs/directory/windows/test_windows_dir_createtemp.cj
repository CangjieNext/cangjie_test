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
 * Test description: Test the Directory.createTemp
 * Test API: public static func createTemp(directoryPath: String): Directory
 *           public static func createTemp(directoryPath: Path): Directory
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.fs.*

@Test
class Test_Dir_CreateTemp {
    private var path0 = canonicalize(Path("./"))

    @TestCase
    func test_createtemp_illegal(): Unit {
        var sum = 0
        var illegal_path_string = [".\\\0", "C:\\\0"]
        try {
            Directory.createTemp("")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input path is empty.")
            sum += 1
        }
        try {
            Directory.createTemp(Path(""))
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input path is empty.")
            sum += 1
        }
        for (str in illegal_path_string) {
            try {
                Directory.createTemp(str)
            } catch (e: IllegalArgumentException) {
                @Expect(e.message.contains("contains null character."))
                sum += 1
            }
            try {
                Directory.createTemp(Path(str))
            } catch (e: IllegalArgumentException) {
                @Expect(e.message.contains("contains null character."))
                sum += 1
            }
        }
        @Expect(sum, 6)
    }

    @TestCase
    func test_no_parent_dir(): Unit {
        var sum = 0
        var path1 = path0.join("dir001")
        @Expect(exists(path1), false)
        try {
            Directory.createTemp(path1)
        } catch (e: FSException) {
            @Expect(e.message, "Failed to canonical: the input path `${path1}` may not exist or permission denied!")
            sum += 1
        }
        @Expect(sum, 1)
    }

    @TestCase
    func test_createtemp(): Unit {
        var path2 = path0.join("dir002")
        var dir0 = Directory.create(path2, recursive: true)
        @Expect(exists(path2), true)
        @Expect(Directory.isEmpty(path2), true)
        Directory.createTemp(path2)
        @Expect(Directory.isEmpty(path2), false)
        remove("dir002", recursive: true)
    }
}
