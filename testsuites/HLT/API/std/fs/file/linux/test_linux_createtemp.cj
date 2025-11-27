/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (not Windows or OHOS)EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (not Windows or OHOS)RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 

/*
 * Test description: Test the File.createTemp()
 * Test API: public static func createTemp(directoryPath: Path): File
 *           public static func createTemp(directoryPath: String): File
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.fs.*

@Test
class Test_File_CreateTemp {
    @TestCase
    func test_createtemp(): Unit {
        Directory.create("./dir001")
        @Assert(exists("./dir001"),true)
        var filetemp = File.createTemp(canonicalize(Path("./dir001")))
        @Assert(exists(filetemp.info.path), true)
        filetemp.close()
        var f1 = File.createTemp("./dir001")
        @Assert(exists(f1.info.path), true)
        f1.write(Array<Byte>(10, repeat: 0))
        f1.close()
        @Expect(f1.canRead(), false)
        @Expect(f1.canWrite(), false)
        remove("./dir001", recursive: true)
    }

    @TestCase
    func test_illegal(): Unit {
        var sum = 0
        var illegal_path_string = ["\0", "/home\0"]
        try {
            File.createTemp("")
        } catch (e: IllegalArgumentException) {
            sum += 1
        }
        try {
            File.createTemp(Path(""))
        } catch (e: IllegalArgumentException) {
            sum += 1
        }
        for (str in illegal_path_string) {
            try {
                File.createTemp(str)
            } catch (e: IllegalArgumentException) {
                sum += 1
            }
            try {
                File.createTemp(Path(str))
            } catch (e: IllegalArgumentException) {
                sum += 1
            }
        }
        @Expect(sum, 6)
    }

    @TestCase
    func test_fsexc(): Unit {
        var sum = 0
        var illegal_path_string = ["/a/b/c", "./a/c/b"]
        for (str in illegal_path_string) {
            try {
                File.createTemp(str)
            } catch (e: FSException) {
                @Expect(e.message, "Failed to canonical: the input path `${str}` may not exist or permission denied!")
                sum += 1
            }
        }
        File.create("./file01").close()
        try {
            File.createTemp("./file01")
        } catch (e: FSException) {
            @Expect(e.message, "Failed to create the temporary file!")
            sum += 1
        }
        @Expect(sum, 3)
        remove("./file01")
    }
}
