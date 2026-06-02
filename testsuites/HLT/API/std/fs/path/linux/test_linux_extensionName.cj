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
 * Test description: Test the Path.extensionName
 * Test API: public prop let extensionName: Option<String>
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.fs.*

@Test
class Test_Path_ExtensionName {
    private var illegal_path_string = ["\0", "/home\0"]
    private var path_string_extensionName: Array<(String, String)> = [
        ("/a/b/c", ""),
        ("/a/b/", ""),
        ("/", ""),
        ("./a/b", ""),
        ("./", ""),
        (".", ""),
        (".none", "none"),
        ("a.txt", "txt"),
        ("../.a.//..b", "b"),
        ("./.a.b.c", "c"),
        ("./...a..b...c", "c"),
        ("./...a.", "")
    ]

    @TestCase
    func test_extensionName_illegal(): Unit {
        var sum = 0
        try {
            Path("").extensionName
        } catch (e: IllegalArgumentException) {
            sum += 1
        }
        for (str in illegal_path_string) {
            try {
                Path(str).extensionName
            } catch (e: IllegalArgumentException) {
                sum += 1
            }
        }
        @Expect(sum, 3)
    }

    @TestCase
    func test_extensionName_linux(): Unit {
        for ((str, extensionName) in path_string_extensionName) {
            @Expect(Path(str).extensionName, extensionName)
        }
    }
}
