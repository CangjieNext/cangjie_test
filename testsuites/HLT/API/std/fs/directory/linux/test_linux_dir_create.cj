/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (not Windows or OHOS) EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (not Windows or OHOS) RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 

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
        var illegal_path_string = ["", "/", "./", "/a\0"]
        for (str in illegal_path_string) {
            try {
                Directory.create(str, recursive: false)
            } catch (e: IllegalArgumentException) {
                @Expect(e.message, "Invalid path `${str}`, failed to create directory.")
                sum += 1
            }
            try {
                Directory.create(Path(str), recursive: true)
            } catch (e: IllegalArgumentException) {
                @Expect(e.message, "Invalid path `${str}`, failed to create directory.")
                sum += 1
            }
        }
        @Expect(sum, 8)
    }

    @TestCase
    func test_recursive_1(): Unit {
        var sum = 0
        @Expect(exists("tem_dir_02"), false)
        let dir = "tem_dir_02/dir002"
        try {
            Directory.create(dir)
        } catch (e: FSException) {
            @Expect(e.message, "Failed to create directory `${dir}`, parent directory `tem_dir_02` does not exist.")
            sum += 1
        }
        @Expect(sum, 1)
    }
}
