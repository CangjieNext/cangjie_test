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
 * Test description: Test the Path.directoryName
 * Test API: public prop let directoryName: Option<Path>
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.fs.*

@Test
class Test_Path_Parent {
    private var illegal_path_string = ["\0", "/home\0"]
    private var path_string_dirname: Array<(String, Path)> = [
        ("/a/b/c", Path("/a/b")),
        ("/a/b/", Path("/a")),
        ("/a", Path("/")),
        ("/", Path("/")),
        ("./a/b", Path("./a")),
        ("./", Path("")),
        (".", Path("")),
        (".none", Path("")),
        ("a.txt", Path("")),
        ("./a/b/", Path("./a")),
        ("../a/b", Path("../a")),
        ("/a/b////c", Path("/a/b")),
        (".///a//b", Path(".///a"))
    ]

    @TestCase
    func test_directoryName_illegal(): Unit {
        var sum = 0
        try {
            Path("").parent
        } catch (e: IllegalArgumentException) {
            sum += 1
        }
        for (str in illegal_path_string) {
            try {
                Path(str).parent
            } catch (e: IllegalArgumentException) {
                sum += 1
            }
        }
        @Expect(sum, 3)
    }

    @TestCase
    func test_parent_linux(): Unit {
        for ((str, dirname) in path_string_dirname) {
            @Expect(Path(str).parent, dirname)
        }
    }
}
